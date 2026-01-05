import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/models/product_item_model.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  void getProductDetails(String id) {
    emit(ProductDetailsLoading());
    Future.delayed(const Duration(seconds: 2), () {
      // Simulate fetching product details
      final selectedProduct = dummyProducts.firstWhere((item) => item.id == id);
      emit(ProductDetailsLoaded(product: selectedProduct));
    });
  }

  void incrementCounter(String productId) {
    final selectedIndex = dummyProducts.indexWhere((item) => item.id == productId);
    dummyProducts[selectedIndex] = dummyProducts[selectedIndex].copyWith(
      quantity: dummyProducts[selectedIndex].quantity + 1,
    );
    emit(QuantityCounterLoaded(dummyProducts[selectedIndex].quantity));
  }
  void decrementCounter(String productId) {
    final selectedIndex = dummyProducts.indexWhere((item) => item.id == productId);
    dummyProducts[selectedIndex] = dummyProducts[selectedIndex].copyWith(
      quantity: dummyProducts[selectedIndex].quantity - 1,
    );
    emit(QuantityCounterLoaded(dummyProducts[selectedIndex].quantity));
  }
  
}
