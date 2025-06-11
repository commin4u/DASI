import 'dart:io';

import 'package:authentication/domain/login_bloc.dart';
import 'package:authentication/domain/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:home/domain/blocs/add_listing_cubit.dart';
import 'package:home/domain/blocs/listing_cubit.dart';
import 'package:home/domain/blocs/listing_state.dart';
import 'package:home/domain/model/listing.dart' as model_platform;
import 'package:image_picker/image_picker.dart';

class CreateListingScreen extends StatefulWidget {
  CreateListingScreen({super.key});

  @override
  State<CreateListingScreen> createState() => _CreateListingScreenState();
}

class _CreateListingScreenState extends State<CreateListingScreen> {
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Listing'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () => context.read<AddListingCubit>().onSubmit(),
          ),
        ],
      ),
      body: BlocListener(
        bloc: context.read<AddListingCubit>(),
        listener: (context, AddListingState state) {
          final loginState = context.read<LoginCubit>().state;
          if (loginState is LoginStateSuccess) {
            switch (state) {
              case AddListingStateLoading _:
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Saving listing...')),
                );
                break;
              case AddListingStateSuccess _:
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Listing saved successfully!')),
                );
                context.read<ListingCubit>().loadListings(loginState.userId);
                context.pop(context);
                break;
              case AddListingStateError error:
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: ${error.message}')),
                );
                break;
              case AddListingStateFormData _:
                break;
            }
          }

        },
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  onChanged: context.read<AddListingCubit>().onTitleChanged,
                  onSubmitted: (String value) => context.read<AddListingCubit>().onSubmit(),
                ),
                const SizedBox(height: 16),

                SizedBox(height: 16.0),

                Text(
                  'Select the platform for this listing:',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),

                BlocBuilder(
                    bloc: context.read<AddListingCubit>(),
                    builder: (context, AddListingState state) {
                      if (state is AddListingStateFormData) {
                        return Column(
                          children: model_platform.GamePlatform.values.map((model_platform.GamePlatform platform) {
                            return RadioListTile<model_platform.GamePlatform>(
                              title: Text(platform.name),
                              value: platform,
                              groupValue: state.platform ?? model_platform.GamePlatform.pc,
                              onChanged: (model_platform.GamePlatform? platform) => context.read<AddListingCubit>().onPlatformChanged(platform),
                            );
                          }).toList(),
                        );
                      }
                      return SizedBox.shrink();
                    },
                ),

                SizedBox(height: 16.0),

                Text(
                  'Select the rental tier for this listing:',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),

                const SizedBox(height: 8),
                // Radio buttons for rental tier
                BlocBuilder<AddListingCubit, AddListingState>(
                  builder: (context, state) {
                    if (state is AddListingStateFormData) {
                      return Column(
                        children: model_platform.RentalTier.values.map((model_platform.RentalTier tier) {
                          return RadioListTile<model_platform.RentalTier>(
                            title: Text(tier.name),
                            value: tier,
                            groupValue: state.rentalTier ?? model_platform.RentalTier.regular,
                            onChanged: (model_platform.RentalTier? rentalTier) => context.read<AddListingCubit>().onRentalTierChanged(rentalTier),
                          );
                        }).toList(),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),

                const SizedBox(height: 16),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 48),
                      backgroundColor: Theme.of(context).buttonTheme.colorScheme?.primary,
                      foregroundColor: Theme.of(context).buttonTheme.colorScheme?.onPrimary,
                    ),
                  onPressed: () async {
                    final image = await _picker.pickImage(source: ImageSource.gallery);
                    context.read<AddListingCubit>().onImageChanged(File(image!.path));
                  },
                  child: Text("Pick game disk image",
                  style:
                  Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).buttonTheme.colorScheme?.onPrimary)
                    ,),
                ),

                const SizedBox(height: 16),

                BlocBuilder(
                    bloc: context.read<AddListingCubit>(),
                    builder: (context, AddListingState state) {
                      if (state is AddListingStateFormData && state.image != null) {
                        return Image.file(state.image!);
                      }
                      return SizedBox.shrink();
                    },
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}