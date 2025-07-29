import 'package:audioloop/model/product_model.dart';
import 'package:audioloop/service/api_service.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  ProductService service = ProductService();
  List<ProductModel> products = [];

  Future<void> getdata() async {
    products = await service.fetchdata();
    notifyListeners();
  }
}
