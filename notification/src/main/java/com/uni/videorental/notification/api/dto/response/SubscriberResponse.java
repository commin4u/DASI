package com.uni.videorental.notification.api.dto.response;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@Getter
@Setter
public class SubscriberResponse {
    private String email;
}
