import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasty_recipes/Provider.dart';
import 'package:tasty_recipes/pages/HomePage.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context)=> ListProvider(),
  child: const MyApp()));
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,

        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 246, 245, 245),
        drawerTheme: DrawerThemeData(backgroundColor: Colors.white),
        textTheme: TextTheme(titleLarge: TextStyle(color: Colors.black)),
        dividerColor: Colors.black,
        dialogTheme: DialogTheme(backgroundColor: Colors.white,),
        buttonTheme: ButtonThemeData()
        
      ),
      home: Homepage(),
    );
  }
}

