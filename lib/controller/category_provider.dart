import 'package:audioloop/service/api_service.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../service/product_service.dart';

class CategoryProvider with ChangeNotifier {
  final CatService categoryService = CatService();

  List<ProductModel> categoryProducts = [];
  bool isCategoryLoading = false;

  Future<void> ProductsCategory(String category) async {
    isCategoryLoading = true;
    notifyListeners();

    try {
      categoryProducts = await categoryService.Category(category);
    } catch (e) {
      print("Error in provider: $e");
    }

    isCategoryLoading = false;
    notifyListeners();
  }
}

class SearchProvider extends ChangeNotifier {
  final SearchService service = SearchService();

  List<ProductModel> searchedlist = [];
  bool isLoading = false;

  Future<void> search(String query) async {
    isLoading = true;
    notifyListeners();

    try {
      searchedlist = await service.searchProducts(query);
    } catch (e) {
      print("SearchProvider error: $e");
      searchedlist = [];
    }

    isLoading = false;
    notifyListeners();
  }
}
