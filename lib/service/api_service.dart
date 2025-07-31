import 'dart:developer';

import 'package:audioloop/core/constants_url.dart';
import 'package:audioloop/model/product_model.dart';
import 'package:dio/dio.dart';

class ProductService {
  Dio dio = Dio();
  Future<List<ProductModel>> fetchdata() async {
    try {
      var response = await dio.get(
        '${ConstantsUrl().products}',
        queryParameters: {'limit': 100},
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;

        return data.map((item) => ProductModel.fron(item)).toList();
      } else {
        throw Exception('Error with statuscode ${response.statusCode}');
      }
    } catch (e) {
      log('Error found as  $e');
      return [];
    }
  }

  Future<List<dynamic>> fetchAllProducts() async {
    try {
      final response = await dio.get('${ConstantsUrl().products}');
      return response.data;
    } on DioException catch (e) {
      print("Dio error: ${e.message}");
      return [];
    } catch (e) {
      print("Unexpected error: $e");
      return [];
    }
  }
}
 

class SearchService {
  Dio dio = Dio();

  Future<List<ProductModel>> fetchAllProducts() async {
    try {
      final response = await dio.get('${ConstantsUrl().products}');
      if (response.statusCode == 200) {
        List data = response.data;
        return data.map((e) => ProductModel.fron(e)).toList();
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      log("Error fetching all products: $e");
      return [];
    }
  }

  Future<List<ProductModel>> searchProducts(String query) async {
    try {
      final allProducts = await fetchAllProducts();
      return allProducts.where((product) {
        final title = product.title.toLowerCase();
        return title.contains(query.toLowerCase());
      }).toList();
    } catch (e) {
      log("Search error: $e");
      return [];
    }
  }
}
