import 'package:flutter/material.dart';

class ListingDetailsScreen extends StatelessWidget {
  final String id;

  const ListingDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listing Details'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network("https://www.cdmi.in/courses@2x/2D3D-Game-Design.webp"),
            const SizedBox(height: 16.0),
            Text('Details for listing ID: $id'),
          ],
        ),
      ),
    );
  }
}