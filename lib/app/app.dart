import 'package:app/views/Homeview.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ice Cream Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => HomeView(), // HomeView as the main screen
        // You can add other routes here if you have more screens
        // For example:
        // '/cart': (context) => CartScreen(),
      },
    );
  }
}
