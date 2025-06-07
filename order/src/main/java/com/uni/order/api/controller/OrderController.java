package com.uni.order.api.controller;

import com.uni.order.api.dto.request.OrderRequestDto;
import com.uni.order.api.dto.response.OrderResponseDto;
import com.uni.order.api.exchange.Response;
import com.uni.order.service.OrderService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static org.springframework.http.ResponseEntity.ok;

@RestController
@RequestMapping(value = "/api/order")
@RequiredArgsConstructor
public class OrderController {

    private final OrderService orderService;

    @GetMapping("/{orderId}")
    public ResponseEntity<Response<OrderResponseDto>> getOrderDetails(@PathVariable Long orderId) {
        return ok(Response.build(orderService.getOrder(orderId)));
    }

    @GetMapping("/all")
    public ResponseEntity<Response<List<OrderResponseDto>>> getAllOrdersByForCurrentUser() {
        return ok(Response.build(orderService.getAllOrdersForCurrentUser()));
    }

    @GetMapping("/unavailable-periods/{videoGameId}")
    public ResponseEntity<Response<List<OrderResponseDto>>> getAllUnavailablePeriods(@PathVariable Long videoGameId) {
        return ok(Response.build(orderService.getAllPlannedOrdersForVideoGameId(videoGameId)));
    }

    @PostMapping("/{videoGameId}")
    public void placeOrder(@RequestBody @Valid OrderRequestDto orderRequestDto, @PathVariable Long videoGameId) {
        orderService.placeOrder(orderRequestDto, videoGameId);
    }
}
