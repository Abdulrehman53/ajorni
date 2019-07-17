import 'dart:io';

import 'package:dragable_flutter_list/dragable_flutter_list.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maidme_app/controllers/constants.dart';
import 'package:maidme_app/controllers/itinariesController/create_activity.dart';
import 'package:maidme_app/controllers/models/user_model.dart';
import 'package:maidme_app/controllers/raw_data.dart';
import 'package:maidme_app/widgets/raw_widgets.dart';

class ActivitiesController extends StatefulWidget {
  static final id = "activities";

  @override
  _ActivitiesControllerState createState() => _ActivitiesControllerState();
}

class _ActivitiesControllerState extends State<ActivitiesController> {
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
        title: ListTile(
          title: makeText(
              'Add Activity', 20.0, FontWeight.bold, Colors.white, font),
          trailing: InkWell(
            onTap: () {
              Navigator.pushNamed(context, CreateActivityController.id);
            },
            child: makeText(
                'Create Activity', 16.0, FontWeight.bold, Colors.white, font),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: makeText(
                  'Add Photo', 20.0, FontWeight.bold, Colors.black, font),
            ),
            pictureWidget(_image, () {
              getImage();
            }),
            SizedBox(
              height: 10.0,
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: makeText(
                  'Activities', 25.0, FontWeight.bold, Colors.black, font),
            ),
            Expanded(
                child: DragAndDropList(
              userList.length,
              itemBuilder: (BuildContext cntxt, index) {
                UserModel userModel = userList[index];
                return itemList(userModel.name, userModel.distance,
                    userModel.reviews, userModel.price);
              },
              onDragFinish: (before, after) {
                print('on drag finish $before $after');
                UserModel data = userList[before];
                userList.removeAt(before);
                userList.insert(after, data);
              },
              canDrag: (index) {
                return true; //disable drag for index 3
              },
              canBeDraggedTo: (one, two) => true,
            )
                /*ListView.builder(
                  shrinkWrap: true,
                  itemCount: userList.length,
                  itemBuilder: (BuildContext cntxt, index) {
                    UserModel userModel = userList[index];
                    return itemList(userModel.name, userModel.distance,
                        userModel.reviews, userModel.price);
                  }),*/
                ),
          ],
        ),
      ),
    );
  }
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

Widget pictureWidget(File _image, Function onTap) {
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
