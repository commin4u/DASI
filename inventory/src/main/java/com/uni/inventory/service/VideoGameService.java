package com.uni.inventory.service;

import com.uni.inventory.api.dto.request.VideoGameRequestDto;
import com.uni.inventory.api.dto.response.VideoGameResponseDto;
import com.uni.inventory.model.VideoGame;
import com.uni.inventory.repository.VideoGameRepository;
import com.uni.inventory.utils.exceptions.IllegalOperationException;
import com.uni.inventory.utils.exceptions.RecordNotFoundException;
import com.uni.inventory.utils.security.ContextHolderUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
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
    public VideoGameResponseDto addVideoGame(final VideoGameRequestDto videoGameRequestDto) throws IOException {
        log.info("Adding new video game with title=[{}]", videoGameRequestDto.getTitle());

        final String contentType = validateContentType(videoGameRequestDto.getImage());
        final VideoGame videoGame = mapVideoGameRequestToVideoGame
                .apply(videoGameRequestDto);
        Long userId = validateUserOperationAngGetUserId(videoGame, "create");

        videoGame.setImageData(videoGameRequestDto.getImage().getBytes());
        videoGame.setImageContentType(contentType);
        videoGame.setAddedByUserId(userId);

        VideoGame savedVideoGame = videoGameRepository.save(videoGame);

        log.info("A new video game with title=[{}] was added by user with id=[{}]", videoGameRequestDto.getTitle(), userId);

        final VideoGameResponseDto videoGameResponse = mapVideoGameToVideoGameResponse
                .apply(savedVideoGame);
        rabbitTemplate.convertAndSend("notifying-queue", videoGameResponse.title());

        return videoGameResponse;
    }

    @Transactional(readOnly = true)
    public VideoGameResponseDto getVideoGameById(final Long videoGameId) {
        VideoGame videoGame = videoGameRepository.findById(videoGameId)
                .orElseThrow(() -> {
                    log.warn("Video game with id=[{}] was not found in database", videoGameId);
                    return new RecordNotFoundException(format(messageVideoGameNotFound, videoGameId));
                });
        Long userId = validateUserOperationAngGetUserId(videoGame, "list");

        log.info("Requested details about video game with title=[{}] by user with id=[{}]", videoGameId, userId);

        return mapVideoGameToVideoGameResponse.apply(videoGame);
    }

    @Transactional
    public VideoGameResponseDto updateVideoGame(final Long videoGameId, final VideoGameRequestDto videoGameRequestDto) throws IOException {
        log.info("Updating video game with id=[{}]", videoGameId);
        final String contentType = validateContentType(videoGameRequestDto.getImage());

        VideoGame videoGame = videoGameRepository.findById(videoGameId)
                .orElseThrow(() -> {
                    log.warn("Video game with id=[{}] was not found in database", videoGameId);
                    return new RecordNotFoundException(format(messageVideoGameNotFound, videoGameId));
                });

        Long userId = validateUserOperationAngGetUserId(videoGame, "update");

        videoGame.setRentalTier(videoGameRequestDto.getRentalTier());
        videoGame.setPlatform(videoGameRequestDto.getPlatform());
        videoGame.setImageData(videoGameRequestDto.getImage().getBytes());
        videoGame.setImageContentType(contentType);
        videoGame.setAddedByUserId(userId);

        log.info("Video game with id=[{}] was updated by user with id=[{}]", videoGameId, userId);

        return mapVideoGameToVideoGameResponse.apply(videoGameRepository.save(videoGame));
    }

    @Transactional
    public void deleteVideoGame(final Long videoGameId) {
        VideoGame videoGame = videoGameRepository.findById(videoGameId)
                .orElseThrow(() -> {
                    log.warn("Video game with id=[{}] was not found in database", videoGameId);
                    return new RecordNotFoundException(format(messageVideoGameNotFound, videoGameId));
                });

        Long userId = validateUserOperationAngGetUserId(videoGame, "delete");
        videoGameRepository.deleteById(videoGameId);
        log.info("A video game with id=[{}] was deleted by user with id=[{}]", videoGameId, userId);
    }

    private String validateContentType(final MultipartFile multipartFile) {
        String contentType = multipartFile.getContentType();
        if (contentType == null ||
                (!contentType.equals("image/jpeg") && !contentType.equals("image/png"))) {
            throw new IllegalArgumentException("Only JPEG and PNG images are allowed.");
        }

        return contentType;
    }

    private Long validateUserOperationAngGetUserId(VideoGame videoGame, String operation) {
        String extractedUserId = ContextHolderUtils.getUserId();
        if (extractedUserId != null) {
            final Long userId = Long.valueOf(extractedUserId);

            if (operation.equals("create") || operation.equals("list")) {
                return userId;
            } else if (videoGame.getAddedByUserId().equals(userId)) {
                return userId;
            } else {
                throw new IllegalOperationException("User with id=[" + userId + "] is trying to " + operation + " an item added by another user");
            }
        } else {
            return null;
        }
    }
}

