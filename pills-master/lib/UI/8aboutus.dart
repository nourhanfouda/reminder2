import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pills_reminder/utilities/Colors.dart';
import 'package:pills_reminder/utilities/style.dart';
import 'package:pills_reminder/widget/CustomAppBar.dart';
import 'package:pills_reminder/widget/CustomDrawer.dart';

class Aboutus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        title: Text(
          'About App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        // elevation: 8,
      ),
      body: Container(
        color: maincolor,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Remindy',
              style: Style.projectname,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 8, right: 8),
              child: Text(
                'Our App Help You To Organize Your Medicine And Vitamine Dates',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    // fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
