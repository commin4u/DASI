package com.uni.order.service;


import com.uni.order.api.dto.request.OrderRequestDto;
import com.uni.order.api.dto.response.VideoGameResponse;
import com.uni.order.model.enums.RentalTier;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;


@Service
@RequiredArgsConstructor
public class CalculatorService {

    private final PriceCalculator priceCalculator;
    private final PriceCalculator discountPriceCalculator;
    private final VideoGameService videoGameService;

    public Double calculatePrice(final OrderRequestDto orderRequestDto, final Long videoGameId) {
        final VideoGameResponse videoGameResponse = videoGameService.getVideoGameById(videoGameId);
        final Integer defaultPrice = videoGameResponse.pricePerRent();
        final Integer requestedNoOfDays = orderRequestDto.numberOfDays();
        final RentalTier rentalTier = RentalTier.valueOf(videoGameResponse.videoGameRentalTier());

        if (requestedNoOfDays == 0) {
            return (double) 0;
        }

        return switch (rentalTier) {
            case NEW -> priceCalculator.calculatePrice(defaultPrice, requestedNoOfDays);
            case OLD, REGULAR -> discountPriceCalculator.calculatePrice(defaultPrice, requestedNoOfDays);
        };
    }
}
