
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/services/cart_service.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin consequat, nisi vel venenatis aliquet, erat ex laoreet massa, ac imperdiet mi nisl sed ex. Vivamus vitae justo at lacus eleifend aliquam. ',
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              CartService.addProduct(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added to cart!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
