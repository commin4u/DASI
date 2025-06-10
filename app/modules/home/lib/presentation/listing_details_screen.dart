import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/domain/blocs/listing_details_cubit.dart';
import 'package:home/domain/blocs/listing_details_state.dart';

class ListingDetailsScreen extends StatelessWidget {
  final String id;

  const ListingDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listing Details')),
      body: Center(
        child: Column(
          children: [
            Image.network(
              "https://www.cdmi.in/courses@2x/2D3D-Game-Design.webp",
            ),
            const SizedBox(height: 16.0),
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
                        Text(
                          listing.title,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 8.0),
                        Text(listing.description ?? 'No description available'),
                      ],
                    );
                }
                return const SizedBox.shrink();
              },
            ),
            Text('Details for listing ID: $id'),
          ],
        ),
      ),
    );
  }
}
