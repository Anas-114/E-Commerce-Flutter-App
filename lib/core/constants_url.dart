class ConstantsUrl {
  static const String baseUrl = 'https://fakestoreapi.com';

  // Endpoints
  final String products = '$baseUrl/products';
  final String allCategories = '$baseUrl/products/categories';
 
  String category(String categoryName) => '$baseUrl/products/category/$categoryName';
}
