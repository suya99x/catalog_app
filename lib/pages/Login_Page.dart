import 'package:catalog_app/MyRoutes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changebutton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if(_formKey.currentState.validate()) {
      setState(() {
        changebutton=true;
      });
      await Future.delayed(Duration(seconds:1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changebutton=false;
      });
    }
    }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child:SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/login_image.png",
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20.0,),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0,),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "username",
                          labelText: "user name"
                      ),
                      validator: (value){
                        if(value.isEmpty){
                    return "username cannot be empty";
                        }
                        else{
                          return null;
                        }
                      },
                      onChanged: (value) {
                       setState(() {
                         name=value;
                       });
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "enter password",
                          labelText: "password"
                      ),

                      validator: (value){
                        if(value.isEmpty){
                          return "password cannot be empty";
                        }
                        else if(value.length < 6){
                          return 'password length should be at least 6';
                        }
                        else return null;
                      },
                    ),

                    SizedBox(height: 20.0,),
                   Material(
                     color: Colors.deepPurple,
                     borderRadius:
                     BorderRadius.circular(changebutton ? 50 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(

                          duration: Duration(seconds: 1),
                          width: changebutton? 50 : 150,
                          height: 50,
                          color: Colors.deepPurple,
                          alignment: Alignment.center,
                          child: changebutton
                              ? Icon(Icons.done,color:Colors.white)
                              : Text('Login', style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18.0),
                                )

                          ),
                        ),
                      ),


                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
