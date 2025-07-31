import 'dart:developer';

import 'package:audioloop/model/product_model.dart';
import 'package:audioloop/service/api_service.dart';

import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  bool isloading = false;
  final ProductService service = ProductService();
  List<ProductModel> products = [];

  Future<void> getdata() async {
    isloading = true;
    notifyListeners();

    try {
      products = await service.fetchdata();
    } catch (e, stackTrace) {
      log('Error in getdata(): $e', stackTrace: stackTrace);
    } finally {
      isloading = false;
      notifyListeners();
    }
  }
}

class Cart extends ChangeNotifier {
  List<ProductModel> carted = [];
  bool isLoading = false;
  String? errorMessage;


  double  totalPrice() {
  return carted.fold(0.0, (sum, item) => sum + item.price);
}


  Future<void> loadCartData() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 2));
    } catch (e, stackTrace) {
      log('Error loading cart data: $e', stackTrace: stackTrace);
      errorMessage = 'Failed to load cart. Please try again.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void addproduct(ProductModel added) {
    carted.add(added);
    notifyListeners();
  }

  void removeproduct(ProductModel product) {
    carted.remove(product);
    notifyListeners();
  }
}
