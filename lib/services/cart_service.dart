
import 'package:ecommerce_app/models/cart_item.dart';
import 'package:ecommerce_app/models/product.dart';

class CartService {
  static final List<CartItem> _items = [];

  static List<CartItem> getCartItems() {
    return _items;
  }

  static void addProduct(Product product) {
    for (var item in _items) {
      if (item.product.id == product.id) {
        item.quantity++;
        return;
      }
    }
    _items.add(CartItem(product: product));
  }

  static void removeProduct(Product product) {
    for (var item in _items) {
      if (item.product.id == product.id) {
        if (item.quantity > 1) {
          item.quantity--;
        } else {
          _items.remove(item);
        }
        return;
      }
    }
  }

  static double getCartTotal() {
    double total = 0;
    for (var item in _items) {
      total += item.product.price * item.quantity;
    }
    return total;
  }
}
