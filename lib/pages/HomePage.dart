import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: height*0.1,
              ),
                  Column(
                    children: [
                      SizedBox(
                    width: width*0.6,
                    child: Lottie.asset("lib/assets/images/animation.json")),
                  ListTile(
                    title: Text("Contact"),
                    leading: Icon(Icons.mail_outline),
                    onTap: (){
              
                    },
                  ),
                  ListTile(
                    title: Text("About Us"),
                    leading: Icon(Icons.info),
                    onTap: (){
              
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Exit'),
                    leading: Icon(Icons.exit_to_app_outlined),
                    onTap: (){
                      SystemNavigator.pop();
                    },
                  ),
                ],
              ),
              
              Text("Version 0.0.1")
            ],
          ),
        ),
      ),
    );
  }
}