import 'package:cake_store/models/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mostBoughtProvider = FutureProvider((ref){
  Api api = Api();
  return api.mostBought();
});