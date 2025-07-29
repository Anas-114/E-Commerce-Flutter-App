import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final List<String> imageList;
  const CustomSlider({super.key, required this.imageList});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imageList.map((image) {
        return Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 8,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                  image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.85,
        autoPlayInterval: Duration(seconds: 3),
      ),
    );
  }
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
 