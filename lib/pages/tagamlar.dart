import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasty_recipes/assets/data/tagamlarModel.dart';

class Tagamlar extends StatefulWidget {
  const Tagamlar({super.key});

  @override
  State<Tagamlar> createState() => _TagamlarState();
}

class _TagamlarState extends State<Tagamlar> {

  late Future<List<Tagamlarmodel>> Model;

  Future<List<Tagamlarmodel>> loadtagamlar() async{
    final String jsonStr = await rootBundle.loadString('lib/assets/data/tagamlar.json');
    final List<dynamic> jsonData = jsonDecode(jsonStr);
    return jsonData.map((item)=> Tagamlarmodel.fromJson(item)).toList();
  }


  @override
  void initState(){
    super.initState();
    Model = loadtagamlar();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: FutureBuilder(future: Model, builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata oluştu'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Veri yok'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final user = snapshot.data![index];
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> TagamlarDetail(tagamlar: user)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                            child: Image.asset(user.images ?? '', fit: BoxFit.cover, height: height*0.25, width: width,),
                          ),
                          Text(user.name??"", style: TextStyle(fontSize: width*0.06), )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
      }),
    );
  }
}


class TagamlarDetail extends StatelessWidget {

  final Tagamlarmodel tagamlar;
  const TagamlarDetail({super.key, required this.tagamlar});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(title: Text(tagamlar.name??''),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Image.asset(tagamlar.images ?? '', fit: BoxFit.cover,),
            ),
            Text(tagamlar.description??'')
          ],
        ),
      ),
    );
  }
}