import 'package:cake_store/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminDrawer extends ConsumerWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final userPvdr = ref.read(userSessionProvider);
    return Drawer(
      
      child:  Column(
        children:  [
          _createHeader(),
          const ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text("Mas Vendidos"),
          ),
          const ListTile(
            leading: Icon(Icons.money_off),
            title: Text("Menos Vendidos"),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Salir"),
            onTap: (){
              userPvdr.logout();
              Navigator.pushNamedAndRemoveUntil(context, "/login",(Route<dynamic> route) => false);
            },
          )
        ],
      ),
    );
  }


  Widget _createHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        color: Color(0xff693668)
      ),
      child: Stack(children: const <Widget>[
        Positioned(
          bottom: 12.0,
          left: 16.0,
          child: Text("Cake Store",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w500
            )
          )
        ),
      ]));
  }
}