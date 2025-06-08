package com.uni.server.api.controller;

import com.uni.server.api.dto.request.UserRequestDto;
import com.uni.server.api.dto.response.RentalUserResponse;
import com.uni.server.api.dto.response.TokenResponse;
import com.uni.server.api.exchange.Response;
import com.uni.server.api.jwt.JwtUtil;
import com.uni.server.config.UserDetailsServiceConfig;
import com.uni.server.model.CustomUserDetails;
import com.uni.server.service.UserService;
import jakarta.validation.Valid;
import jakarta.validation.ValidationException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.stream.Collectors;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.http.ResponseEntity.ok;

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/authentication")
public class RegistrationController {

    private final UserService userService;
    private final JwtUtil jwtUtil;
    private final AuthenticationManager authenticationManager;
    private final UserDetailsServiceConfig customUserDetails;

    @PostMapping(value = "/register", produces = APPLICATION_JSON_VALUE, consumes = APPLICATION_JSON_VALUE)
    public ResponseEntity<Response<RentalUserResponse>> register(@Valid @RequestBody UserRequestDto user, Errors validationErrors) {
        if (validationErrors.hasErrors()) {
            throw new ValidationException(validationErrors.getAllErrors().stream()
                    .map(ObjectError::getDefaultMessage)
                    .collect(Collectors.joining("; ")));
        }
        return ok(Response.build(userService.registerUser(user)));
    }

    @PostMapping(value = "/login", produces = APPLICATION_JSON_VALUE)
    public ResponseEntity<TokenResponse> login(@RequestHeader(HttpHeaders.AUTHORIZATION) String authorizationHeader) {
        if (authorizationHeader == null || !authorizationHeader.startsWith("Basic ")) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }

        String username = extractCredentials(authorizationHeader, 0);
        String password = extractCredentials(authorizationHeader, 1);

        UsernamePasswordAuthenticationToken authenticationToken =
                new UsernamePasswordAuthenticationToken(username, password);
        authenticationManager.authenticate(authenticationToken);

        CustomUserDetails userDetails = (CustomUserDetails) customUserDetails.loadUserByUsername(username);
        String userId = String.valueOf(userDetails.getUserId());
        String token = jwtUtil.generateToken(userId, userDetails.getUsername(), null);

        return ResponseEntity.ok(new TokenResponse(token, 3600));
    }

    private String extractCredentials(String authHeader, int indexPart) {
        String base64 = authHeader.substring("Basic ".length());
        String decoded = new String(Base64.getDecoder().decode(base64), StandardCharsets.UTF_8);
        return decoded.split(":", 2)[indexPart];
    }
}
