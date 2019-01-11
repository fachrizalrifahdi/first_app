import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import 'package:first_app/widgets/products/product_card.dart';
import 'package:first_app/models/product.dart';
import 'package:first_app/scoped-models/main.dart';

class Products extends StatelessWidget {
  Widget _buildProductLists(List<Product> products) {
    Widget productCards;
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(products[index]),
        itemCount: products.length,
      );
    } else {
      productCards = Container();
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');
    return ScopedModelDescendant<MainModel>(builder: (BuildContext context, Widget child, MainModel model){
      return _buildProductLists(model.displayedProducts);
    },);
  }
}
