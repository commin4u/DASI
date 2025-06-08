package com.uni.order.api.controller;


import com.uni.order.api.dto.request.OrderRequestDto;
import com.uni.order.api.exchange.Response;
import com.uni.order.service.CalculatorService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import static org.springframework.http.ResponseEntity.ok;


@RestController
@RequestMapping(value = "/api/price")
@RequiredArgsConstructor
public class PriceController {

    private final CalculatorService calculatorService;

    @PostMapping("/{videoGameId}")
    public ResponseEntity<Response<Double>> getOrderPrice(@RequestBody @Valid OrderRequestDto orderRequestDto, @PathVariable Long videoGameId) {
        return ok(Response.build(calculatorService.calculatePrice(orderRequestDto, videoGameId)));
    }
}

