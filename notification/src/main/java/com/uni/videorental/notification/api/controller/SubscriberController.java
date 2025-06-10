package com.uni.videorental.notification.api.controller;

import com.uni.videorental.notification.api.dto.response.SubscriberResponse;
import com.uni.videorental.notification.service.ObserverService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/api/subscribers")
@RequiredArgsConstructor
public class SubscriberController {

    private final ObserverService observerService;

//    @GetMapping
//    public List<SubscriberResponse> getSubscribers() {
//        return observerService.getAllSubscribers();
//    }
}
