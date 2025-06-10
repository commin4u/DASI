package com.uni.videorental.notification.config;

import org.springframework.amqp.core.Queue;
import org.springframework.amqp.rabbit.annotation.EnableRabbit;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableRabbit
public class RabbitConfig {

    @Bean
    public Queue notifyingQueue() {
        return new Queue("notifying-queue", true); // durable queue
    }

    @Bean
    public Queue subscribingQueue() {
        return new Queue("subscribing-queue", true); // durable queue
    }
}
