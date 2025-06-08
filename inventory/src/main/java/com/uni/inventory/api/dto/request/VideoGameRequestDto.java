package com.uni.inventory.api.dto.request;

import com.uni.inventory.model.enums.Platform;
import com.uni.inventory.model.enums.RentalTier;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import java.util.Objects;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class VideoGameRequestDto {
    private @NotNull(message = "Title shouldn't be null") String title;
    private @NotNull(message = "Rental tier shouldn't be null") RentalTier rentalTier;
    private @NotNull(message = "Platform shouldn't be null") Platform platform;
    private @NotNull(message = "Image shouldn't be null") MultipartFile image;
}
