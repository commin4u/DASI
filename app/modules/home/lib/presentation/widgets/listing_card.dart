import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home/domain/model/listing.dart';

class ListingCard extends StatelessWidget {
  final Listing listing;

  const ListingCard({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    final imageUrl = listing.imageUrl;
    final description = listing.description;
    return GestureDetector(
      onTap: () {
        context.goNamed('listingDetails', pathParameters: {'id': listing.id});
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imageWidget(imageUrl),

            SizedBox(
              height: 8.0,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                listing.title,
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium,
              ),
            ),

            SizedBox(
              height: 8.0,
            ),

            if (description != null && description.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(description),
              ),

            SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageWidget(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return const Icon(Icons.image_not_supported);
    }
    return Material(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0), bottomRight: Radius.circular(12.0)),
      child: Image.network(
        imageUrl,
        height: 100,
        fit: BoxFit.fill,
      ),
    );
  }
}