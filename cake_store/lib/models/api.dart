import 'dart:convert';

import 'package:cake_store/models/product_model.dart';
import 'package:cake_store/models/user_model.dart';
import 'package:http/http.dart' as http;

import 'dart:developer';

class Api{

  static const  baseUrl="http://192.168.1.5/StoreApi/api";

  Future<List<ProductModel>> getAll()async {

    String endPoint = "${baseUrl}/product";
    http.Response res = await http.get(Uri.parse(endPoint));

    if( res.statusCode != 200 )
      return [];

    List<Map<String, dynamic>> jsonDecoded = jsonDecode(res.body);
    List<ProductModel> products = jsonDecoded.map((e) => ProductModel.fromJson(e)).toList();

    return products;
  }


  Future<UserModel> login(Map<String, String> loginData)async {
    log("${baseUrl}/user"+loginData.toString());
    String endPoint = "${baseUrl}/user";
    http.Response res = await http.post(
      Uri.parse('$baseUrl/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(loginData),
    );

    if( res.statusCode != 200 )
      return UserModel();

    Map<String, dynamic> jsonDecoded = jsonDecode(res.body);
    UserModel user = UserModel.fromJson(jsonDecoded);

    return user;
  }

  Future< Map<String, dynamic>> mostBought()async{

    String endPoint = "${baseUrl}/Product/MostBought/2";
    http.Response res = await http.get(Uri.parse(endPoint));

    if( res.statusCode != 200 ) {
      return {};
    }

    Map<String, dynamic> jsonDecoded = jsonDecode(res.body);
    

    return jsonDecoded;
  }
}