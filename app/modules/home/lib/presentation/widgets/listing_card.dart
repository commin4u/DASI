import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home/domain/model/listing.dart';

class ListingCard extends StatelessWidget {
  final Listing listing;

  final double minHeight;
  final double maxHeight;
  final double minWidth;
  final double maxWidth;

  const ListingCard({
    super.key,
    required this.listing,
    required this.minHeight,
    required this.maxHeight,
    required this.minWidth,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = listing.imageBase64;
    final description = listing.description;
    return GestureDetector(
      onTap: () {
        if (listing.id == null) {
          return;
        }
        context.goNamed('listingDetails', pathParameters: {'id': listing.id.toString()});
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: minHeight,
                maxHeight: maxHeight,
                minWidth: minWidth,
                maxWidth: maxWidth,
              ),
              child: _imageWidget(imageUrl),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [
                      0.1,
                      0.5,
                    ],
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                  ),
                ),

              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  if (description != null && description.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(description),
                    ),
                  if (listing.platform?.name != null) ...[
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: listing.platform!.chipColor,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Text(
                        listing.platform!.name,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                  SizedBox( height: 16.0, ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _imageWidget(String? imageBase64) {
  if (imageBase64 == null || imageBase64.isEmpty) {
    return Image.network(
      'https://cdn2.unrealengine.com/fnbr-34-00-c6s2-1920x1080-2d1d03472e03.jpg',
      fit: BoxFit.fill,
    );
  }
  return Material(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0), bottomRight: Radius.circular(12.0)),
    child: Image.memory(
      base64Decode(imageBase64),
      fit: BoxFit.fill,
    ),
  );
}

class SmallListingCard extends StatelessWidget {
  final Listing listing;

  const SmallListingCard({
    super.key,
    required this.listing,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = listing.imageBase64;
    final description = listing.description;
    return GestureDetector(
      onTap: () {
        if (listing.id == null) {
          return;
        }
        context.goNamed('listingDetails', pathParameters: {'id': listing.id.toString()});
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            _imageWidget(imageUrl),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [
                      0.2,
                      1.0,
                    ],
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                  ),
                ),

              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      listing.title,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge,
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
                  if (listing.platform?.name != null) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        listing.platform!.name,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}