package com.uni.videorental.notification.mapper;

import com.uni.videorental.notification.api.dto.response.SubscriberResponse;
import com.uni.videorental.notification.model.Subscriber;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.util.function.Function;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class SubscriberMapper {

    public static final Function<Subscriber, SubscriberResponse> mapSubscriberToSubscriberResponse =
            subscriber -> SubscriberResponse.builder()
                    .email(subscriber.getEmail())
                    .build();
}
