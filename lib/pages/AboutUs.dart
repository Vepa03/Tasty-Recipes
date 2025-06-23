import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text("Biz Hakynda"),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Image.asset('lib/assets/images/logo.png', fit: BoxFit.cover, width: width, height: height*0.3,),
              ),
              SizedBox(height: height*0.03,),
              Text("Lezzetli Tagamlar – kökeleriň, tortlaryň we şokoladly tagamlaryň söýgüli ýerine hoş geldiňiz!\n\nBu goşundy diňe süýji tagamlary söýýänler üçin döredildi. Bu programmada kökelerinden başlap, döwrebap şokoladly tortlara çenli dürli reseptleri siz bilen paýlaşýarys.\n\n- 🍰 Aşama-aşama düşündirilen reseptler\n- 📷 Her tagam üçin ýokary hilli suratlar\n- 💡 Bişireniňizde kömek edýän peýdaly maslahatlar\n- 🎂 Baýramçylyga, myhmançylyga we gündelik lezzete laýyk tagamlar\n\nBiziň maksadymyz: süýji bişirmegi her kimiň başaryp biljek zatlaryna öwürmek. Tasty Recept bilen öýüňizde datly we gözellik bilen taýýarlanan tagamlary bişiriň!",
              style: TextStyle(fontSize: width*0.04),)
            ],
          ),
        ),
      ),
    );
  }
}