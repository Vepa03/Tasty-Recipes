class Tagamlarmodel {
  String? images;
  String? name;
  String? description;


  Tagamlarmodel({this.description, this.images, this.name});

  Tagamlarmodel.fromJson(Map<String, dynamic> json){
    images = json["surat"];
    name = json["ady"];
    description = json["description"];
  }


}