import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasty Reipes"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.abc),
          )
        ],
        
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: Text("Contact"),
              leading: Icon(Icons.abc),
              onTap: (){

              },
            )
          ],
        ),
      ),
    );
  }
}