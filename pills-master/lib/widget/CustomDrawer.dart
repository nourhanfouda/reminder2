import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pills_reminder/UI/3home.dart';
import 'package:pills_reminder/UI/8aboutus.dart';
import 'package:pills_reminder/utilities/Colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Customdrawer extends StatelessWidget {
  contactus(String senderEmail, String reciverEmail, String emailTitle,
      String emailBody) async {
    Uri uri = Uri(
        scheme: 'mailto',
        path: reciverEmail,
        queryParameters: {'subject': emailTitle, 'body': emailBody});
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      print('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 50),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(translator.translate("home"),
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              leading: Icon(Icons.home, color: maincolor, size: 25),
              contentPadding: EdgeInsets.all(10),
              dense: true,
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Home();
                }));
              },
            ),
            Divider(
              thickness: 0.5,
              endIndent: 20,
            ),
            ListTile(
              title: Text(translator.translate("Medicinereport"),
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              leading: Icon(Icons.receipt, color: maincolor, size: 25),
              contentPadding: EdgeInsets.all(10),
              dense: true,
              onTap: () {},
            ),
            Divider(
              thickness: 0.5,
              endIndent: 20,
            ),
            ListTile(
              title: Text(translator.translate("Vitaminreport"),
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              leading: Icon(Icons.receipt, color: maincolor, size: 25),
              contentPadding: EdgeInsets.all(10),
              dense: true,
              onTap: () {},
            ),
            Divider(
              thickness: 0.5,
              endIndent: 20,
            ),
            ListTile(
              title: Text(translator.translate("Language"),
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              leading: Icon(Icons.language, color: maincolor, size: 25),
              contentPadding: EdgeInsets.all(10),
              dense: true,
              onTap: () {
                translator.setNewLanguage(
                  context,
                  newLanguage: translator.currentLanguage == 'ar' ? 'en' : 'ar',
                  remember: true,
                  restart: true,
                );
              },
            ),
            Divider(
              thickness: 0.5,
              endIndent: 20,
            ),
            ListTile(
              title: Text(translator.translate("Aboutapp"),
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              leading: Icon(Icons.info, color: maincolor, size: 25),
              contentPadding: EdgeInsets.all(10),
              dense: true,
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Aboutus();
                }));
              },
            ),
            Divider(
              thickness: 0.5,
              endIndent: 20,
            ),
            ListTile(
              title: Text(translator.translate("Contactus"),
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              leading: Icon(Icons.phone, color: maincolor, size: 25),
              contentPadding: EdgeInsets.all(10),
              dense: true,
              onTap: () {
                contactus('', 'nourhanfouda97@gmail.com', '', '');
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return;
                // }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
