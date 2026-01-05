import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/view_modes/product_details_cubit/product_details_cubit.dart';
import 'package:ecommerce_app/views/widgets/counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productId;
  const ProductDetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      bloc: BlocProvider.of<ProductDetailsCubit>(context),
      buildWhen: (previous, current) => current is! QuantityCounterLoaded,
      builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is ProductDetailsLoaded) {
          final product = state.product;
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text('Product Details'),
              centerTitle: true,
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
              ],
            ),
            body: Stack(
              children: [
                Container(
                  height: size.height * 0.5,
                  width: double.infinity,
                  decoration: BoxDecoration(color: AppColors.grey2),
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.1),
                      CachedNetworkImage(
                        imageUrl: product.imgUrl,
                        height: size.height * 0.4,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.5),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(36.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: AppColors.yellow,
                                        size: 25.0,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        product.averageRating.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              BlocBuilder<
                                ProductDetailsCubit,
                                ProductDetailsState
                              >(
                                bloc: BlocProvider.of<ProductDetailsCubit>(
                                  context,
                                ),
                                buildWhen:
                                    (previous, current) =>
                                        current is QuantityCounterLoaded ||
                                        current is ProductDetailsLoaded,
                                builder: (context, state) {
                                  if (state is QuantityCounterLoaded) {
                                    return CounterWidget(
                                      value: state.value,
                                      productId: product.id,
                                      cubit:
                                          BlocProvider.of<ProductDetailsCubit>(
                                            context,
                                          ),
                                    );
                                  } else if (state is ProductDetailsLoaded) {
                                    return CounterWidget(
                                      value: state.product.quantity,
                                      productId: product.id,
                                      cubit: BlocProvider.of<
                                        ProductDetailsCubit
                                      >(
                                        context,
                                      ), // This should be replaced with a dynamic counter value
                                    );
                                  } else {
                                    return const SizedBox.shrink();
                                  }
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            'Size',
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children:
                                ProductSize.values
                                    .map(
                                      (size) => Padding(
                                        padding: const EdgeInsets.only(
                                          top: 4.0,
                                          right: 4.0,
                                        ),
                                        child: InkWell(
                                          onTap: () {},
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.grey2,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                12.0,
                                              ),
                                              child: Text(size.name),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            'Description',
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            product.description,
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: AppColors.black45),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${product.price.toStringAsFixed(2)}',
                                style: Theme.of(context).textTheme.titleLarge!
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is ProductDetailsError) {
          return Scaffold(
            appBar: AppBar(title: const Text('Product Details')),
            body: Center(child: Text(state.message)),
          );
        } else {
          return const Scaffold(body: Center(child: Text('Unknown state')));
        }
      },
    );
  }
}
