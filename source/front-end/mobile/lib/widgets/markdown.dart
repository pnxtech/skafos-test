import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart' as MD;

class Markdown extends StatelessWidget {
  final String assetPath;

  Markdown({this.assetPath});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: rootBundle.loadString(assetPath),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return MD.Markdown(
              data: snapshot.data,
              styleSheet: MD.MarkdownStyleSheet(
                h1: TextStyle(
                    color: Colors.blue,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
                p: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
