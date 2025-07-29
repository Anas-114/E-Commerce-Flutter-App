import 'package:audioloop/controller/product_provider.dart';
import 'package:audioloop/view/home_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> image = [
    'images/slider_image1.png',
    'images/slider_image2.png',
    'images/slider_image3.png',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<ProductProvider>(context,listen: false).getdata();
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ProductProvider>(
        builder: (context, value, child) {
    //        if (value.isLoading) {
    //   return const Center(child: CircularProgressIndicator());
    // }
          return Column(
            children: [
              Padding(padding: const EdgeInsets.all(10), child: customfield()),
              CustomSlider(imageList: image),
              Expanded(
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:  2),
                  itemCount: value.products.length,
                  itemBuilder: (context, index) {
                    final data = value.products[index];
                  
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
