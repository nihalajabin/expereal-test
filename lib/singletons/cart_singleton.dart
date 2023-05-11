import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartSingleton {
  static final CartSingleton _singleton = CartSingleton._internal();

  factory CartSingleton() {
    return _singleton;
  }

  CartSingleton._internal();
  static SharedPreferences? _prefs;

  // call this method from iniState() function of mainApp().
  // static Future<SharedPreferences?> init() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   return _prefs;
  // }

  List<CartItem>? get cartItems => _cartItems;
  List<CartItem> _cartItems = [];

  addToCart(Product product) {
    CartItem? cartitem;
    try {
      if (_cartItems.isNotEmpty) {
        for (cartitem in _cartItems) {
          if (cartitem.product?.id == product.id) {
            cartitem.count = cartitem.count! + 1;
            ;
          } else {
            cartitem.count = 1;
            _cartItems.addAll([cartitem]);
          }
        }
      } else {
        cartitem = CartItem(product, 1);
        _cartItems = [cartitem];
      }
    } catch (e) {
      print(e);
    }
  }

  removeFromCart(Product product) {
    try {
      if (_cartItems.isNotEmpty) {
        if (_cartItems.contains(product)) {
          // _cartItems.remove
        }
      }
    } catch (e) {}
  }
}

final singleton = CartSingleton();
