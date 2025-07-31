import 'package:audioloop/core/constants_url.dart';
import 'package:dio/dio.dart';
import '../model/product_model.dart';

class CatService {
  final Dio dio = Dio();

  Future<List<ProductModel>> fetchByCategory(String category) async {
    try {
      final formattedCategory = category.toLowerCase().replaceAll(' ', '%20');
      final String url = ConstantsUrl().category(formattedCategory);

      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data as List;
        return data.map((e) => ProductModel.fron(e)).toList();
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}

class CategoryService {
  Future<List<String>> fetchCategories() async {
    final response = await Dio().get('${ConstantsUrl().allCategories}');
    if (response.statusCode == 200) {
      return List<String>.from(response.data);
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
