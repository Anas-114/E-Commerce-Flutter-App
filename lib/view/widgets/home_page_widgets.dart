         

import 'package:flutter/material.dart';

Widget customcontainer() {
  return Container(
    height: 200,
    margin: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.orange[400]!, Colors.orange[600]!],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(16),
    ),
    child: const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_bag, size: 64, color: Colors.white),
          SizedBox(height: 16),
          Text(
            'Welcome to MarketHub!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'Discover amazing products',
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ],
      ),
    ),
  );
}

Widget customfield() {
  return TextField(
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.search),
      hintText: 'Search Store',
      border: OutlineInputBorder(
        gapPadding: BorderSide.strokeAlignCenter,
        borderSide: BorderSide(color: Colors.teal),
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}
 