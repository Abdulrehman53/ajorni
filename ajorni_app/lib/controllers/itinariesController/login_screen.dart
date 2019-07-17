import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:maidme_app/controllers/constants.dart';
import 'package:maidme_app/controllers/home_controller/drawer_page.dart';
import 'package:maidme_app/widgets/raw_widgets.dart';

class LoginController extends StatefulWidget {
  static final id = 'login';
  @override
  _LoginControllerState createState() => _LoginControllerState();
}

class _LoginControllerState extends State<LoginController> {
  final _formKey = GlobalKey<FormState>();

  Country _selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBr('Login'),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 140.0),
              child:
                  makeText('Ajorni', 60.0, FontWeight.normal, appColor, font),
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: makeFormFieldWithIcon('Email', (value) {
                            setState(() {});
                          }, (value) {
                            if (value.toString().length == 0) {
                              return 'Email field should not be empty';
                            }
                          }, TextInputType.emailAddress, Icons.email),
                        ),
                      ],
                    ),
                    makePasswordFormField('Password', (value) {
                      setState(() {});
                    }, (value) {
                      if (value.toString().length == 0) {
                        return 'Password field should not be empty';
                      }
                    }, TextInputType.text, Icons.lock_outline),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: makeButton(() {
                        final formState = _formKey.currentState;

                        if (formState.validate()) {
                          formState.save();
                          Navigator.pushNamed(context, DrawerPage.id);
                        }
                      }, 'Login', 20.0, FontWeight.bold, font, Colors.white),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
