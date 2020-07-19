import 'package:flutter/material.dart';
import 'package:mobile/constants/app_constants.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/widgets/menu_list_tile.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(50.0),
              alignment: Alignment.center,
              child: Image.asset('images/logo-template.png'),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 80.0,
              child: DrawerHeader(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$kCompanyName $kProductName',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 34.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2.0, 3.0),
                          blurRadius: 5.0,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: ColorUtil.gradient(
                    startColor: Colors.blue.shade200,
                    endColor: Colors.blue.shade900,
                  ),
                ),
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(0.0),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            MenuListTile(
              title: 'String Reverse',
              subtitle: 'Access string Reverse service',
              icon: Icon(Icons.cloud, size: 40),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, kConnectScreenID);
              },
            ),
            MenuListTile(
              title: 'About',
              subtitle: 'Information about this app',
              icon: Icon(Icons.info, size: 40),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, kAboutScreenID);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 200.0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child:
                        Image.asset('images/logo-template.png', width: 140.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'Version: $kAppVersion',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        color: Colors.white24,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
