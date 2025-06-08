package com.uni.order.utils.security;

import com.uni.order.config.jwt.JwtAuthenticationToken;
import lombok.NoArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import static lombok.AccessLevel.PRIVATE;

@NoArgsConstructor(access = PRIVATE)
public class ContextHolderUtils {

    public static Long getUserId() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication instanceof JwtAuthenticationToken) {
            var id = ((JwtAuthenticationToken) authentication).getUserId();
            return Long.valueOf(id);
        }
        return null;
    }

    public static String getUserToken() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication instanceof JwtAuthenticationToken) {
            return ((JwtAuthenticationToken) authentication).getJwtToken();
        }
        return null;
    }
}
