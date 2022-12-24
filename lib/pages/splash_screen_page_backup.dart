import 'package:eblendrang2/themes.dart';
import 'package:flutter/material.dart';
import 'package:eblendrang2/pages/sign_in_page.dart';
import 'package:splashscreen/splashscreen.dart';

class SpashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      backgroundColor: backgroundColor15,
      seconds: 3,
      navigateAfterSeconds: SigninPage(),
      title: new Text(
        'E-Blendrang Kecamatan Taman',
        textScaleFactor: 1.8,
        style: TextStyle(
          color: blck,
        ),
      ),
      loadingText: Text(
        'Orang sabar disayang Tuhan',
        style: TextStyle(
          color: blck,
        ),
      ),
      image: Image.asset('assets/image_sda.png'),
      loaderColor: blck,
      photoSize: 150.0,
    );
  }
}
