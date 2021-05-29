import 'package:catalog_app/MyRoutes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name="";
  bool changebutton=false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child:SingleChildScrollView(
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
                padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0)),
            Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "username",
                      labelText: "user name"
                  ),
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
                ),
                SizedBox(height: 20.0,),

                InkWell(
                  onTap: () async {
                    setState(() {
                      changebutton=true;
                    });

                    await Future.delayed(Duration(seconds:1));
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: 180,
                    height: 40,
                    color: Colors.deepPurple,
                    alignment: Alignment.center,
                    child: changebutton
                        ? Icon(Icons.done,color:Colors.white)
                        : Text('Login', style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18.0),
                          ),
                    decoration: BoxDecoration(
                      // shape: changebutton
                      //     ? BoxShape.circle :BoxShape.rectangle,
                     borderRadius: BorderRadius.circular(40)
                    ),
                    

                  ),
                )

                // ElevatedButton(
                //   onPressed: ()
                //   {
                //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                //   },
                //   child: Text('Login'),
                //   style: TextButton.styleFrom(minimumSize:Size(200, 40)),
                // )
              ],
            )
          ],
        ),
      )
    );
  }
}
