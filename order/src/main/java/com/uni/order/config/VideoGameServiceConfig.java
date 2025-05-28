package com.uni.order.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix = "video-game")
@Getter
@Setter
public class VideoGameServiceConfig {
    private String basePath;
    private String getVideoGamePath;

    public String getVideoGameFullPath() {
        return this.basePath + this.getVideoGamePath;
    }
}
