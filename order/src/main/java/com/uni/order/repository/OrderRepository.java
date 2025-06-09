package com.uni.order.repository;

import com.uni.order.model.Order;
import com.uni.order.model.enums.OrderStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDateTime;
import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findAllByRequestedByUserId(Long userId);

    @Query(value = "SELECT EXISTS(SELECT *\n" +
            "              FROM t_order\n" +
            "              WHERE ((end_date BETWEEN ?1 and ?2)\n" +
            "                 OR (start_date BETWEEN ?1 and ?2))\n" +
            "              AND video_game_id = ?3\n" +
            "              )", nativeQuery = true)
    boolean existsBetweenStartDateAndEndDateByVideoGameId(LocalDateTime startDate, LocalDateTime endDate, Long videoGameId);

    List<Order> findAllByVideoGameIdAndOrderStatusIn(Long videoGameId, List<OrderStatus> statuses);
}
