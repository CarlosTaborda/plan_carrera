import 'package:cake_store/models/product_model.dart';
import 'package:cake_store/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class UserHomePage extends ConsumerWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final size = MediaQuery.of(context).size;
    final productsPvdr = ref.watch(productsProvider);
    productsPvdr.getAllProducts();
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuestros Productos"),
      ),
      body: SingleChildScrollView(
        child:Padding(
          padding: EdgeInsets.all(10),
          child: Card(
            child: Column(
          children: [
             Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Center(
                child: Text("Listado de productos"),
              ),
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              children: productsPvdr.listProducts.map((p) => _productCard(p, size)).toList(),
            ),
            )

            
            
          ],
        ),
          )
        )
      ),
    );
  }

  
 SizedBox _productCard(ProductModel p, Size size){

    return SizedBox(
      height: size.width *0.35,
      width: size.width *0.35,
      child: Card(
        child: Column(
          children: [

            Text(p.code!),

            Text(p.name!)
          ],
        ),
      ),
    );
  }
}