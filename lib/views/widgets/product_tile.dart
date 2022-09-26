import 'package:flutter/material.dart';
import 'package:mystore/constants/color_constants.dart';
import 'package:mystore/views/widgets/stars.dart';

import '../../models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    double totalRating = 0;
    double avgRating = 0;

    for (int i = 0; i < product.ratings!.length; i++) {
      totalRating += product.ratings![i]['rating'];
    }
    if (totalRating != 0) {
      avgRating = totalRating / product.ratings!.length;
    }

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      color: ColorConstants.productCardColor,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              children: [
                Image.network(
                  product.images[0],
                  fit: BoxFit.contain,
                  height: 135,
                  width: 135,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Container(
                        width: 205,
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 5,
                        ),
                        child: Stars(
                          rating: avgRating,
                        ),
                      ),
                      Container(
                        width: 205,
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 5,
                        ),
                        child: Text(
                          '\$${product.price}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
