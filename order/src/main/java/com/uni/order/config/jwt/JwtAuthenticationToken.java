package com.uni.order.config.jwt;

import lombok.Getter;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;

@Getter
public class JwtAuthenticationToken extends UsernamePasswordAuthenticationToken {

    private final String jwtToken;
    private final String userId;
    private final String email;

    public JwtAuthenticationToken(String userId, String jwtToken, String email) {
        super(userId, null, null);
        this.jwtToken = jwtToken;
        this.userId = userId;
        this.email = email;
    }
}
