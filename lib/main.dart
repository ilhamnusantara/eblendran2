// @dart=2.9

import 'package:eblendrang2/pages/addData_page.dart';
import 'package:eblendrang2/pages/detail_dokumen.dart';
import 'package:eblendrang2/pages/edit_profile.dart';
import 'package:eblendrang2/pages/home/dokumen_page.dart';
import 'package:eblendrang2/pages/home/main_page.dart';
import 'package:eblendrang2/pages/pdf.dart';
import 'package:eblendrang2/pages/splash_page.dart';
import 'package:eblendrang2/pages/sign_in_page.dart';
import 'package:eblendrang2/providers/auth_provider.dart';
import 'package:eblendrang2/providers/dokumen_provider.dart';
import 'package:eblendrang2/services/dokumen_service.dart';
import 'package:eblendrang2/services/instansi_services.dart';
import 'package:flutter/material.dart';
import 'package:eblendrang2/pages/splash_screen_page.dart';
import 'package:eblendrang2/blocs/blocs_exports.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        BlocProvider(
            create: (_) => DokumenBloc(DokumenService())..add(LoadDokumen())),
        BlocProvider(
            create: (_) => InstansiBloc(InstansiService())..add(LoadInstansi()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SpashScreenPage(),
          // '/': (context) => SplashScreen(),
          '/sign-in': (context) => SigninPage(),
          '/home': (context) => MainPage(
                cIndex: 0,
                fIndex: 0,
              ),
          '/detailDokumen': (context) => DetailPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/addAll': (context) => AddData(),
          '/pdf': (context) => Pdf(),
          '/dokumen-page': (context) => DokumenPage(),
          // '/coba' : (context) => coba(),
        },
      ),
    );
  }
}
