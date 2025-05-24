package com.uni.inventory.repository;

import com.uni.inventory.model.VideoGame;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VideoGameRepository extends JpaRepository<VideoGame, Long> {

    VideoGame findVideoGameByTitle(String title);
}
