import 'package:eblendrang2/models/models.dart';
import 'package:eblendrang2/models/user_model.dart';
import 'package:eblendrang2/pages/widgets/instansi_title.dart';
import 'package:eblendrang2/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:eblendrang2/themes.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    User user = authProvider.user;

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: marginLogin,
          right: marginLogin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${user.user.name}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '@${user.user.username}',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/edit-profile',
                );
              },
              child: Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/icon_email.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget titlePage() {
      return Container(
        margin: EdgeInsets.only(
          top: 50,
          left: marginLogin,
          right: marginLogin,
          bottom: 14,
        ),
        child: Text(
          'Informasi Instansi belum upload file',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget item() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: marginLogin,
          right: marginLogin,
        ),
        child: Column(
          children: [
            InstansiTitle(),
            InstansiTitle(),
            InstansiTitle(),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        titlePage(),
        item(),
      ],
    );
  }
}
