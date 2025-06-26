
import 'package:ecommerce_app/models/product.dart';

class ProductService {
  static final List<Product> _products = [
    Product(
      id: 1,
      name: 'Stylish T-Shirt',
      price: 29.99,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      id: 2,
      name: 'Classic Jeans',
      price: 89.99,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      id: 3,
      name: 'Comfortable Sneakers',
      price: 129.99,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      id: 4,
      name: 'Leather Jacket',
      price: 249.99,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      id: 5,
      name: 'Sunglasses',
      price: 49.99,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      id: 6,
      name: 'Wrist Watch',
      price: 199.99,
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];

  static List<Product> getProducts() {
    return _products;
  }
}
