package com.uni.server.repository;

import com.uni.server.model.RentalUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<RentalUser, Long> {
    Optional<RentalUser> findRentalUserByEmail(String email);
}
