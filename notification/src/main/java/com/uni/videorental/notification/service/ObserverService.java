package com.uni.videorental.notification.service;

import com.uni.videorental.notification.api.dto.response.SubscriberResponse;
import com.uni.videorental.notification.model.Subscriber;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;

import static com.uni.videorental.notification.mapper.SubscriberMapper.mapSubscriberToSubscriberResponse;
import static java.util.stream.Collectors.toList;

@Slf4j
@Service
@RequiredArgsConstructor
public class ObserverService {

//    private final InventoryService inventoryService;
//
//    public List<SubscriberResponse> getAllSubscribers() {
//        return inventoryService.getInventory()
//                .findAll()
//                .stream()
//                .map(mapSubscriberToSubscriberResponse)
//                .collect(toList());
//    }
//
//    public void registerSubscriber(final String email) {
//        inventoryService.getInventory().save(new Subscriber(email));
//        log.info("New subscriber was added to newsletter. Email: {}", email);
//    }

    public void notifySubscribers(final String messageToNotify) {
        ///TODO: should call Firebase API
        System.out.println(messageToNotify);
    }
}