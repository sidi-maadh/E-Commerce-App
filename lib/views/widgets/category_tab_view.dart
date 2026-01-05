import 'package:ecommerce_app/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryTabView extends StatelessWidget {
  const CategoryTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final category = dummyCategories[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            onTap: () {
              
            },
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: category.bgColor,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
                child: Column(
                  children: [
                    Text(
                      category.name,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: category.textColor,
                      ),
                    ),
                    Text(
                      category.productsCount > 1
                          ? '${category.productsCount} products'
                          : '${category.productsCount} product',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: category.textColor.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount: dummyCategories.length,
    );
  }
}
