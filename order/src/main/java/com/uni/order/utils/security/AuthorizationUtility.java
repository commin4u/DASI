package com.uni.order.utils.security;


import org.springframework.http.HttpHeaders;

public class AuthorizationUtility {
    public static HttpHeaders prepareHeaderForRestCall() {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.set("Authorization", "Bearer " + ContextHolderUtils.getUserToken());

        return httpHeaders;
    }
}
