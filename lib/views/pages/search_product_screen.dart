// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mystore/models/product.dart';
import 'package:mystore/services/product_services.dart';
import 'package:mystore/utils/loader.dart';
import 'package:mystore/views/widgets/product_tile.dart';

class SearchProductScreen extends StatefulWidget {
  final String query;
  const SearchProductScreen({
    Key? key,
    required this.query,
  }) : super(key: key);

  @override
  State<SearchProductScreen> createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  ProductServices productServices = ProductServices();
  List<Product>? productsList;
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  fetchProducts() async {
    productsList = await productServices.searchProducts(query: widget.query);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: productsList == null
            ? const Loader()
            : ListView.builder(
                itemCount: productsList!.length,
                itemBuilder: (context, index) {
                  var product = productsList![index];
                  return ProductTile(product: product);
                },
              ),
      ),
    );
  }
}
