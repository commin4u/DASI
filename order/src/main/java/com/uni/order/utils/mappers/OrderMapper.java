package com.uni.order.utils.mappers;

import com.uni.order.api.dto.request.OrderRequestDto;
import com.uni.order.api.dto.response.OrderResponseDto;
import com.uni.order.model.Order;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.function.Function;

import static com.uni.order.utils.Constants.DATE_FORMAT;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class OrderMapper {
    public static final Function<Order, OrderResponseDto> mapOrderToOrderResponseDto =
            order -> OrderResponseDto.builder()
                    .id(order.getId())
                    .videoGameId(order.getVideoGameId())
                    .orderStatus(String.valueOf(order.getOrderStatus()))
                    .rentalPrice(order.getRentalPrice())
                    .build();

    public static final Function<OrderRequestDto, Order> mapOrderRequestDtoToOrder =
            orderRequestDto -> Order.builder()
                    .startDate(LocalDate.parse(orderRequestDto.startDate(), DATE_FORMAT).atStartOfDay())
                    .build();

}
