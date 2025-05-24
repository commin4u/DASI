package com.uni.inventory.utils.mappers;

import com.uni.inventory.api.dto.request.VideoGameRequest;
import com.uni.inventory.api.dto.response.VideoGameResponseDto;
import com.uni.inventory.model.VideoGame;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.util.function.Function;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class VideoGameMapper {

    public static final Function<VideoGameRequest, VideoGame> mapVideoGameRequestToVideoGame =
            videoGameRequest -> VideoGame.builder()
                    .title(videoGameRequest.title())
                    .platform(videoGameRequest.platform())
                    .type(videoGameRequest.type())
                    .build();

    public static final Function<VideoGame, VideoGameResponseDto> mapVideoGameToVideoGameResponse =
            videoGame -> VideoGameResponseDto.builder()
                    .title(videoGame.getTitle())
                    .videoGameType(String.valueOf(videoGame.getType()))
                    .pricePerRent(videoGame.getType().getPriceType().getPriceValue())
                    .baseRentDays(videoGame.getType().getDefaultNumberOfDaysOfRent())
                    .pricePerAdditionalRentDay(videoGame.getType().getPriceType().getPriceValue())
                    .build();

}
