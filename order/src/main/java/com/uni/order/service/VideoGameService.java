package com.uni.order.service;

import com.uni.order.api.dto.response.InventoryServiceApiResponse;
import com.uni.order.api.dto.response.VideoGameResponse;
import com.uni.order.config.VideoGameServiceConfig;
import com.uni.order.utils.security.AuthorizationUtility;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import static java.lang.String.format;

@Slf4j
@Service
public class VideoGameService {

    private final RestTemplate restTemplate;

    @Value("${video-game.base-path}")
    private String videoGameServiceBasePath;

    @Autowired
    public VideoGameService(RestTemplateBuilder restTemplateBuilder) {
        this.restTemplate = restTemplateBuilder.build();
    }

    public VideoGameResponse getVideoGameById(final Long videoGameId) {
        log.info("Requesting game with id=[{}] from inventory service", videoGameId);

        HttpEntity<InventoryServiceApiResponse> serviceApiResponseHttpEntity =
                new HttpEntity<>(AuthorizationUtility.prepareHeaderForRestCall());


        InventoryServiceApiResponse serviceApiResponse =
                restTemplate.exchange(videoGameServiceBasePath + videoGameId, HttpMethod.GET, serviceApiResponseHttpEntity, InventoryServiceApiResponse.class).getBody();

        if (serviceApiResponse != null && serviceApiResponse.data() != null) {
            log.info("Game with id=[{}] from inventory service was identified", videoGameId);
            return serviceApiResponse.data();
        } else if (serviceApiResponse != null && serviceApiResponse.error() != null) {
            log.error("Game with id=[{}] from inventory service wasn't identified. Error=[{}]", videoGameId, serviceApiResponse.error());
            return null;
        } else {
            log.error("Request to inventory service has failed");
            return null;
        }
    }
}
