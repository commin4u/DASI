package com.uni.order.api.dto.response;

public record VideoGameResponse (String title,
                                 String videoGameRentalTier,
                                 Integer pricePerRent,
                                 Integer baseRentDays,
                                 Integer pricePerAdditionalRentDay)  {
}
