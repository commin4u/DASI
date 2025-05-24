package com.uni.inventory.model;

import com.uni.inventory.model.enums.Platform;
import com.uni.inventory.model.enums.Type;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Generated;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "t_video_game")
@Builder(toBuilder = true)
public class VideoGame implements Item {

    @Id
    @Column
    @SequenceGenerator(name = "video_game_id_generator", sequenceName = "seq_video_game", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "video_game_id_generator")
    private Long id;

    @Column
    private String title;
    //    The store has three types of VideoGames.
    //1. New releases – For each day rented, the <premium price> is charged.
    //2. Regular VideoGames – A flat price of <basic price> is charged for the 3 days, and then
    //for each additional day <basic price> is charged per day.
    //3. Old VideoGames – A flat price of <basic price> is charged for the first 5 days, and then
    //for each additional day <basic price> is charged per day.

    @Enumerated(EnumType.STRING)
    private Type type;

    @Enumerated(EnumType.STRING)
    private Platform platform;
}