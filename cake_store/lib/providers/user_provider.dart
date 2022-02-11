import 'package:cake_store/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserStateSession{

  SharedPreferences? prefs;
  UserModel? user;

  UserStateSession();

  Future loadSharePreferences() async{
    prefs = await SharedPreferences.getInstance();

    user = UserModel();
    if( prefs!.getInt("idUser")==null ){
      
      return;
    }
      
    user!.id = prefs!.getInt("idUser");
    user!.firstName = prefs!.getString("firstName");
    user!.lastName = prefs!.getString("laststName");
    user!.email = prefs!.getString("email");
    user!.role = prefs!.getInt("role");
    user!.address = prefs!.getString("address");


  }

  void logout(){

    prefs!.remove("idUser");

  }

  void saveData(UserModel user){

    prefs!.setInt("idUser", user.id!);
    prefs!.setString("firstName", user.firstName!);
    prefs!.setString("laststName", user.lastName!);
    prefs!.setString("email", user.email!);
    prefs!.setInt("role", user.role!);
    prefs!.setString("address", user.address!);

  }
}

final userSessionProvider = Provider((ref)=>UserStateSession());