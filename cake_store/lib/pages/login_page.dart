import 'package:cake_store/providers/login_provider.dart';
import 'package:cake_store/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validator/form_validator.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.pink[900],
              height:size.height,
              width: size.width
            ),
            
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height*0.3),
                  child: LoginForm(),
                ),
                
              ],
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: size.height*0.18),
                child: Image.asset('assets/cake_icon.png', height: 120,),
              )
            ),
          ],
        )
      ),
    );
  }
}

class LoginForm extends ConsumerWidget  {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final loginPvdr = ref.watch(loginProvider);
    final userPvdr = ref.read(userSessionProvider);
    userPvdr.loadSharePreferences().then((value){

      if( userPvdr.user!.id != null ){
        Future.delayed(
          Duration(seconds: 1),
          ()=> Navigator.pushNamedAndRemoveUntil(context, userPvdr.user!.role==1?"/admin":"/user",(Route<dynamic> route) => false)
        );
      }
    });


    return Container(  
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Card(  
          
          child: Padding(
            padding: EdgeInsets.all(10),
            child:Form(
              key: loginPvdr.formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Correo")
                    ),
                    onChanged: (String? email){
                      loginPvdr.email = email ?? "";
                    },
                    validator: ValidationBuilder(requiredMessage: "El correo es necesario")
                      .required().email("Debe ingresar un email valido").build(),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Contraseña")
                    ),
                    obscureText: true,
                    onChanged: (String? password){
                      loginPvdr.password = password ?? "";
                    },
                    validator: ValidationBuilder(requiredMessage: "La contraseña es necesaria")
                      .required()
                      .minLength(5, "Debe ingresar una contraseña más larga")
                      .build(),
                    ),
                  SizedBox(height: 10,),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: ()async{
                        await loginPvdr.login();
                        if(!loginPvdr.loginStatus){
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Verifique los datos de ingreso"),
                          ));
                        }

                        userPvdr.saveData(loginPvdr.user!);

                        
                        
                        Navigator.pushNamed(context, userPvdr.user!.role==1?"/admin":"/user");
                      }, 
                      child:  Text("INGRESAR"),
                    ),
                  )

                ],
              )
              )
            )
        ),  
      )  ;
  }
}