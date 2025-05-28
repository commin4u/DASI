package com.uni.order.service;

import com.uni.order.api.dto.response.InventoryServiceApiResponse;
import com.uni.order.api.dto.response.VideoGameResponse;
import com.uni.order.config.VideoGameServiceConfig;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Slf4j
@Service
public class VideoGameService {

    private final RestTemplate restTemplate;
    private final VideoGameServiceConfig videoGameServiceConfig;

    @Autowired
    public VideoGameService(RestTemplateBuilder restTemplateBuilder,
                            VideoGameServiceConfig config) {
        this.restTemplate = restTemplateBuilder.build();
        this.videoGameServiceConfig = config;
    }

    public VideoGameResponse getVideoGameById(final Long videoGameId) {
        log.info("Requesting game with id=[{}] from inventory service", videoGameId);
        InventoryServiceApiResponse serviceApiResponse = restTemplate.getForObject(videoGameServiceConfig.getVideoGameFullPath(), InventoryServiceApiResponse.class, videoGameId);

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
