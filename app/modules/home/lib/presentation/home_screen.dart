import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:home/domain/blocs/listing_cubit.dart';
import 'package:home/domain/blocs/listing_state.dart';
import 'package:home/presentation/widgets/listing_card.dart';
import 'package:home/presentation/widgets/listings_horizontal_carousel.dart';

import '../domain/model/listing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listings = [0, 1, 2, 3, 4].map((element) {
      final b = ListingBuilder()
        ..description = 'Description of Game $element'
        ..id = '$element'
        ..type = ListingType.accessory
        ..platform = Platform.xbox360
        ..imageUrl = 'https://fastly.picsum.photos/id/933/200/300.jpg?hmac=8zdipGWKGkHz8wyA9J63P3fzghuUL9wqV5Y34b8mLTI'
        ..title = 'Game $element';
      return b.build();
    }).toList();

    if (context.read<ListingCubit>().state is ListingStateInitial) {
      context.read<ListingCubit>().loadListings();
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Handle notifications action
            },
          ),
        ],
        title: const Column(
          children: [
            Text("GameSwap"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.games),
        onPressed: () {
          context.pushNamed('createListing');
        }
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            BlocBuilder(
                bloc: context.read<ListingCubit>(),
                builder: (BuildContext context, ListingState state) {
                  switch (state) {
                    case ListingStateLoading _:
                      return Center(child: CircularProgressIndicator());
                    case ListingStateError _:
                      return Center(child: Text('Error loading listings'));
                    case ListingStateLoaded state:
                      final listings = state.listings;
                      if (listings.isEmpty) {
                        return Center(child: Text('No listings available'));
                      } else {
                        return ListingsHorizontalCarousel(
                          listings: state.listings,
                          title: 'Featured Listings',
                          onSeeAllPressed: () {},
                        );
                      }
                  }
                  return SizedBox.shrink();
                }
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Recent Listings',
                style: Theme
                  .of(context)
                  .textTheme
                  .headlineLarge,
              ),
            ),
            SizedBox(height: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...listings.map((listing) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: ListingCard(listing: listing),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showAction(BuildContext context, FabAction action) {
    switch (action) {
      case FabAction.ADD_LISTING:
        context.pushNamed('addListing');
        break;
      case FabAction.CREATE_ORDER:
        context.pushNamed('createOrder');
        break;
    }
  }
}

enum FabAction {
  ADD_LISTING,
  CREATE_ORDER,
}