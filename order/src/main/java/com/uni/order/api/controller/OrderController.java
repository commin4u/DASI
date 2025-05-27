package com.uni.order.api.controller;

import com.uni.order.api.dto.request.OrderRequestDto;
import com.uni.order.api.dto.response.OrderResponseDto;
import com.uni.order.service.OrderService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api/order")
@RequiredArgsConstructor
public class OrderController {

    private final OrderService orderService;

    @GetMapping("/{orderId}")
    public OrderResponseDto getOrderDetails(@PathVariable Long orderId) {
        return orderService.getOrder(orderId);
    }

    @PostMapping("/{videoGameId}")
    public void placeOrder(@RequestBody @Valid OrderRequestDto orderRequestDto, @PathVariable Long videoGameId) {
        orderService.placeOrder(orderRequestDto, videoGameId);
    }
}
