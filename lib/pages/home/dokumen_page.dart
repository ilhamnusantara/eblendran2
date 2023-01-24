// import 'dart:js';
import 'dart:convert';
import 'dart:math';
import 'package:eblendrang2/pages/home/main_page.dart';
import 'package:eblendrang2/pages/widgets/widgets.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
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

import '../../blocs/blocs_exports.dart';

class DokumenPage extends StatefulWidget {
  final int index;
  DokumenPage({required this.index});
  @override
  State<DokumenPage> createState() => _DokumenPageState();
}

class _DokumenPageState extends State<DokumenPage> {
  // bool fileSpk = false;
  // bool fileBast = false;
  // bool foto = false;
  // final List<DokumenModel> dokumens;
  final List<String> title = ['Blm Foto', 'Blm Bast', 'Blm SPK'];
  late int selectedIndex = widget.index;
  String? searching;
  // List<DokumenModel> allDokumens = [];
  // List<DokumenModel> filteredDokumens = [];
  Future<void> _getData() async {
    // try {
    //   final response =
    //       await http.get(Uri.parse("http://103.23.198.126/api/dokumens"));
    //   if (response.statusCode == 200) {
    //     final data = jsonDecode(response.body)['data'] as List<dynamic>;
    //     setState(() {
    //       allDokumens = [];
    //       allDokumens = data.map((e) => DokumenModel.fromJson(e)).toList();
    //       // _get = data;
    //       print(data);
    //     });
    //   }
    // } catch (e) {
    //   print(e);
    // }
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _runFilter(String text) {
    if (text.isEmpty) {
      setState(() {
        selectedIndex = 0;
      });
      return;
    } else {
      setState(() {
        searching = text.toUpperCase();
        selectedIndex = 4;
      });
    }
  }

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
        ),
        child: Text(
          'Informasi Data Dokumen',
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
          onChanged: _runFilter,
          decoration: const InputDecoration(
              labelText: 'Search Pekerjaan', suffixIcon: Icon(Icons.search)),
        ),
      );
    }

    Widget filterButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.all(12),
        child: TextButton(
          onPressed: () {
            filtered(context);
          },
          // (){Navigator.pushNamed(context, '/home');},
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'FILTER',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget item5() {
      return Expanded(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            BlocBuilder<DokumenBloc, DokumenState>(builder: (context, state) {
          if (state is DokumenLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DokumenLoadedState) {
            List<Dokumen> dokumen = state.dokumenList
                .where((element) => element.keteranganBelanja
                    .toString()
                    .toUpperCase()
                    .contains(searching!))
                .toList();
            if (dokumen.isNotEmpty) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: dokumen.length,
                  itemBuilder: (BuildContext context, int index) {
                    int i = 0;
                    debugPrint("i ke => ${i.toString()}");
                    i++;
                    return GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pushNamed('/detailDokumen',
                        //     arguments: jsonEncode(dokumen[index]));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                      dokumen: dokumen[index],
                                      namaInstansi: dokumen[index].namaInstansi,
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
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 40,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/icon_goverment.png',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${dokumen[index].keteranganBelanja}',
                                    style: primaryTextStyle.copyWith(
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                  Text(
                                    '${dokumen[index].namaInstansi}',
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
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/icon_information.png'),
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
                  });
            } else {
              return Center(
                child: Text(
                  "No Data",
                  style: subtitleTextStyle.copyWith(
                    fontWeight: light,
                  ),
                ),
              );
            }
          } else {
            return const Center(
              child: Text("ERROR"),
            );
          }
        }),
      ));
    }

    Widget item1() {
      return Expanded(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child:
            BlocBuilder<DokumenBloc, DokumenState>(builder: (context, state) {
          if (state is DokumenLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DokumenLoadedState) {
            List<Dokumen> dokumen = state.dokumenList.toList();
            if (dokumen.isNotEmpty) {
              return ListView.builder(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  shrinkWrap: true,
                  itemCount: dokumen.length,
                  itemBuilder: (BuildContext context, int index) {
                    int i = 0;
                    debugPrint("i ke => ${i.toString()}");
                    i++;
                    return GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pushNamed('/detailDokumen',
                        //     arguments: jsonEncode(dokumen[index]));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                      dokumen: dokumen[index],
                                      namaInstansi: dokumen[index].namaInstansi,
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
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 40,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/icon_goverment.png',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${dokumen[index].keteranganBelanja}',
                                    style: primaryTextStyle.copyWith(
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                  Text(
                                    '${dokumen[index].namaInstansi}',
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
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/icon_information.png'),
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
                  });
            } else {
              return Center(
                child: Text(
                  "No Data",
                  style: subtitleTextStyle.copyWith(
                    fontWeight: light,
                  ),
                ),
              );
            }
          } else {
            return const Center(
              child: Text("ERROR"),
            );
          }
        }),
      ));
    }

    Widget item2() {
      return Expanded(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            BlocBuilder<DokumenBloc, DokumenState>(builder: (context, state) {
          if (state is DokumenLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DokumenLoadedState) {
            List<Dokumen> dokumen = state.dokumenList
                .where((element) =>
                    element.foto.toUpperCase().contains("NOT DETECT"))
                .toList();
            if (dokumen.isNotEmpty) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: dokumen.length,
                  itemBuilder: (BuildContext context, int index) {
                    int i = 0;
                    debugPrint("i ke => ${i.toString()}");
                    i++;
                    return GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pushNamed('/detailDokumen',
                        //     arguments: jsonEncode(dokumen[index]));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                      dokumen: dokumen[index],
                                      namaInstansi: dokumen[index].namaInstansi,
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
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 40,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/icon_goverment.png',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${dokumen[index].keteranganBelanja}',
                                    style: primaryTextStyle.copyWith(
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                  Text(
                                    '${dokumen[index].namaInstansi}',
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
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/icon_information.png'),
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
                  });
            } else {
              return Center(
                child: Text(
                  "No Data",
                  style: subtitleTextStyle.copyWith(
                    fontWeight: light,
                  ),
                ),
              );
            }
          } else {
            return const Center(
              child: Text("ERROR"),
            );
          }
        }),
      ));
    }

    Widget item3() {
      return Expanded(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            BlocBuilder<DokumenBloc, DokumenState>(builder: (context, state) {
          if (state is DokumenLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DokumenLoadedState) {
            List<Dokumen> dokumen = state.dokumenList
                .where((element) =>
                    element.fileBast.toUpperCase().contains("NOT DETECT"))
                .toList();
            if (dokumen.isNotEmpty) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: dokumen.length,
                  itemBuilder: (BuildContext context, int index) {
                    int i = 0;
                    debugPrint(i.toString());
                    i++;
                    return GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pushNamed('/detailDokumen',
                        //     arguments: jsonEncode(dokumen[index]));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                      dokumen: dokumen[index],
                                      namaInstansi: dokumen[index].namaInstansi,
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
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 40,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/icon_goverment.png',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${dokumen[index].keteranganBelanja}',
                                    style: primaryTextStyle.copyWith(
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                  Text(
                                    '${dokumen[index].namaInstansi}',
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
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/icon_information.png'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: Text(
                  "No Data",
                  style: subtitleTextStyle.copyWith(
                    fontWeight: light,
                  ),
                ),
              );
            }
          } else {
            return const Center(
              child: Text("ERROR"),
            );
          }
        }),
      ));
    }

    Widget item4() {
      return Expanded(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            BlocBuilder<DokumenBloc, DokumenState>(builder: (context, state) {
          if (state is DokumenLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DokumenLoadedState) {
            List<Dokumen> dokumen = state.dokumenList
                .where((element) =>
                    element.fileSpk.toUpperCase().contains("NOT DETECT"))
                .toList();
            if (dokumen.isNotEmpty) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: dokumen.length,
                  itemBuilder: (BuildContext context, int index) {
                    int i = 0;
                    debugPrint(i.toString());
                    i++;
                    return GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pushNamed('/detailDokumen',
                        //     arguments: jsonEncode(dokumen[index]));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                      dokumen: dokumen[index],
                                      namaInstansi: dokumen[index].namaInstansi,
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
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 40,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/icon_goverment.png',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${dokumen[index].keteranganBelanja}',
                                    style: primaryTextStyle.copyWith(
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                  Text(
                                    '${dokumen[index].namaInstansi}',
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
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/icon_information.png'),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: Text(
                  "No Data",
                  style: subtitleTextStyle.copyWith(
                    fontWeight: light,
                  ),
                ),
              );
            }
          } else {
            return const Center(
              child: Text("ERROR"),
            );
          }
        }),
      ));
    }

    return Column(
      children: [
        header(),
        titlePage(),
        search(),
        filterButton(),
        // CustomTabBar(
        //     titles: title,
        //     selectedIndex: selectedIndex,
        //     onTap: (index) {
        //       setState(() {
        //         selectedIndex = index;
        //       });
        //     }),

        (selectedIndex == 0)
            ? item1()
            : (selectedIndex == 1)
                ? item2()
                : (selectedIndex == 2)
                    ? item3()
                    : (selectedIndex == 3)
                        ? item4()
                        : item5(),
      ],
    );
  }
}

//http://www.barajacoding.or.id/radio-button-in-flutter/

Future<AwesomeDialog> filtered(
  BuildContext context,
) async {
  int fIndex = 0;
  return AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.question,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        const Text("Filter File",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black)),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MainPage(cIndex: 1, fIndex: 1)));
          },
          child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xff263238), width: 1),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text("Blm ada Foto",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ),
              )),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MainPage(cIndex: 1, fIndex: 2)));
          },
          child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xff263238), width: 1),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text("Blm ada SPK",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ),
              )),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MainPage(cIndex: 1, fIndex: 3)));
          },
          child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xff263238), width: 1),
              ),
              child: const Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text("Blm ada BAST",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  ))),
        ),
        const SizedBox(height: 10),
      ],
    ),
    title: 'Filter',
    desc: 'Kategori :',
    btnCancelOnPress: () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MainPage(cIndex: 1, fIndex: 0)));
    },
  )..show();
}
// Widget item() {
    //   return Container(
    //       margin: EdgeInsets.only(
    //         top: 10,
    //         left: marginLogin,
    //         right: marginLogin,
    //       ),
    //       child: filteredDokumens.length == 0
    //           ? ListView.builder(
    //               shrinkWrap: true,
    //               itemCount: allDokumens.length,
    //               itemBuilder: (BuildContext context, int index) {
    //                 return GestureDetector(
    //                   onTap: () {
    //                     Navigator.of(context).pushNamed('/detailDokumen',
    //                         arguments: jsonEncode(allDokumens[index]));
    //                   },
    //                   child: new Card(
    //                     elevation: 12,
    //                     color: backgroundColor13,
    //                     shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(12),
    //                     ),
    //                     child: Row(
    //                       children: [
    //                         SizedBox(
    //                           width: 15,
    //                         ),
    //                         Container(
    //                           width: 40,
    //                           height: 80,
    //                           decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(5),
    //                             image: DecorationImage(
    //                               image: AssetImage(
    //                                 'assets/icon_goverment.png',
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           width: 12,
    //                         ),
    //                         Expanded(
    //                           child: Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               Text(
    //                                 '${allDokumens[index].keterangan_belanja}',
    //                                 style: primaryTextStyle.copyWith(
    //                                   fontWeight: semiBold,
    //                                 ),
    //                               ),
    //                               Text(
    //                                 '${allDokumens[index].instansi.nama_instansi}',
    //                                 style: subtitleTextStyle.copyWith(
    //                                   fontWeight: light,
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                         Container(
    //                           width: 23,
    //                           height: 23,
    //                           decoration: BoxDecoration(
    //                             shape: BoxShape.circle,
    //                             image: DecorationImage(
    //                               image:
    //                                   AssetImage('assets/icon_information.png'),
    //                             ),
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           width: 15,
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 );
    //               })
    //           : ListView.builder(
    //               shrinkWrap: true,
    //               itemCount: filteredDokumens.length,
    //               itemBuilder: (BuildContext context, int index) {
    //                 return GestureDetector(
    //                   onTap: () {
    //                     Navigator.of(context).pushNamed('/detailDokumen',
    //                         arguments: jsonEncode(filteredDokumens[index]));
    //                   },
    //                   child: new Card(
    //                     elevation: 12,
    //                     color: backgroundColor13,
    //                     shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(12),
    //                     ),
    //                     child: Row(
    //                       children: [
    //                         SizedBox(
    //                           width: 15,
    //                         ),
    //                         Container(
    //                           width: 40,
    //                           height: 80,
    //                           decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(5),
    //                             image: DecorationImage(
    //                               image: AssetImage(
    //                                 'assets/icon_goverment.png',
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           width: 12,
    //                         ),
    //                         Expanded(
    //                           child: Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               Text(
    //                                 '${filteredDokumens[index].keterangan_belanja}',
    //                                 style: primaryTextStyle.copyWith(
    //                                   fontWeight: semiBold,
    //                                 ),
    //                               ),
    //                               Text(
    //                                 '${filteredDokumens[index].instansi.nama_instansi}',
    //                                 style: subtitleTextStyle.copyWith(
    //                                   fontWeight: light,
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                         Container(
    //                           width: 23,
    //                           height: 23,
    //                           decoration: BoxDecoration(
    //                             shape: BoxShape.circle,
    //                             image: DecorationImage(
    //                               image:
    //                                   AssetImage('assets/icon_information.png'),
    //                             ),
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           width: 15,
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 );
    //               })
    //       // child: ListView.builder(
    //       //     shrinkWrap: true,
    //       //     itemCount: filteredDokumens.length,
    //       //     itemBuilder: (BuildContext context, index){
    //       //       return GestureDetector(
    //       //         onTap: () {
    //       //           Navigator.of(context).pushNamed('/detailDokumen', arguments: jsonEncode(filteredDokumens[index]));
    //       //         },
    //       //         child: new Card(
    //       //           elevation: 12,
    //       //           color: backgroundColor13,
    //       //           shape: RoundedRectangleBorder(
    //       //             borderRadius: BorderRadius.circular(12),
    //       //           ),
    //       //           child: Row(
    //       //             children: [
    //       //               SizedBox(
    //       //                 width: 15,
    //       //               ),
    //       //               Container(
    //       //                 width: 40,
    //       //                 height: 80,
    //       //                 decoration: BoxDecoration(
    //       //                   borderRadius: BorderRadius.circular(5),
    //       //                   image: DecorationImage(
    //       //                     image: AssetImage(
    //       //                       'assets/icon_goverment.png',
    //       //                     ),
    //       //                   ),
    //       //                 ),
    //       //               ),
    //       //               SizedBox(
    //       //                 width: 12,
    //       //               ),
    //       //               Expanded(
    //       //                 child: Column(
    //       //                   crossAxisAlignment: CrossAxisAlignment.start,
    //       //                   children: [
    //       //                     Text(
    //       //                       '${filteredDokumens[index].keterangan_belanja}',
    //       //                       style: primaryTextStyle.copyWith(
    //       //                         fontWeight: semiBold,
    //       //                       ),
    //       //                     ),
    //       //                     Text(
    //       //                       '${filteredDokumens[index].instansi.nama_instansi}',
    //       //                       style: subtitleTextStyle.copyWith(
    //       //                         fontWeight: light,
    //       //                       ),
    //       //                     ),
    //       //                   ],
    //       //                 ),
    //       //               ),
    //       //               Container (
    //       //                 width: 23,
    //       //                 height: 23,
    //       //                 decoration: BoxDecoration(
    //       //                   shape: BoxShape.circle,
    //       //                   image: DecorationImage(image: AssetImage('assets/icon_information.png'),),
    //       //                 ),
    //       //               ),
    //       //               SizedBox(
    //       //                 width: 15,
    //       //               ),
    //       //             ],
    //       //           ),
    //       //         ),
    //       //       );
    //       //     }
    //       // ),

    //       );
    // }