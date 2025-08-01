import 'package:audioloop/view/widgets/bottum_nav_bar.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.orangeAccent.shade400,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
Padding(
  padding: const EdgeInsets.only(bottom: 60),
  child: Center(
    child: Text('Welcome to \n MarketHub', style:TextStyle(color:  Colors.amber.shade200 ,fontSize:50,fontWeight: FontWeight.bold ) ,),
  ),
)
,
      
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:  Colors.amber.shade200,
                    hoverColor: Colors.amber.shade200,
                    focusColor: Colors.amber.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.orangeAccent.shade200),
                    ),
                    hintText: 'Email',
                    labelText: 'Enter your email',
                  ),
                ),
              ),
            ),

         
            const SizedBox(height: 30),
              Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:  Colors.amber.shade200,
                    hoverColor: Colors.amber.shade200,
                    focusColor: Colors.amber.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.orangeAccent.shade200),
                    ),
                    hintText: 'Password',
                    labelText: 'Enter your password',
                  ),
                ),
              ),
            ),

           
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainBottomNavPage(),));
              
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(150, 50)),
                  backgroundColor: MaterialStateProperty.all(Colors.amberAccent),
                  shadowColor: MaterialStateProperty.all(Colors.orangeAccent.shade200),
                  elevation: MaterialStateProperty.all(8),
                  foregroundColor:  MaterialStateProperty.all(Colors.amberAccent)
                ),
                child: const Text('LOGIN',style: TextStyle(color: Colors.amberAccent),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
