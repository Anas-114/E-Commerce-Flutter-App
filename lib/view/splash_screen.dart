// import 'package:audioloop/controller/product_provider.dart';
// import 'package:audioloop/view/home.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {

// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

 
//   Future giveData()async{
// final product1=Provider.of<ProductProvider>(context,listen: false);
// product1.fetchProduct();
// Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => Home()));
 

//   }


   
//   }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('wait a minute'),
//       ),
//     ) ;
//   }
// }