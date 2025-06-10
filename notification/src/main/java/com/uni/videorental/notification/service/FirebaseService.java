package com.uni.videorental.notification.service;

import com.uni.videorental.notification.domain.TokenRequest;
import com.uni.videorental.notification.entity.TokenEntity;
import com.uni.videorental.notification.repository.FirebaseRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

import static com.uni.videorental.notification.mapper.RequestTokenMapper.mapTokenRequestToToken;

@Service
@RequiredArgsConstructor
public class FirebaseService {

    private final FirebaseRepository firebaseRepository;

    public void saveToken(final TokenRequest request) {
        var entity = mapTokenRequestToToken.apply(request);

        Optional<TokenEntity> tokenFromDb = firebaseRepository.findByUserId(entity.getUserId());

        if (tokenFromDb.isEmpty()) {
            firebaseRepository.save(entity);
        } else {
            var tokenToUpdate = tokenFromDb.get();
            tokenToUpdate.setToken(entity.getToken());
            tokenToUpdate.setUserId(entity.getUserId());
            firebaseRepository.save(tokenToUpdate);
        }
    }
}
