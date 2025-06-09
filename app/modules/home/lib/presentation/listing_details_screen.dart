import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/domain/blocs/listing_details_cubit.dart';
import 'package:home/domain/blocs/listing_details_state.dart';

class ListingDetailsScreen extends StatefulWidget {
  final int id;

  const ListingDetailsScreen({super.key, required this.id});

  @override
  State<ListingDetailsScreen> createState() => _ListingDetailsScreenState();
}

class _ListingDetailsScreenState extends State<ListingDetailsScreen> {

  @override
  void initState() {
    super.initState();
    context.read<ListingDetailsCubit>().get(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listing Details')),
      body: Center(
        child: Column(
          children: [
            BlocBuilder(
              bloc: context.read<ListingDetailsCubit>(),
              builder: (BuildContext context, ListingDetailsState state) {
                switch (state) {
                  case ListingDetailsStateLoading _:
                    return const CircularProgressIndicator();
                  case ListingDetailsStateError _:
                    return const Text('Error loading listing details');
                  case ListingDetailsStateLoaded state:
                    final listing = state.data;
                    return Column(
                        children: [
                          if (listing.imageBase64 != null)
                            Image.memory(
                              base64Decode(listing.imageBase64!),
                            ),
                          const SizedBox(height: 16.0),
                          Text(
                            listing.title,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(height: 8.0),
                          Text(listing.rentalTier.name),
                          if (listing.platform?.name != null ) ...[
                            const SizedBox(height: 8.0),
                            Text(listing.platform!.name),
                          ],
                          const SizedBox(height: 8.0),
                          if (listing.pricePerAdditionalDay != null) ...[
                            const SizedBox(height: 8.0),
                            Text(
                              'Price per additional day: ${listing.pricePerAdditionalDay}',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                          if (listing.pricePerRent != null) ...[
                            const SizedBox(height: 8.0),
                            Text(
                              'Price per day: ${listing.pricePerRent}',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ]
                        ],
                    );

                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
