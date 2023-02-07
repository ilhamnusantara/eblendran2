import 'package:eblendrang2/models/models.dart';
import 'package:flutter/material.dart';
import 'package:eblendrang2/themes.dart';
import 'package:eblendrang2/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import '../blocs/blocs_exports.dart';
import '../models/user_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/main_page.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final List<String> items = [
    '2023',
    '2022',
  ];

  String? selectedValue;

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
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: user.user.nama_instansi,
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
            Container(
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
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/icon_email.png',
                        ),
                      ),
                    ),
                  ),
                  //disini tempat set Tahun

                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      hint: Row(
                        children: [
                          const Icon(
                            Icons.list,
                            size: 16,
                            color: Colors.yellow,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Pilih Tahun',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) async {
                        setState(() {
                          selectedValue = value as String;
                        });
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString("session", selectedValue!);
                        context.read<DokumenBloc>().add(LoadDokumen());
                        context.read<InstansiBloc>().add(LoadInstansi());
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) =>
                                    MainPage(cIndex: 0, fIndex: 0)),
                            (route) => false);
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.yellow,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 160,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Color.fromARGB(255, 78, 86, 75),
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 200,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color.fromARGB(255, 102, 112, 99),
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(-20, 0),
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
