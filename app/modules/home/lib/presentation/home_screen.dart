import 'package:authentication/domain/login_bloc.dart';
import 'package:authentication/domain/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:home/domain/blocs/create_order_cubit.dart';
import 'package:home/domain/blocs/create_order_state.dart';
import 'package:home/domain/blocs/listing_cubit.dart';
import 'package:home/domain/blocs/listing_state.dart';
import 'package:home/domain/model/listing.dart';
import 'package:home/presentation/widgets/listing_card.dart';
import 'package:home/presentation/widgets/listings_horizontal_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    final loginState = context.read<LoginCubit>().state;
    if (loginState is LoginStateSuccess) {
      context.read<ListingCubit>().loadListings(loginState.userId);
    } else {
      context.read<ListingCubit>().loadListings(null);
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: BlocListener(
        bloc: context.read<CreateOrderCubit>(),
        listener: (BuildContext context, CreateOrderState state) {
          if (state is CreateOrderStateError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is CreateOrderStatePlaced) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Order placed successfully')),
            );
            final loginState = context.read<LoginCubit>().state;
            if (loginState is LoginStateSuccess) {
              context.read<ListingCubit>().loadListings(loginState.userId);
            }
          }
        },
        child: BlocListener(
          bloc: context.read<ListingCubit>(),
          listener: (BuildContext context, ListingState state) {
            if (state is ListingStateError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(height: 32.0),
              ),

              SliverToBoxAdapter(
                child: BlocConsumer(
                  listener: (BuildContext context, LoginState state) {
                    if (state is LoginStateSuccess) {
                      context.read<ListingCubit>().loadListings(state.userId);
                    }
                  },
                    bloc: context.read<LoginCubit>(),
                    builder: (BuildContext context, LoginState state) {
                      if (state is LoginStateSuccess) {
                        return BlocBuilder(
                          bloc: context.read<ListingCubit>(),
                          builder: (BuildContext context, ListingState state) {
                            if (state is ListingStateLoaded) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Text(
                                      "My Games",
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .headlineLarge,
                                    ),
                                  ),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minHeight: MediaQuery.of(context).size.height * 0.2,
                                      maxHeight: MediaQuery.of(context).size.height * 0.2,
                                    ),
                                    child: CarouselView.weighted(
                                      flexWeights: [1, 1, 1],
                                      itemSnapping: true,
                                      enableSplash: false,
                                      children: state.myGames.map((Listing listing) {
                                        return SmallListingCard(listing: listing);
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              );
                            }
                            return SizedBox.shrink();
                          },
                        );
                      }
                      return SizedBox.shrink();
                    }
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 16.0),
              ),
              SliverToBoxAdapter(
                child: BlocBuilder(
                    bloc: context.read<ListingCubit>(),
                    builder: (BuildContext context, ListingState state) {
                      if (state is ListingStateLoaded) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                "My Orders",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headlineLarge,
                              ),
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: MediaQuery.of(context).size.height * 0.2,
                                maxHeight: MediaQuery.of(context).size.height * 0.2,
                              ),
                              child: CarouselView.weighted(
                                flexWeights: [1, 1, 1],
                                enableSplash: false,
                                itemSnapping: true,
                                children: state.myOrders.map((VideoGameWIthOrderDto order) {
                                  return SmallOrderCard(order: order);

                                }).toList(),
                              ),
                            ),
                          ],
                        );
                      }
                      return SizedBox.shrink();
                    }),

              ),
              // Carousel
              SliverToBoxAdapter(
                child: BlocBuilder(
                    bloc: context.read<ListingCubit>(),
                    builder: (BuildContext context, ListingState state) {
                      switch (state) {
                        case ListingStateLoading _:
                          return const Center(child: CircularProgressIndicator());
                        case ListingStateError _:
                          return const Center(child: Text('Error loading listings'));
                        case ListingStateLoaded state:
                          final listings = state.carouselListings;
                          if (listings.isEmpty) {
                            return const Center(child: Text('No listings available'));
                          }
                          return ListingsHorizontalCarousel(
                            title: 'Featured Listings',
                            onSeeAllPressed: () {
                              context.pushNamed('listingDetails');
                            },
                            listings: listings,
                          );
                      }
                      return const SizedBox.shrink();
                    }
                ),
              ),

              // Spacing
              const SliverToBoxAdapter(
                child: SizedBox(height: 16),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("Recent Listings",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge,
                  ),
                ),
              ),

              const SliverToBoxAdapter(
                child: SizedBox(height: 16),
              ),

              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                sliver: BlocBuilder(
                    bloc: context.read<ListingCubit>(),
                    builder: (BuildContext context, ListingState state) {
                      switch (state) {
                        case ListingStateLoading _:
                          return const SliverFillRemaining(
                            child: Center(child: CircularProgressIndicator()),
                          );
                        case ListingStateError _:
                          return const SliverFillRemaining(
                            child: Center(child: Text('Error loading listings')),
                          );
                        case ListingStateLoaded state:
                          if (state.fullListListings.isEmpty) {
                            return const SliverFillRemaining(
                              child: Center(child: Text('No listings available')),
                            );
                          }
                          return SliverGrid(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                              final item = state.fullListListings[index];
                              return SmallListingCard( listing: item );
                            },
                              childCount: state.fullListListings.length,
                            ),
                          );
                      }
                      return const SliverFillRemaining(
                        child: Center(child: Text('No listings available')),
                      );
                    }
                ),
              ),

              // Bottom padding
              const SliverToBoxAdapter(
                child: SizedBox(height: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
