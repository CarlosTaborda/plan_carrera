class UserModel{


  int? id;
  bool? success;
  String? firstName;
  String? lastName;
  int? role;
  String? address;
  String? email;

  UserModel();

  UserModel.fromJson(Map<String, dynamic> json){
    id = json["id"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    role = json["role"];
    address = json["address"];
    email = json["email"];
    success = json["success"];
  }
  


}