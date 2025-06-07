import 'package:flutter/material.dart';

class CreateOrderScreen extends StatelessWidget {
  const CreateOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Order')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Create your order here'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                
              },
              child: const Text('Create Order'),
            ),
          ],
        ),
      ),
    );
  }
}
