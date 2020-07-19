import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/constants/app_constants.dart';
import 'package:http/http.dart' as http;

class ConnectScreen extends StatefulWidget {
  @override
  _ConnectScreenState createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  http.Response serversResponse;
  var stringHistoryList;
  final inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  void getInfo() async {
    var response = await http.get('$kAPIServer/v1/string/history');
    setState(() {
      serversResponse = response;
      stringHistoryList =
          jsonDecode(serversResponse.body)['history'].reversed.toList();
    });
  }

  void sendString() async {
    await http.post(
      '$kAPIServer/v1/string/reverse',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'string': inputController.text,
      }),
    );
    inputController.clear();
    getInfo(); // not the most optimal approach - but probably fine for a POC / demo
  }

  Widget buildHistoryList(BuildContext context, int index) {
    Color cardBackgroundColor = Colors.grey.shade200;
    return Column(
      children: <Widget>[
        Card(
          color: cardBackgroundColor,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: Icon(FontAwesomeIcons.comment, size: 40),
                    title: Text('${stringHistoryList[index]['original']}'),
                    subtitle: Text('${stringHistoryList[index]['processed']}'),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2.0, bottom: 20.0),
                      child: Text(
                        'String length: ${stringHistoryList[index]['length']}',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget errorCard(BuildContext context) {
    String errorMessage;

    if (serversResponse == null) {
      errorMessage = 'Please check your Internet connection';
    } else if (serversResponse.statusCode != 200) {
      errorMessage = 'Error #${serversResponse.statusCode}';
    }

    return Card(
      color: Colors.red.shade900,
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                ),
                child: Text(
                  'Unable to access the cloud',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  'There was an error accessing the $kProductName.\n\n$errorMessage',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              FlatButton(
                child: Text(
                  'Retry',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  sendString();
                },
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('String Reverse Service'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: (serversResponse != null && serversResponse.statusCode == 200)
              ? Column(
                  children: <Widget>[
                    TextField(
                      controller: inputController,
                      decoration: InputDecoration(
                        hintText: 'Enter string phrase',
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    FlatButton(
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      onPressed: () {
                        sendString();
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: stringHistoryList.length,
                        itemBuilder: (context, index) {
                          return buildHistoryList(context, index);
                        },
                      ),
                    ),
                  ],
                )
              : (serversResponse != null) ? errorCard(context) : null,
        ),
      ),
    );
  }
}
