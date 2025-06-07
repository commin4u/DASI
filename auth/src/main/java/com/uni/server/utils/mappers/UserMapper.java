package com.uni.server.utils.mappers;

import com.uni.server.api.dto.request.UserRequestDto;
import com.uni.server.api.dto.response.RentalUserResponse;
import com.uni.server.model.RentalUser;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@RequiredArgsConstructor
@Component
public class UserMapper {

    private final PasswordEncoder passwordEncoder;

    public final RentalUser mapUserRequestToRentalUser(UserRequestDto userRequestDto) {
        return RentalUser.builder()
                .email(userRequestDto.email())
                .password(passwordEncoder.encode(userRequestDto.password()))
                .build();
    }

    public final RentalUserResponse mapRentalUserToUserResponse(RentalUser rentalUser) {
        return RentalUserResponse.builder()
                .id(rentalUser.getId())
                .email(rentalUser.getEmail())
                .build();
    }
}
