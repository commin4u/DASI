package com.uni.videorental.notification.api.controller;

import com.uni.videorental.notification.api.dto.request.TokenRequestDto;
import com.uni.videorental.notification.domain.TokenRequest;
import com.uni.videorental.notification.service.FirebaseService;
import com.uni.videorental.notification.utils.security.ContextHolderUtils;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RequestMapping(value = "/api/notification")
@RestController
public class FirebaseController {

    private final FirebaseService firebaseService;

    @PostMapping("/token")
    public ResponseEntity<Void> saveToken(@RequestBody @Valid TokenRequestDto request) {
        firebaseService.saveToken(new TokenRequest(request.token(), ContextHolderUtils.getUserId()));

        return ResponseEntity.ok().build();
    }
}
