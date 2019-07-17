import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maidme_app/controllers/constants.dart';
import 'package:maidme_app/controllers/models/user_model.dart';
import 'package:maidme_app/controllers/raw_data.dart';
import 'package:maidme_app/widgets/raw_widgets.dart';

class ItinaryDetailController extends StatefulWidget {
  static final id = "itinary_detail";

  @override
  _ItinaryDetailControllerState createState() =>
      _ItinaryDetailControllerState();
}

class _ItinaryDetailControllerState extends State<ItinaryDetailController> {
  final List<UserModel> userList = getData();
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
      appBar: AppBar(
        backgroundColor: appColor,
        title: makeText('Itineray', 20.0, FontWeight.bold, Colors.white, font),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: makeText(
                  'Itineray', 20.0, FontWeight.bold, Colors.black, font),
            ),
            itinaryItemList('Test', context),
            SizedBox(
              height: 10.0,
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: makeText('Associated Activities', 25.0, FontWeight.bold,
                  Colors.black, font),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: userList.length,
                  itemBuilder: (BuildContext cntxt, index) {
                    UserModel userModel = userList[index];
                    return itemList(userModel.name, userModel.distance,
                        userModel.reviews, userModel.price);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

Widget pictureWidget(String picture) {
  return new GestureDetector(
    child: new Container(
        width: 80.0,
        height: 80.0,
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

Widget itemList(String name, String distance, String reviews, String price) {
  return Card(
      elevation: 5.0,
      child: Container(
        child: ListTile(
          title: Text('Test'),
          subtitle: Text('Lorem Ipsum'),
          trailing: Text('New York'),
        ),
      ));
}

Widget itinaryItemList(String name, BuildContext context) {
  return Card(
    elevation: 5.0,
    child: InkWell(
      onTap: () {},
      child: Container(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: pictureWidget(null),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      makeText(name, 16.0, FontWeight.bold, Colors.black, font),
                      SizedBox(
                        width: 20.0,
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget myPictureWidget(File _image, Function onTap) {
  return SizedBox(
    width: 100.0,
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
