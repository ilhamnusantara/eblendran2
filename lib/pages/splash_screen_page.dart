import 'package:eblendrang2/providers/dokumen_provider.dart';
import 'package:eblendrang2/themes.dart';
import 'package:flutter/material.dart';
import 'package:eblendrang2/pages/sign_in_page.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:eblendrang2/pages/addData_page.dart';

class SpashScreenPage extends StatefulWidget {
  @override
  State<SpashScreenPage> createState() => _SpashScreenPageState();
}

class _SpashScreenPageState extends State<SpashScreenPage> {
  // @override
  // void initState() {
  //   getInit();
  //   super.initState();
  // }

  // getInit() async {
  //   await Provider.of<DokumenProvider>(context, listen: false).getDokumens();
  //   // Navigator.pushNamed(context, '/sign-in');
  // }

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      backgroundColor: backgroundColor15,
      seconds: 3,
      navigateAfterSeconds: SigninPage(),
      // navigateAfterSeconds: AddData(),
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
