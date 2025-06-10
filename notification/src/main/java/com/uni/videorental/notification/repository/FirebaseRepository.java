package com.uni.videorental.notification.repository;

import com.uni.videorental.notification.entity.TokenEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface FirebaseRepository extends JpaRepository<TokenEntity, Long> {
    Optional<TokenEntity> findByUserId(Long userId);

}
