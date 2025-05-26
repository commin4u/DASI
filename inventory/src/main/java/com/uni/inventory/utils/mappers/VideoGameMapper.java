package com.uni.inventory.utils.mappers;

import com.uni.inventory.api.dto.request.VideoGameRequestDto;
import com.uni.inventory.api.dto.response.VideoGameResponseDto;
import com.uni.inventory.model.VideoGame;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.util.function.Function;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class VideoGameMapper {

    public static final Function<VideoGameRequestDto, VideoGame> mapVideoGameRequestToVideoGame =
            videoGameRequestDto -> VideoGame.builder()
                    .title(videoGameRequestDto.title())
                    .platform(videoGameRequestDto.platform())
                    .rentalTier(videoGameRequestDto.rentalTier())
                    .build();

    public static final Function<VideoGame, VideoGameResponseDto> mapVideoGameToVideoGameResponse =
            videoGame -> VideoGameResponseDto.builder()
                    .title(videoGame.getTitle())
                    .videoGameRentalTier(String.valueOf(videoGame.getRentalTier()))
                    .pricePerRent(videoGame.getRentalTier().getPriceType().getPriceValue())
                    .baseRentDays(videoGame.getRentalTier().getDefaultNumberOfDaysOfRent())
                    .pricePerAdditionalRentDay(videoGame.getRentalTier().getPriceType().getPriceValue())
                    .build();

}
