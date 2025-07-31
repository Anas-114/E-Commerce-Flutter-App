import 'package:audioloop/controller/product_provider.dart';
import 'package:audioloop/model/product_model.dart';
import 'package:audioloop/view/widgets/appbar_style.dart';
import 'package:audioloop/view/pages/cart_page.dart';
import 'package:audioloop/view/pages/catergories_page.dart';
import 'package:audioloop/view/widgets/helper_widgets.dart';
import 'package:audioloop/view/widgets/home_page_widgets.dart';
import 'package:audioloop/view/widgets/main_card_widget.dart';
import 'package:audioloop/view/widgets/search_page.dart';
import 'package:audioloop/view/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).getdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sleekOrangeAppBar(
        onSearchTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchPage()),
          );
        },
        onCartTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartPage()),
        ),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, value, child) {
          if (value.isloading) {
            return const Center(child: SplashScreenWidget());
          }

          if (value.products.isEmpty) {
            return const Center(child: Text("No products available"));
          }

          return Column(
            children: [
              customcontainer(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Featured Products',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: value.products.length,
                  itemBuilder: (context, index) {
                    final data = value.products[index];
                    return Consumer<Cart>(
                      builder: (context, cart, child) => ECommerceCard(
                        image: data.image,
                        title: data.title,
                        price: data.price,
                        onAddToCart: () => cart.addproduct(data),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductDetailsPage(
                                title: data.title,
                                price: data.price,
                                description: data.description,
                                category: data.category,
                                image: data.image,
                                onAddToCart: () => cart.addproduct(data),
                              ),
                            ),
                          );
                        },
                        context: context,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
