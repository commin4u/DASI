package com.uni.inventory.api.controller;

import com.uni.inventory.api.dto.request.VideoGameRequest;
import com.uni.inventory.api.dto.response.VideoGameResponseDto;
import com.uni.inventory.api.exchange.Response;
import com.uni.inventory.service.VideoGameService;
import jakarta.validation.Valid;
import jakarta.validation.ValidationException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

import static org.springframework.http.ResponseEntity.ok;

@RestController
@RequestMapping(value = "/api/video-game")
@RequiredArgsConstructor
public class VideoGameController {

    private final VideoGameService videoGameService;

    @GetMapping("/all")
    public ResponseEntity<Response<List<VideoGameResponseDto>>> getVideoGames() {
        return ok(Response.build(videoGameService.getAllVideoGames()));
    }

    @PostMapping
    public ResponseEntity<Response<VideoGameResponseDto>> addVideoGame(@RequestBody @Valid VideoGameRequest videoGameRequest, Errors validationErrors) {
        if (validationErrors.hasErrors()) {
            throw new ValidationException(validationErrors.getAllErrors().stream()
                    .map(ObjectError::getDefaultMessage)
                    .collect(Collectors.joining("; ")));
        }

        return ok(Response.build(videoGameService.addVideoGame(videoGameRequest)));
    }

    @GetMapping(params = {"videoGameTitle"})
    public ResponseEntity<Response<VideoGameResponseDto>> getVideoGameByTitle(@RequestParam String videoGameTitle) {
        return ok(Response.build(videoGameService.getVideoGameByTitle(videoGameTitle)));
    }

    @PutMapping("/{videoGameId}")
    public VideoGameResponseDto updateVideoGame(@PathVariable Long videoGameId, @RequestBody @Valid VideoGameRequest videoGameRequest, Errors validationErrors) {
        if (validationErrors.hasErrors()) {
            throw new ValidationException(validationErrors.getAllErrors().stream()
                    .map(ObjectError::getDefaultMessage)
                    .collect(Collectors.joining("; ")));
        }

        return videoGameService.updateVideoGame(videoGameId, videoGameRequest);
    }

    @DeleteMapping("/{videoGameId}")
    public void deleteVideoGame(@PathVariable Long videoGameId) {
        videoGameService.deleteVideoGame(videoGameId);
    }
}
