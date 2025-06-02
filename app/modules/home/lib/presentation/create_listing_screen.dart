import 'package:flutter/material.dart';

class CreateListingScreen extends StatelessWidget {
  const CreateListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Listing'),
      ),
      body: Center(
        child: Text(
          'Create Listing Screen',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}