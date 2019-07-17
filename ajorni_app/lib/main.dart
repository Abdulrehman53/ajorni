import 'package:flutter/material.dart';
import 'package:maidme_app/controllers/home_controller/drawer_page.dart';
import 'package:maidme_app/controllers/itinariesController/create_activity.dart';
import 'package:maidme_app/controllers/itinariesController/login_screen.dart';

import 'controllers/itinariesController//sign_up.dart';
import 'controllers/itinariesController/activities_page.dart';
import 'controllers/itinariesController/itinary_detail.dart';
import 'controllers/itinariesController/personal_information_page.dart';
import 'controllers/welcome_controller/welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maid Me',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: WelcomeController(),
      initialRoute: '/',
      routes: {
        ItinaryDetailController.id: (context) => ItinaryDetailController(),
        CreateActivityController.id: (context) => CreateActivityController(),
        ActivitiesController.id: (context) => ActivitiesController(),
        SignupController.id: (context) => SignupController(),
        LoginController.id: (context) => LoginController(),
        DrawerPage.id: (context) => DrawerPage(),
        PersonalInformationController.id: (context) =>
            PersonalInformationController(),
      },
    );
  }
}
