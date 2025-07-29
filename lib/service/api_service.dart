import 'dart:developer';

import 'package:audioloop/model/product_model.dart';
import 'package:dio/dio.dart';

class ProductService {
  Dio dio = Dio();
  Future<List<ProductModel>> fetchdata() async {
    try {
      var response = await dio.get('https://fakestoreapi.com/products');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;

        return data.map((item) => ProductModel.fron(item)).toList();
      } else {
        throw Exception('we have some if else error');
      }
    } catch (e) {
      log('no issue its an error $e');
      return [];
    }
  }
}
