class ProductModel{
  int? id;
  String? name;
  String? code;
  String? description;
  double? price;
  String? image;

  ProductModel();

  ProductModel.fromJson(Map<String, dynamic> json){

    id = json["id"];
    name = json["name"];
    code = json["code"];
    description = json["description"];
    price = double.parse("${json["price"]}");
    image = json["image"];

  }





}