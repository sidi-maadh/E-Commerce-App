import 'package:ecommerce_app/utils/app_routes.dart';
import 'package:ecommerce_app/view_modes/product_details_cubit/product_details_cubit.dart';
import 'package:ecommerce_app/views/pages/custom_bottom_navbar.dart';
import 'package:ecommerce_app/views/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRouter:
        return MaterialPageRoute(builder: (_) => const CustomBottomNavbar());
      case AppRoutes.productDetailsRouter:
        final String productId = settings.arguments as String;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) {
                  final cubit = ProductDetailsCubit();
                  cubit.getProductDetails(productId);
                  return cubit;
                },
                child: ProductDetailsPage(productId: productId),
              ), // Replace with actual product details page
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                'Page not found',
              ),
            ),
          ),
        );
    }
  }
}
