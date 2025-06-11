import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home/data/listing_repository.dart';
import 'package:home/domain/model/listing.dart';

part 'add_listing_cubit.freezed.dart';

class AddListingCubit extends Cubit<AddListingState> {
  AddListingCubit({
    required ListingRepository listingRepository,
  }) : _listingRepository = listingRepository,
        super(AddListingState.formData());

  final ListingRepository _listingRepository;

  void onTitleChanged(String title) {
    switch (state) {
      case AddListingStateFormData currentState:
        emit(currentState.copyWith(title: title));
        break;
      case AddListingStateLoading _:
        break;
      case AddListingStateSuccess _:
        break;
      case AddListingStateError _:
        break;
    }
  }

  void onRentalTierChanged(RentalTier? rentalTier) {
    switch (state) {
      case AddListingStateFormData currentState:
        emit(currentState.copyWith(rentalTier: rentalTier));
        break;
      case AddListingStateLoading _:
        break;
      case AddListingStateSuccess _:
        break;
      case AddListingStateError _:
        break;
    }
  }

  void onPlatformChanged(GamePlatform? platform) {
    switch (state) {
      case AddListingStateFormData currentState:
        emit(currentState.copyWith(platform: platform));
        break;
      case AddListingStateLoading _:
        break;
      case AddListingStateSuccess _:
        break;
      case AddListingStateError _:
        break;
    }
  }

  void onImageChanged(File image) {
    switch (state) {
      case AddListingStateFormData currentState:
        emit(currentState.copyWith(image: image));
        break;
      case AddListingStateLoading _:
        break;
      case AddListingStateSuccess _:
        break;
      case AddListingStateError _:
        break;
    }
  }

  Future<void> onSubmit() async {
    final currentState = state;
    if (currentState is AddListingStateFormData) {
      try {
        emit(AddListingState.loading());
        final contentType = DioMediaType.parse('image/${currentState.image!.path.split('.').last}');
        final multipartFile = await MultipartFile.fromFile(
          currentState.image!.path,
          contentType: contentType,
        );
        await _listingRepository.saveListing(
          image: multipartFile,
          title: currentState.title!,
          rentalTier: currentState.rentalTier!.wireName,
          platform: currentState.platform!.wireName,
        );
        emit(AddListingState.success());
      } catch (e) {
        debugPrint('Error adding listing: $e');
        emit(AddListingState.error('Failed to add listing'));
      }

      emit(AddListingState.formData(
        title: currentState.title,
        rentalTier: currentState.rentalTier,
        platform: currentState.platform,
        image: currentState.image,
      ));
    }
  }
}

@freezed
abstract class AddListingState with _$AddListingState {
  factory AddListingState.formData({
    String? title,
    RentalTier? rentalTier,
    GamePlatform? platform,
    File? image,
  }) = AddListingStateFormData;

  factory AddListingState.loading() = AddListingStateLoading;

  factory AddListingState.success() = AddListingStateSuccess;

  factory AddListingState.error(String message) = AddListingStateError;
}

