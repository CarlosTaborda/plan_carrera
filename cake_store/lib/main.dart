import 'package:cake_store/pages/admin_home_page.dart';
import 'package:cake_store/pages/login_page.dart';
import 'package:cake_store/pages/user_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main()async{ 

  return runApp(
      ProviderScope(child:MyApp()
    ) 
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    
    return  MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(

          primary: Colors.red[400]
        )
      ),
      title: 'Material App',
      initialRoute: "/login",
      routes: {
        "/login":(_)=>const LoginPage(),
        "/admin":(_)=>const AdminHomePage(),
        "/user":(_)=>const UserHomePage()

      },
    );
  }
}