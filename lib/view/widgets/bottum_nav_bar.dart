import 'package:audioloop/view/pages/cart_page.dart';
import 'package:audioloop/view/pages/catergories_page.dart';
import 'package:audioloop/view/pages/home.dart';
import 'package:audioloop/view/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainBottomNavPage extends StatefulWidget {
  const MainBottomNavPage({Key? key}) : super(key: key);

  @override
  State<MainBottomNavPage> createState() => _MainBottomNavPageState();
}

class _MainBottomNavPageState extends State<MainBottomNavPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Home(),
    const CategoriesPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1)),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.orange[300]!,
              hoverColor: Colors.orange[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.orange[600]!,
              color:  Colors.orangeAccent,
              tabs: const [
                GButton(icon: Icons.home_outlined, text: 'Home'),
                GButton(icon: Icons.category_outlined, text: 'Categories'),
                GButton(icon: Icons.shopping_cart_outlined, text: 'Cart'),
                GButton(icon: Icons.person_outline, text: 'Profile'),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

 
