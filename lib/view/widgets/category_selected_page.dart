import 'package:audioloop/controller/category_provider.dart';
import 'package:audioloop/controller/product_provider.dart';
import 'package:audioloop/view/widgets/helper_widgets.dart';
import 'package:audioloop/view/widgets/main_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryProductsPage extends StatefulWidget {
  final String category;
  const CategoryProductsPage({super.key, required this.category});

  @override
  State<CategoryProductsPage> createState() => _CategoryProductsPageState();
}

class _CategoryProductsPageState extends State<CategoryProductsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<CategoryProvider>(
        context,
        listen: false,
      ).ProductsCategory(widget.category);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoryProvider>(context);
    final isLoading = provider.isCategoryLoading;
    final products = provider.categoryProducts;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.toUpperCase()),
        backgroundColor: Colors.orange,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return Consumer<Cart>(
                  builder: (context, value, child) => ECommerceCard(
                    context: context,
                    image: product.image,
                    title: product.title,
                    price: product.price,
                    onAddToCart: () {
                      value.addproduct(product);
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailsPage(
                            title: product.title,
                            price: product.price,
                            description: product.description,
                            category: product.category,
                            image: product.image,
                            onAddToCart: () => value.addproduct(product),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
