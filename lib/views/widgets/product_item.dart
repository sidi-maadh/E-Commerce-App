import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/models/product_item_model.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ProductItemModel productItem;
  const ProductItem({super.key, required this.productItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 110,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: AppColors.grey2, // Assuming AppColors.grey2 is defined in your app
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                    imageUrl: productItem.imgUrl,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
                  ),
              ),
              ),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white54,
                  shape: BoxShape.circle,
                ),
                child: IconButton( 
                  onPressed: () {
                  
                  }, 
                  icon: Icon(
                    productItem.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: productItem.isFavorite ? Colors.red : Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Text(
          productItem.name,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          productItem.category,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Colors.grey,
          ),
        ),
        Text(
          '${productItem.price} MRU',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
