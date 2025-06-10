package com.uni.videorental.notification.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Slf4j
public class Subscriber implements Observer {
    private String email;

    @Override
    public void receiveEmail(final String filmTitle) {
        log.info("A new film called {} was added to the store", filmTitle);
    }
}
