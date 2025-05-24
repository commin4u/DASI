package com.uni.inventory.service;

import com.uni.inventory.api.dto.request.VideoGameRequest;
import com.uni.inventory.api.dto.response.VideoGameResponseDto;
import com.uni.inventory.model.VideoGame;
import com.uni.inventory.repository.VideoGameRepository;
import com.uni.inventory.utils.exceptions.RecordNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.uni.inventory.utils.mappers.VideoGameMapper.mapVideoGameRequestToVideoGame;
import static com.uni.inventory.utils.mappers.VideoGameMapper.mapVideoGameToVideoGameResponse;
import static java.lang.String.format;
import static java.util.stream.Collectors.toList;

@Slf4j
@Service
@RequiredArgsConstructor
public class VideoGameService extends ItemService {

    @Value("${message.video-game.not-found}")
    private String messageVideoGameNotFound;

    private final VideoGameRepository videoGameRepository;

    private final RabbitTemplate rabbitTemplate;

    @Transactional(readOnly = true)
    public List<VideoGameResponseDto> getAllVideoGames() {
        return videoGameRepository
                .findAll()
                .stream()
                .map(mapVideoGameToVideoGameResponse)
                .collect(toList());
    }

    @Transactional
    public VideoGameResponseDto addVideoGame(final VideoGameRequest videoGameRequest) {
        log.info("Adding new video game with title=[{}]", videoGameRequest.title());

        final VideoGameResponseDto videoGameResponse = mapVideoGameToVideoGameResponse
                .apply(videoGameRepository
                        .save(mapVideoGameRequestToVideoGame
                                .apply(videoGameRequest)));
        rabbitTemplate.convertAndSend("notifying-queue", videoGameResponse.title());

//        observerService.notifySubscribers(VideoGameRequest.getTitle());

        return videoGameResponse;
    }

    @Transactional(readOnly = true)
    public VideoGameResponseDto getVideoGameByTitle(final String title) {
        log.info("Requested video game with title=[{}]", title);

        final VideoGame videoGame = videoGameRepository.findVideoGameByTitle(title);

        if (videoGame == null) {
            log.warn("VideoGame with title=[{}] was not found in database", title);
            throw new RecordNotFoundException(format("VideoGame with title %s was not found", title));
        }

        return mapVideoGameToVideoGameResponse.apply(videoGame);
    }

    @Transactional
    public VideoGameResponseDto updateVideoGame(final Long videoGameId, final VideoGameRequest videoGameRequest) {
        log.info("Updating video game with id=[{}]", videoGameId);

        VideoGame videoGame = videoGameRepository.findById(videoGameId)
                .orElseThrow(() -> {
                    log.warn("Video game with id=[{}] was not found in database", videoGameId);
                    return new RecordNotFoundException(format(messageVideoGameNotFound, videoGameId));
                });

        videoGame.setType(videoGameRequest.type());
        videoGame.setPlatform(videoGameRequest.platform());

        return mapVideoGameToVideoGameResponse.apply(videoGameRepository.save(videoGame));
    }

    @Transactional
    public void deleteVideoGame(final Long videoGameId) {
        log.info("Deleting video game with id=[{}]", videoGameId);

        videoGameRepository.deleteById(videoGameId);
    }
}
