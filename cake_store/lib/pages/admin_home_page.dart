import 'package:cake_store/providers/most_bought_provider.dart';
import 'package:cake_store/widgets/admin_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class AdminHomePage extends ConsumerWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    AsyncValue<Map<String,dynamic>> products = ref.watch(mostBoughtProvider);
    return  Scaffold(
      appBar: AppBar(title: const Text("Más vendidos"),),
      drawer: const  AdminDrawer(),
      body: products.when(
        data: (data)=>_loadInfo(data), 
        error: (_, __)=>_error(), 
        loading: _loading
      ),
    );
  }

  ListView _loadInfo(Map<String, dynamic> data){

    return ListView.builder(
      itemCount:  data["products"].length,
      itemBuilder: (context, index) {
        
        return ListTile(
          leading: Image.asset('assets/cake_icon_2.png', height: 100,),
          title:  Text(data["products"][index]["name"]),
          trailing: Text((data["products"][index]["quantityBought"]+1).toString()),
        );
      },
    );
  }

  Column _error(){

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Error cargando la información"),
        )
      ],
    );
  }



  Column _loading(){

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: CircularProgressIndicator(),
        ),
        Center(
          child: Text("Cargando información"),
        )

      ],
    );
  }
}