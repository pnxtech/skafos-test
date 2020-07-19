import 'package:flutter/material.dart';
import 'package:mobile/widgets/markdown.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Markdown(assetPath: 'assets/about.md'),
    );
  }
}
