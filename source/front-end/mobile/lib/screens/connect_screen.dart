import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/constants/app_constants.dart';
import 'package:http/http.dart' as http;

class ConnectScreen extends StatefulWidget {
  @override
  _ConnectScreenState createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  http.Response serversResponse;
  var stringHistoryList;

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  void getInfo() async {
    var response = await http.get('$kAPIServer/v1/string/history');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    setState(() {
      serversResponse = response;
      stringHistoryList = jsonDecode(serversResponse.body)['history'];
    });
  }

  Widget buildHistoryList(BuildContext context, int index) {
    return Container();
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
                  getInfo();
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
              ? ListView.builder(
                  itemCount: stringHistoryList.length,
                  itemBuilder: (context, index) {
                    return buildHistoryList(context, index);
                  },
                )
              : (serversResponse != null) ? errorCard(context) : null,
        ),
      ),
    );
  }
}
