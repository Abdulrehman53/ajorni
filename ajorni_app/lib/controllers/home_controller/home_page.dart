import 'package:flutter/material.dart';
import 'package:maidme_app/controllers/constants.dart';
import 'package:maidme_app/controllers/itinariesController/itinary_detail.dart';
import 'package:maidme_app/controllers/models/user_model.dart';
import 'package:maidme_app/controllers/raw_data.dart';

class HomePage extends StatefulWidget {
  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<HomePage> {
  final List<UserModel> userList = getData();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        serachWidget(),
        Expanded(
          child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (BuildContext cntxt, index) {
                UserModel userModel = userList[index];
                return itemList(userModel.name, userModel.distance,
                    userModel.reviews, userModel.price, context);
              }),
        ),
      ],
    );
  }
}

Widget itemList(String name, String distance, String reviews, String price,
    BuildContext context) {
  return Card(
    elevation: 5.0,
    child: InkWell(
      onTap: () {
        Navigator.pushNamed(context, ItinaryDetailController.id);
      },
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
                      makeText(name, Colors.black, 16.0, FontWeight.bold),
                      SizedBox(
                        width: 20.0,
                      ),
                    ]),
                  ],
                ),
              ),
            ),
            Icon(
              Icons.navigate_next,
              color: Colors.teal,
            ),
          ],
        ),
      ),
    ),
  );
}

class StarDisplay extends StatelessWidget {
  final int value;
  const StarDisplay({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
        );
      }),
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

Widget makeText(
    String text, Color color, double fontSize, FontWeight fontWeight) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: font,
    ),
  );
}

Widget serachWidget() {
  return Container(
    color: Colors.grey.withOpacity(0.1),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onChanged: (value) {
          print(value);
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          labelText: "Search",
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
    ),
  );
}
