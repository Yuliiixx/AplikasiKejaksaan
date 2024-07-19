import 'package:flutter/material.dart';
import 'package:kejaksaanapp/widget/ratingBox.dart';



class RatingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rating Page'),
      ),
      body: Center(
        child: RatingBox(),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RatingPage(),
  ));
}
