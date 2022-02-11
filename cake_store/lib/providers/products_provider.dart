
import 'dart:async';
import 'package:flutter/material.dart';


import 'package:cake_store/models/api.dart';
import 'package:cake_store/models/product_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsProvider extends ChangeNotifier{

  final Api _api= Api();
  List<ProductModel> listProducts = [];

  ProductsProvider();

  Future getAllProducts()async{

    listProducts = await _api.getAll();
    notifyListeners();
  }
}

final productsProvider = ChangeNotifierProvider<ProductsProvider>((ref)=>ProductsProvider());