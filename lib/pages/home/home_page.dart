import 'dart:convert';
import 'package:eblendrang2/models/instansi_model.dart';
import 'package:eblendrang2/models/models.dart';
import 'package:eblendrang2/pages/addData_page.dart';
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

  @override
  void initState() {
    context.read<InstansiBloc>().add(LoadInstansi());
    super.initState();
  }

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
          top: 67,
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddData(
                          user: user,
                        )));
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
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<InstansiBloc>().add(LoadInstansi());
            },
            child: FutureBuilder(
                future: getPrefs(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var aa = snapshot.data!;
                    return Container(
                      margin: EdgeInsets.only(
                        top: 8,
                        left: marginLogin,
                        right: marginLogin,
                      ),
                      child: BlocBuilder<InstansiBloc, InstansiState>(
                          builder: (context, state) {
                        if (state is InstansiLoadingState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is InstansiLoadedState) {
                          List<Instansi> instansi = (aa[0] == 0)
                              ? state.instansiList
                                  .where(
                                      (element) => element.idInstansi == aa[1])
                                  .toList()
                              : state.instansiList;
                          if (instansi.isNotEmpty) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: instansi.length,
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              itemBuilder: (BuildContext context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DokumenInstansi(
                                                  docList: instansi[index]
                                                      .dokumenList,
                                                  namaInstansi: instansi[index]
                                                      .namaInstansi,
                                                )));
                                  },
                                  child: Card(
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
                                            borderRadius:
                                                BorderRadius.circular(5),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${instansi[index].namaInstansi}',
                                                style:
                                                    primaryTextStyle.copyWith(
                                                  fontWeight: semiBold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          '${instansi[index].dokumen_count} Item',
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
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        titlePage(),
        item(),
      ],
    );
  }
}

Future<List> getPrefs() async {
  final SharedPreferences pref = await SharedPreferences.getInstance();

  int? status = pref.getInt('status');
  int? id_instansi = pref.getInt('idInstansi');
  var a = [status!, id_instansi!];
  return a;
}
