import 'package:flutter/material.dart';
import 'package:maidme_app/controllers/constants.dart';
import 'package:maidme_app/controllers/itinariesController/login_screen.dart';
import 'package:maidme_app/controllers/itinariesController/personal_information_page.dart';
import 'package:maidme_app/widgets/raw_widgets.dart';

class WelcomeController extends StatefulWidget {
  @override
  _WelcomeControllerState createState() => _WelcomeControllerState();
}

class _WelcomeControllerState extends State<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 230.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 90.0),
                child: makeText('Welcome to Ajorni', 40.0, FontWeight.normal,
                    appColor, font),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: makeButton(() {
                  Navigator.pushNamed(context, LoginController.id);
                }, 'Signin', 18.0, FontWeight.bold, font, Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: makeButton(() {
                  Navigator.pushNamed(
                      context, PersonalInformationController.id);
                }, 'Signup', 18.0, FontWeight.bold, font, Colors.white),
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, LoginController.id);
                  },
                  child: makeText('', 18.0, FontWeight.normal, appColor, font))
            ],
          ),
        ),
      ),
    );
  }
}
