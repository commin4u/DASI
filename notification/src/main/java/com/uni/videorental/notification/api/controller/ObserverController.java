package com.uni.videorental.notification.api.controller;

import com.uni.videorental.notification.service.ObserverService;
import lombok.RequiredArgsConstructor;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ObserverController {

    private final ObserverService observerService;

    //TODO: implement newsletter
//    @RabbitListener(queues = "subscribing-queue")
//    public void subscribeUser(String email) {
//        observerService.registerSubscriber(email);
//    }

    @RabbitListener(queues = "notifying-queue")
    public void notifySubscribers(final String filmTitle) {
        observerService.notifySubscribers(filmTitle);
    }

}
