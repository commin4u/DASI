package com.uni.videorental.notification.mapper;

import com.uni.videorental.notification.domain.TokenRequest;
import com.uni.videorental.notification.entity.TokenEntity;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.util.function.Function;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class RequestTokenMapper {
    public static final Function<TokenRequest, TokenEntity> mapTokenRequestToToken =
            request -> TokenEntity.builder()
                    .token(request.token())
                    .userId(Long.valueOf(request.userId()))
                    .build();
}
