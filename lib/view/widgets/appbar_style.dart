 
// Option 2: Sleek Orange Theme AppBar
import 'package:flutter/material.dart';

AppBar sleekOrangeAppBar({
  VoidCallback? onCartTap,
  VoidCallback? onSearchTap,
  int cartItemCount = 0,
}) {
  return AppBar(
    centerTitle: true,
    elevation: 8,
    shadowColor: Colors.orange.withOpacity(0.3),
    backgroundColor: Colors.white,
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.orangeAccent, Colors.deepOrange],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.storefront,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(width: 8),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.orangeAccent, Colors.deepOrange],
          ).createShader(bounds),
          child: const Text(
            'MarketHub',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ],
    ),
    actions: [
      IconButton(
        onPressed: onSearchTap,
        icon: const Icon(Icons.search, color:  Colors.orangeAccent),
      ),
      Stack(
        children: [
          IconButton(
            onPressed: onCartTap,
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.orangeAccent),
          ),
          if (cartItemCount > 0)
            Positioned(
              right: 6,
              top: 6,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Text(
                  '$cartItemCount',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
      const SizedBox(width: 8),
    ],
  );
}
 