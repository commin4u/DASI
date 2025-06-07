package com.uni.server.api.exchange;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Response<V> {

    private V data;

    private java.lang.Error error;

    public static <V> Response<V> build(V data) {
        return new Response<>(data, null);
    }

    public static Response<?> build(java.lang.Error error) {
        return new Response<>(null, error);
    }

    public static <V> Response<V> build(V data, java.lang.Error error) {
        return new Response<>(data, error);
    }
}
