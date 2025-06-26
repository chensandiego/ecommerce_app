
import 'package:flutter/material.dart';
import 'package:ecommerce_app/services/cart_service.dart';
import 'package:ecommerce_app/models/cart_item.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> _cartItems = CartService.getCartItems();

  void _updateCart() {
    setState(() {
      _cartItems = CartService.getCartItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (ctx, i) {
                final item = _cartItems[i];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.product.imageUrl),
                  ),
                  title: Text(item.product.name),
                  subtitle: Text('\$${item.product.price.toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          CartService.removeProduct(item.product);
                          _updateCart();
                        },
                      ),
                      Text('${item.quantity}'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          CartService.addProduct(item.product);
                          _updateCart();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${CartService.getCartTotal().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('Checkout'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
