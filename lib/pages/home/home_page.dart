import 'dart:convert';
import 'package:eblendrang2/models/instansi_model.dart';
import 'package:eblendrang2/models/models.dart';
import 'package:eblendrang2/models/user_model.dart';
import 'package:eblendrang2/pages/page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eblendrang2/pages/widgets/instansi_title.dart';
import 'package:eblendrang2/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:eblendrang2/themes.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../blocs/blocs_exports.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // void initState() {
  //   super.initState();
  //   _getInstansi();
  // }

  // List<Instansi> allinstansis = [];

  // Future<void> _getInstansi() async {
  //   try {
  //     final response =
  //         await http.get(Uri.parse("http://103.23.198.126/api/dokumenValue"));
  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body)['data'] as List<dynamic>;
  //       setState(() {
  //         allinstansis = data.map((e) => Instansi.fromJson(e)).toList();
  //         // filteredDokumens = allDokumens;
  //         // _get = data;
  //         print(data);
  //       });
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

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
                decoration: const BoxDecoration(
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
      List<String> aa = getPrefs() as List<String>;
      return Container(
        margin: EdgeInsets.only(
          top: 8,
          left: marginLogin,
          right: marginLogin,
        ),
        child:
            BlocBuilder<InstansiBloc, InstansiState>(builder: (context, state) {
          if (state is InstansiLoadingState) {
            return const CircularProgressIndicator();
          } else if (state is InstansiLoadedState) {
            List<Instansi> instansi = (aa[0] == '0')
                ? state.instansiList
                    .where((element) => element.idInstansi == aa[1])
                    .toList()
                : state.instansiList;
            if (instansi.isNotEmpty) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: instansi.length,
                padding: new EdgeInsets.only(
                  top: 10,
                ),
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DokumenInstansi(
                                docList: instansi[index].dokumenList,
                                namaInstansi: instansi[index].namaInstansi,
                              )));
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
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${instansi[index].namaInstansi}',
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: semiBold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '${instansi[index].data_null} Item',
                            style: inputStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                  "No Data",
                  style: primaryTextStyle,
                ),
              );
            }
          } else {
            return const Center(
              child: Text("ERROR"),
            );
          }
        }),
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

Future<List<String>> getPrefs() async {
  final SharedPreferences pref = await SharedPreferences.getInstance();

  String? status = pref.getString('status');
  String? id_instansi = pref.getString('idInstansi');
  List<String> a = [];
  a[0] = status!;
  a[1] = id_instansi!;
  return a;
}
