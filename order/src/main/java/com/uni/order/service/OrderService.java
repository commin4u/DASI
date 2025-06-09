package com.uni.order.service;

import com.uni.order.api.dto.request.OrderRequestDto;
import com.uni.order.api.dto.response.OrderResponseDto;
import com.uni.order.model.Order;
import com.uni.order.model.enums.OrderStatus;
import com.uni.order.repository.OrderRepository;
import com.uni.order.utils.exceptions.RangeUnavailableForOrderException;
import com.uni.order.utils.exceptions.RecordNotFoundException;
import com.uni.order.utils.exceptions.UserNotLoggedInException;
import com.uni.order.utils.security.ContextHolderUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

import static com.uni.order.utils.Constants.DATE_FORMAT;
import static com.uni.order.utils.mappers.OrderMapper.mapOrderToOrderResponseDto;
import static java.lang.String.format;

@Slf4j
@Service
@RequiredArgsConstructor
public class OrderService {
    @Value("${message.order.not-found}")
    private String messageOrderNotFound;

    private final OrderRepository orderRepository;
    private final CalculatorService calculatorService;

    @Transactional
    public void placeOrder(final OrderRequestDto orderRequestDto, final Long videoGameId) {
        log.info("Adding a new order for video game with id=[{}]", videoGameId);
        var userId = ContextHolderUtils.getUserId();
        var startDate = LocalDate.parse(orderRequestDto.startDate(), DATE_FORMAT).atStartOfDay();
        var endDate = LocalDate.parse(orderRequestDto.startDate(), DATE_FORMAT).atStartOfDay().plusDays(orderRequestDto.numberOfDays());

        if (validateIfVideoGameIsAvailableForOrder(startDate, endDate, videoGameId)) {
            var orderPrice = calculatorService.calculatePrice(orderRequestDto, videoGameId);
            var order = Order.builder()
                    .videoGameId(videoGameId)
                    .rentalPrice(orderPrice)
                    .requestedByUserId(userId)
                    .startDate(startDate)
                    .endDate(endDate)
                    .orderStatus(OrderStatus.CREATED)
                    .build();

            orderRepository.save(order);
            log.info("Order was successfully placed for video game with id=[{}] by user with id=[{}]", videoGameId, ContextHolderUtils.getUserId());
        } else {
            log.error("Order placed by user with id=[{}] for video game with id=[{}] was rejected. Requested range is unavailable for order", userId, videoGameId);
            throw new RangeUnavailableForOrderException("Requested range is unavailable for order");
        }
    }

    @Transactional(readOnly = true)
    public OrderResponseDto getOrder(final Long orderId) {
        var order = orderRepository.findById(orderId)
                .orElseThrow(() -> {
                    log.warn("Order with id=[{}] was not found in database", orderId);
                    return new RecordNotFoundException(format(messageOrderNotFound, orderId));
                });

        return mapOrderToOrderResponseDto.apply(order);
    }

    @Transactional(readOnly = true)
    public List<OrderResponseDto> getAllOrdersForCurrentUser() {
        var userId = ContextHolderUtils.getUserId();

        if (userId != null) {
            return orderRepository.findAllByRequestedByUserId(userId)
                    .stream()
                    .map(mapOrderToOrderResponseDto)
                    .collect(Collectors.toList());
        } else {
            throw new UserNotLoggedInException("There are no user details in the context");
        }
    }

    @Transactional(readOnly = true)
    public List<OrderResponseDto> getAllPlannedOrdersForVideoGameId(final Long videoGameId) {
        return orderRepository.findAllByVideoGameIdAndOrderStatusIn(videoGameId, List.of(OrderStatus.CREATED, OrderStatus.IN_PROGRESS))
                .stream()
                .map(mapOrderToOrderResponseDto)
                .collect(Collectors.toList());
    }

    private boolean validateIfVideoGameIsAvailableForOrder(final LocalDateTime startDate, final LocalDateTime endDate, final Long videoGameId) {
        return !orderRepository.existsBetweenStartDateAndEndDateByVideoGameId(startDate, endDate, videoGameId);
    }

}
