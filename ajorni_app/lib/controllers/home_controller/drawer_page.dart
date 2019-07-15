import 'package:flutter/material.dart';
import 'package:maidme_app/controllers/constants.dart';
import 'package:maidme_app/controllers/home_controller/home_page.dart';
import 'package:maidme_app/controllers/serviceProvider/sign_up.dart';

class DrawerPage extends StatefulWidget {
  static final id = 'drawer_page';
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Ajorni'),
      ),
      drawer: Drawer(
        elevation: 16.0,
        child: Container(
          child: ListView(
            children: <Widget>[
              Container(
                color: Colors.teal,
                child: new UserAccountsDrawerHeader(
                  accountName: Text(
                    'Spencer ',
                    style: TextStyle(color: Colors.white, fontFamily: font),
                  ),
                  accountEmail: Text(
                    '+47 76845687',
                    style: TextStyle(fontFamily: font),
                  ),
                  currentAccountPicture: pictureWidget(null),
                  decoration: BoxDecoration(),
                ),
              ),
              makeDrawerText('Itineraries', Icons.home, Colors.teal, () {}),
              makeDrawerText('Profile', Icons.people, Colors.teal, () {}),
              Divider(),
              makeDrawerText('Settings', Icons.settings, Colors.teal, () {}),
            ],
          ),
        ),
      ),
      body: HomePage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, SignupController.id);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget pictureWidget(String picture) {
  return new GestureDetector(
    child: new Container(
        width: 190.0,
        height: 190.0,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: picture == null
                  ? AssetImage(
                      'images/signup_page_9_profile.png',
                    )
                  : NetworkImage(
                      picture,
                    ),
            ))),
  );
}

Widget makeDrawerText(
    String text, IconData icon, Color color, Function onPressed) {
  return InkWell(
    onTap: onPressed,
    child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, size: 25, color: color),
            SizedBox(
              width: 20.0,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 16.0, fontFamily: font),
            ),
          ],
        )),
  );
}
