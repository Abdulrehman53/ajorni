import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maidme_app/controllers/constants.dart';
import 'package:maidme_app/controllers/serviceProvider/activities_page.dart';
import 'package:maidme_app/widgets/raw_widgets.dart';

class SignupController extends StatefulWidget {
  static final id = "signup";

  @override
  _SignupControllerState createState() => _SignupControllerState();
}

class _SignupControllerState extends State<SignupController> {
  File _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBr('Create Itinerary'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                makeFormField('Name', (value) {}, (value) {
                  if (value.toString().length == 0) {
                    return errorMsg('Name');
                  }
                }, TextInputType.text),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 60.0, right: 60.0, top: 30.0, bottom: 10.0),
                  child: makeButton(() {
                    final formState = _formKey.currentState;
                    if (formState.validate()) {
                      formState.save();
                      Navigator.pushNamed(context, ActivitiesController.id);
                    }
                  }, 'Next', 20.0, FontWeight.bold, font, Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget pictureWidget(File _image, Function onTap) {
  return SizedBox(
    width: double.infinity,
    height: 100.0,
    child: Container(
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 100.0,
            width: 100.0,
            child: Container(
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: _image == null
                      ? AssetImage(
                          'images/signup_page_9_profile.png',
                        )
                      : FileImage(
                          _image,
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
