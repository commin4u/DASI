import 'package:flutter/material.dart';
import 'package:home/domain/model/listing.dart';
import 'package:home/presentation/widgets/listing_card.dart';

class ListingsHorizontalCarousel extends StatelessWidget {
  final List<Listing> listings;
  final String title;
  final VoidCallback? onSeeAllPressed;

  const ListingsHorizontalCarousel({
    super.key,
    required this.listings,
    required this.title,
    this.onSeeAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineLarge,
              ),
              if (onSeeAllPressed != null)
                TextButton(
                  onPressed: onSeeAllPressed,
                  child: const Text('See All'),
                ),
            ],
          ),
        ),

        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: height / 2,
          ),
          child: CarouselView.weighted(
            flexWeights: [1, 7, 1],
            itemSnapping: true,
            enableSplash: false,
            children: listings.map((listing) => ListingCard(
              listing: listing,
              minHeight: height / 3.5,
            )).toList(),
          ),
        ),
      ],
    );
  }
}
