// import 'dart:js';
import 'dart:convert';
import 'dart:math';

import 'package:eblendrang2/models/dokumen_model.dart';
import 'package:eblendrang2/models/models.dart';
import 'package:eblendrang2/models/user_model.dart';
import 'package:eblendrang2/pages/detail_dokumen.dart';
import 'package:eblendrang2/pages/widgets/dokumen_title.dart';
import 'package:eblendrang2/providers/dokumen_provider.dart';
import 'package:flutter/material.dart';
import 'package:eblendrang2/themes.dart';
import 'package:eblendrang2/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DokumenPage extends StatefulWidget {
  @override
  State<DokumenPage> createState() => _DokumenPageState();
}

class _DokumenPageState extends State<DokumenPage> {
  // bool fileSpk = false;
  // bool fileBast = false;
  // bool foto = false;
  // final List<DokumenModel> dokumens;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  List<DokumenModel> allDokumens = [];
  List<DokumenModel> filteredDokumens = [];

  Future<void> _getData() async {
    try {
      final response =
          await http.get(Uri.parse("http://e-blendrang.id/api/dokumens"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'] as List<dynamic>;
        setState(() {
          allDokumens = [];
          allDokumens = data.map((e) => DokumenModel.fromJson(e)).toList();
          filteredDokumens = allDokumens;
          // _get = data;
          print(data);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void _runFilter(String searchKeyword) {
    List<DokumenModel> results = [];
    if (searchKeyword.isEmpty) {
      results = allDokumens;
    } else {
      results = allDokumens
          .where((element) => element.keterangan_belanja
              .toLowerCase()
              .contains(searchKeyword.toLowerCase()))
          .toList();
    }

    // refresh the UI
    setState(() {
      filteredDokumens = results;
    });
  }

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

    Widget search() {
      return Container(
        margin: EdgeInsets.only(
          top: 8,
          left: marginLogin,
          right: marginLogin,
        ),
        child: TextField(
          // onChanged: (value) =>,
          decoration: const InputDecoration(
              labelText: 'Search Pekerjaan', suffixIcon: Icon(Icons.search)),
        ),
      );
    }

    Widget item() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
          left: marginLogin,
          right: marginLogin,
        ),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: filteredDokumens.length,
            itemBuilder: (BuildContext context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/detailDokumen',
                      arguments: jsonEncode(filteredDokumens[index]));
                },
                child: new Card(
                  elevation: 12,
                  color: backgroundColor13,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 40,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/icon_goverment.png',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${filteredDokumens[index].keterangan_belanja}',
                              style: primaryTextStyle.copyWith(
                                fontWeight: semiBold,
                              ),
                            ),
                            Text(
                              '${filteredDokumens[index].instansi.nama_instansi}',
                              style: subtitleTextStyle.copyWith(
                                fontWeight: light,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 23,
                        height: 23,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/icon_information.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              );
            }),
      );
    }

    return ListView(
      children: [
        header(),
        titlePage(),
        search(),
        item(),
      ],
    );
  }
}
