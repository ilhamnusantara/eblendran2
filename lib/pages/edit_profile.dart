import 'package:eblendrang2/models/models.dart';
import 'package:flutter/material.dart';
import 'package:eblendrang2/themes.dart';
import 'package:eblendrang2/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    User user = authProvider.user;

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor2,
        centerTitle: true,
        title: Text(
          'Profile',
          style: secondTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        actions: [
          IconButton(
            icon: Container(
              child: Image.asset(
                'assets/icon_logout.png',
                width: 25,
              ),
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/sign-in', (route) => false);
            },
          ),
        ],
        elevation: 0,
        foregroundColor: blck,
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: primaryTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: user.user.name,
                hintStyle: subtitleTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: grayChoose,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget userNameInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: primaryTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: user.user.username,
                hintStyle: subtitleTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: grayChoose,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget instansi() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Instansi',
              style: primaryTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            // TextFormField(
            //   readOnly: true,
            //   decoration: InputDecoration(
            //     hintText: user.user.instansi.namaInstansi,
            //     hintStyle: subtitleTextStyle,
            //     enabledBorder: UnderlineInputBorder(
            //       borderSide: BorderSide(
            //         color: grayChoose,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      );
    }

    Widget currentPassword() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Password',
              style: primaryTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Current Password',
                hintStyle: subtitleTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: grayChoose,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget newPassword() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Password',
              style: primaryTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'New Password',
                hintStyle: subtitleTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: grayChoose,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget confirmPassword() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password Confirmation',
              style: primaryTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password Confirmation',
                hintStyle: subtitleTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: grayChoose,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget signInButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30, bottom: 50),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Simpan',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget content() {
      return SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            new Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: marginLogin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: marginLogin,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/icon_email.png',
                        ),
                      ),
                    ),
                  ),
                  nameInput(),
                  userNameInput(),
                  instansi(),
                  currentPassword(),
                  newPassword(),
                  confirmPassword(),
                  signInButton(),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor15,
      appBar: AppBar(
        backgroundColor: backgroundColor2,
        centerTitle: true,
        title: Text(
          'Profile',
          style: secondTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        actions: [
          IconButton(
            icon: Container(
              child: Image.asset(
                'assets/icon_logout.png',
                width: 25,
              ),
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/sign-in', (route) => false);
            },
          ),
        ],
        elevation: 0,
        foregroundColor: blck,
      ),
      body: content(),
      resizeToAvoidBottomInset: false, //untuk biar tidak eror / gambar jelek
    );
  }
}
