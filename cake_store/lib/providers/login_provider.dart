
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cake_store/models/api.dart';
import 'package:cake_store/models/user_model.dart';

class LoginNotifier extends ChangeNotifier {
  
  final Api _api = Api();
  final formKey = GlobalKey<FormState>();
  bool loginStatus = false;
  String email="";
  String password="";

  UserModel?user;


  
  
  
  Future login(  )async{

    if( formKey.currentState!.validate() ){

      Map<String,String > loginData = {"Email":email, "Password": password};
      user  = await _api.login(loginData);

      loginStatus = user!.id != null;
    }
  
    notifyListeners();

  }
}

final loginProvider = ChangeNotifierProvider((ref)=>LoginNotifier());