import 'package:e_commerce/E-commerce/presentation/widgets/home/widgets/product_method.dart';
import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate {
  List productsList = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ProductMethod.productsSearch(productsList, query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ProductMethod.productsSearch(productsList, query);
  }
}
