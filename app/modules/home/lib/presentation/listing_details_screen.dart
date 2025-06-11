import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:home/domain/blocs/create_order_cubit.dart';
import 'package:home/domain/blocs/create_order_state.dart';
import 'package:home/domain/blocs/listing_details_cubit.dart';
import 'package:home/domain/blocs/listing_details_state.dart';
import 'package:intl/intl.dart';

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
            context.pop();
          }
        },
        child: BlocBuilder(
          bloc: context.read<ListingDetailsCubit>(),
          builder: (BuildContext context, ListingDetailsState state) {
            switch (state) {
              case ListingDetailsStateLoading _:
                return Center(child: const CircularProgressIndicator());
              case ListingDetailsStateError _:
                return Center(child: const Text('Error loading listing details'));
              case ListingDetailsStateLoaded state:
                final listing = state.data;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (listing.imageBase64 != null)
                          Image.memory(
                            base64Decode(listing.imageBase64!),
                            width: MediaQuery.of(context).size.width,
                          ),
                        const SizedBox(height: 16.0),
                        Text(
                          listing.title,
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        if (listing.platform?.name != null ) ...[
                          const SizedBox(height: 16.0),
                          Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: listing.platform!.chipColor,
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Text(listing.platform!.name)),
                        ],
                        const SizedBox(height: 8.0),
                        Text(
                          'Rental type: ${listing.rentalTier.name}',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        if (listing.pricePerAdditionalDay != null) ...[
                          const SizedBox(height: 16.0),
                          Text(
                            'Price per additional day: ${listing.pricePerAdditionalDay}',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ],

                        const Spacer(),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                            ),
                            onPressed: () async {
                              final listingId = listing.id;

                              if (listingId == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Listing ID is not available')),
                                );
                                return;
                              }

                              final dateRange = await showDateRangePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 31)));
                              final startDate = dateRange?.start;
                              final numberOfDays = dateRange?.duration.inDays;

                              if (startDate == null || numberOfDays == null || numberOfDays <= 0) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Please select a valid date range')),
                                );
                                return;
                              }
                              context.read<CreateOrderCubit>().submitOrderRequest(
                                listingId: listingId,
                                startDate: DateFormat('dd-MM-yyyy').format(startDate),
                                numberOfDays: numberOfDays,
                              );
                            },

                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              child: Text(
                                'Price per day: ${listing.pricePerRent}',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16.0),
                      ],
                  ),
                );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
