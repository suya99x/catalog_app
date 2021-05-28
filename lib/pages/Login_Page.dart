import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset("assets/images/login_image.png",
            fit: BoxFit.cover,
            ),
          SizedBox(height: 20.0,),
          Text(
            "Welcome",
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
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "enter password",
                    labelText: "password"
                ),
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                  onPressed: ()
                  {
                    print("hi sudin");
                    },
                  child: Text('Login'),
                  style: TextButton.styleFrom(),
                  )
            ],
          )
        ],
      ),
    );
  }
}
