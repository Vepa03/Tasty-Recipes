import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:tasty_recipes/pages/AboutUs.dart';
import 'package:tasty_recipes/pages/tagamlar.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Lezzetli Tagamlar", style: TextStyle(fontSize: width*0.06),),
        
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
                    title: Text('Habarlaşmak',style: TextStyle(fontSize: width*0.05, color: Colors.black),),
                    leading: Icon(Icons.mail_outline, color: Colors.black,),
                    onTap: (){
                      showDialog(context: context, builder: (_)=>AlertDialog(
                        title: Text("Habarlaşmak üçin", style: TextStyle(color: Colors.black),),
                        content: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            height: height*0.2,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text("Gmail",style: TextStyle(fontSize: width*0.05),),
                                  leading: Image.asset("lib/assets/images/gmail.png", width: width*0.12,),
                                  onTap: (){
                                    _mail();
                                  },
                                ),
                                ListTile(
                                  title: Text("Instagram", style: TextStyle(fontSize: width*0.05)),
                                  leading: Image.asset("lib/assets/images/instagram.png", width: width*0.12,),
                                  onTap: (){
                                    _linkler("https://www.instagram.com/");
                                  },
                                ),
                                ListTile(
                                  title: Text("WebSite", style: TextStyle(fontSize: width*0.05)),
                                  leading: Image.asset("lib/assets/images/website.png", width: width*0.12,),
                                  onTap: (){
                                    _linkler("https://vepababayev.com/");
                                  },
                                ),
                                
                              ],
                            ),
                          ),
                        ),
                      ));
                    },
                  ),
                  ListTile(
                    title: Text('Biz Hakynda',style: TextStyle(color: Colors.black,fontSize: width*0.05),),
                    leading: Icon(Icons.info_outline, color: Colors.black,),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUs()));
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Çykalga',style: TextStyle(color: Colors.black, fontSize: width*0.05),),
                    leading: Icon(Icons.exit_to_app_outlined, color: Colors.black,),
                    onTap: (){
                      showDialog(context: context, builder: (_)=>AlertDialog(
                        title: Text("Programmadan Çykmakçymy ?", style: TextStyle(fontSize: width*0.05),),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(onPressed: (){
                              SystemNavigator.pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white
                            )
                            ,child: Text("Hawa", style: TextStyle(fontSize: width*0.04, fontWeight: FontWeight.normal, color: Colors.black),)),
                            ElevatedButton(onPressed: (){
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white
                            ), 
                            child: Text("Ýok", style: TextStyle(fontSize: width*0.04, fontWeight: FontWeight.normal, color: Colors.black),))
                          ],
                        )
                      ));
                    },
                  ),
                ],
              ),
              
              Center(child: Text("", style: TextStyle(fontSize: width*0.04, color: Colors.black),))
            ],
          ),
        ),
      ),
      body: Tagamlar(),
      
    );
  }
  
}

Future <void> _linkler(String url) async{
  final Uri uri = Uri.parse(url);
  if(! await launchUrl(uri, mode: LaunchMode.externalApplication)){
    throw Exception("Girip bolmady $url");
  }
}

Future <void> _mail() async{
  final Uri email = Uri(scheme: 'mailto', path: 'vepababayev03@gmail.com', queryParameters: {
    'subject': "Suyji Tagamlar",
    'body': 'Salam yasan programmanyz gaty gowy bolupdyr minnetdar'
  });
  if(! await launchUrl(email)){
    throw Exception("Girip bolmady $email");
  }
}
