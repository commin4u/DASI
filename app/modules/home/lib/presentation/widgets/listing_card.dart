import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home/domain/model/listing.dart';

class ListingCard extends StatelessWidget {
  final Listing listing;

  final double minHeight;

  const ListingCard({
    super.key,
    required this.listing,
    required this.minHeight,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = listing.imageUrl;
    final description = listing.description;
    return IntrinsicHeight(
      child: GestureDetector(
        onTap: () {
          if (listing.id == null) {
            return;
          }
          context.goNamed('listingDetails', pathParameters: {'id': listing.id!});
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: minHeight,
                ),
                child: _imageWidget(imageUrl),
              ),

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
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
      ),
    );
  }

  Widget _imageWidget(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return Image.network(
        'https://cdn2.unrealengine.com/fnbr-34-00-c6s2-1920x1080-2d1d03472e03.jpg',
        fit: BoxFit.cover,
      );
    }
    return Material(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0), bottomRight: Radius.circular(12.0)),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}