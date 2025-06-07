package com.uni.server.config;

import com.uni.server.model.CustomUserDetails;
import com.uni.server.model.RentalUser;
import com.uni.server.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class UserDetailsServiceConfig implements UserDetailsService {

    private final UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        RentalUser rentalUser = userRepository.findRentalUserByEmail(username)
                .orElseThrow(() -> new UsernameNotFoundException("User with email=[{}] not found"));

        return new CustomUserDetails(rentalUser.getEmail(), rentalUser.getPassword(), List.of(), rentalUser.getId());
    }
}
