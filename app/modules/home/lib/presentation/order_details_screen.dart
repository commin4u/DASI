import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/domain/blocs/order_details_cubit.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({
    super.key,
    required this.orderId,
  });

  final int orderId;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {

  @override
  void initState() {
    super.initState();

    context.read<OrderDetailsCubit>().get(widget.orderId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder(
              bloc: context.read<OrderDetailsCubit>(),
              builder: (BuildContext context, OrderDetailsState state) {
                if (state is OrderDetailsStateLoading) {
                  return const CircularProgressIndicator();
                } else if (state is OrderDetailsStateError) {
                  return Text('Error: ${state.message}');
                } else if (state is OrderDetailsStateLoaded) {
                  final order = state.data;
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (state.listing?.imageBase64 != null)
                          Image.memory(
                            base64Decode(state.listing!.imageBase64!),
                            width: MediaQuery.of(context).size.width,
                          ),
                        if (state.listing?.title != null)
                          Text(state.listing!.title,
                          style: Theme.of(context).textTheme.headlineMedium),
                        Text('Status: ${order.orderStatus.name}'),
                        SizedBox(height: 16.0,),
                        Text('Ordered from: ${order.startDate} to ${order.endDate}'),
                        SizedBox(height: 16.0,),
                        Text('Total Price: \$${order.rentalPrice.toStringAsFixed(2)}'),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}
