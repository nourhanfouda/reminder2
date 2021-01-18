import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pills_reminder/UI/3home.dart';
import 'package:pills_reminder/utilities/Colors.dart';

class Intro2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            image: DecorationImage(
                image: AssetImage('assets/images/intro2.png'),
                fit: BoxFit.contain)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Text(
                translator.translate('intro2'),
                style: TextStyle(
                    color: maincolor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: FlatButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Home();
                    }));
                  },
                  child: Text(
                    translator.translate('Skip'),
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                      //fontWeight: FontWeight.w100
                    ),
                    textAlign: TextAlign.center,
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
