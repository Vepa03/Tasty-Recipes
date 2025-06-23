import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tasty_recipes/Provider.dart';
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


class TagamlarDetail extends StatefulWidget {

  final Tagamlarmodel tagamlar;
  const TagamlarDetail({super.key, required this.tagamlar});

  @override
  State<TagamlarDetail> createState() => _TagamlarDetailState();
}

class _TagamlarDetailState extends State<TagamlarDetail> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar:AppBar(title: Text(widget.tagamlar.name??''),
      actions: [
          GestureDetector(
            onTap: (){
              showDialog(context: context, builder: (_)=>AlertDialog(
                title: Text("Change text size "),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(onPressed: (){
                      setState(() {
                        Provider.of<ListProvider>(context, listen: false).ayyr();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white
                    )
                    ,child: Text("-", style: TextStyle(fontSize: width*0.05, fontWeight: FontWeight.bold, color: Colors.black),)),
                    ElevatedButton(onPressed: (){
                      setState(() {
                        Provider.of<ListProvider>(context, listen: false).gosh();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white
                    ), 
                    child: Text("+", style: TextStyle(fontSize: width*0.05, fontWeight: FontWeight.bold, color: Colors.black),))
                  ],
                )
              ));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.edit),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Image.asset(widget.tagamlar.images ?? '', fit: BoxFit.cover,),
              ),
              Text(widget.tagamlar.description??'', style: TextStyle(fontSize: 18),)
            ],
          ),
        ),
      ),
    );
  }
}