import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final imageurl=
        "https://avatars.githubusercontent.com/u/53431738?s=400&u=0db83d315641b7f325a3c541a23d94b77da1275b&v=4";

    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          //padding to remove unwanted space in android
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin:  EdgeInsets.zero,
                  accountName: Text("sudin"),
                  accountEmail: Text("sudinshk@gmail.com"),
                  //currentAccountPicture: Image.network(imageurl),use if url shows in square
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageurl),
                    //use network image if url or assetiamge if already
                  ),
            )
            ),
            ListTile(
              onTap: (){},
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text("Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text("profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text("Email",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )

          ],

        ),
      ),

    );
  }
}
// TODO Implement this library.