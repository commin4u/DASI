package com.uni.order.service;

import com.uni.order.api.dto.request.OrderRequestDto;
import com.uni.order.api.dto.response.OrderResponseDto;
import com.uni.order.model.Order;
import com.uni.order.model.enums.OrderStatus;
import com.uni.order.repository.OrderRepository;
import com.uni.order.utils.exceptions.RecordNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.time.LocalDate;

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

    public void placeOrder(final OrderRequestDto orderRequestDto, final Long videoGameId) {
        log.info("Adding a new order for video game with id=[{}]", videoGameId);

        final Double orderPrice = calculatorService.calculatePrice(orderRequestDto, videoGameId);
        final Order order = Order.builder()
                .videoGameId(videoGameId)
                .rentalPrice(orderPrice)
                .startDate(LocalDate.parse(orderRequestDto.startDate(), DATE_FORMAT).atStartOfDay())
                .endDate(LocalDate.parse(orderRequestDto.startDate(), DATE_FORMAT).atStartOfDay().plusDays(orderRequestDto.numberOfDays()))
                .orderStatus(OrderStatus.CREATED)
                .build();

        orderRepository.save(order);
    }

    public OrderResponseDto getOrder(final Long orderId) {
        Order order = orderRepository.findById(orderId)
                .orElseThrow(() -> {
                    log.warn("Order with id=[{}] was not found in database", orderId);
                    return new RecordNotFoundException(format(messageOrderNotFound, orderId));
                });

        return mapOrderToOrderResponseDto.apply(order);
    }
}
