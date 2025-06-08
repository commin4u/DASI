package com.uni.server.service;

import com.uni.server.api.dto.request.UserRequestDto;
import com.uni.server.api.dto.response.RentalUserResponse;
import com.uni.server.model.RentalUser;
import com.uni.server.repository.UserRepository;
import com.uni.server.utils.mappers.UserMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@AllArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final UserMapper mapper;

    @Transactional
    public RentalUserResponse registerUser(final UserRequestDto userRequestDto) {
        RentalUser rentalUser = mapper.mapUserRequestToRentalUser(userRequestDto);

        return mapper.mapRentalUserToUserResponse(userRepository.save(rentalUser));
    }
}
