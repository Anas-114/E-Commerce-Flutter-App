import 'package:audioloop/controller/product_provider.dart';
import 'package:audioloop/controller/category_provider.dart';
import 'package:audioloop/model/product_model.dart';
import 'package:audioloop/view/widgets/helper_widgets.dart';
import 'package:audioloop/view/widgets/main_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    final cartProvider = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Products"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    final query = _controller.text.trim();
                    if (query.isNotEmpty) {
                      searchProvider.search(query);
                    }
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onSubmitted: (value) {
                final query = value.trim();
                if (query.isNotEmpty) {
                  searchProvider.search(query);
                }
              },
            ),
          ),

          // Results or loader
          Expanded(
            child: Builder(
              builder: (_) {
                if (searchProvider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (searchProvider.searchedlist.isEmpty) {
                  return const Center(
                    child: Text(
                      "No products found",
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                } else {
                  return GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: searchProvider.searchedlist.length,
                    itemBuilder: (context, index) {
                      final product = searchProvider.searchedlist[index];

                      return ECommerceCard(
                        image: product.image,
                        title: product.title,
                        price: product.price,
                        onAddToCart: () => cartProvider.addproduct(product),
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
                                onAddToCart: () => cartProvider.addproduct(product),
                              ),
                            ),
                          );
                        },
                        context: context,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
