part of 'product_details_cubit.dart';

sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsLoaded extends ProductDetailsState {
  final ProductItemModel product;

  ProductDetailsLoaded({required this.product});
}

final class QuantityCounterLoaded extends ProductDetailsState {
  final int value;

  QuantityCounterLoaded(this.value);
}

final class ProductDetailsError extends ProductDetailsState {
  ProductDetailsError(this.message);

  final String message;
}
