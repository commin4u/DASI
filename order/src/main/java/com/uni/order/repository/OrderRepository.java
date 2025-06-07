package com.uni.order.repository;

import com.uni.order.model.Order;
import com.uni.order.model.enums.OrderStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;
import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findAllByRequestedByUserId(Long userId);
    boolean existsByStartDateBeforeAndEndDate(LocalDateTime startDate, LocalDateTime endDate);
    List<Order> findAllByVideoGameIdAndOrderStatusIn(Long videoGameId, List<OrderStatus> statuses);
}
