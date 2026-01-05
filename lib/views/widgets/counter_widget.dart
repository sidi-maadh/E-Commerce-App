import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final int value;
  final String productId;
  final dynamic cubit;
  const CounterWidget({
    super.key,
    required this.value,
    required this.productId,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.grey2,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => cubit.decrementCounter(productId),
            icon: const Icon(Icons.remove, color: AppColors.black),
          ),
          Text(
            value.toString(), // This should be replaced with a dynamic counter value
            style: TextStyle(color: AppColors.black, fontSize: 16.0),
          ),
          IconButton(
            onPressed: () => cubit.incrementCounter(productId),
            icon: const Icon(Icons.add, color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
