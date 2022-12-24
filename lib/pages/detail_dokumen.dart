import 'dart:convert';
import 'dart:io';

import 'package:eblendrang2/models/dokumen_model.dart';
import 'package:flutter/material.dart';
import 'package:eblendrang2/themes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class DetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetailPage();
  }
}

class _DetailPage extends State<DetailPage> {
  var keterangan_belanja = "";
  late Dokumen dokumen;
  // List data = widget.dokumen;
  @override
  void initState() {
    super.initState();
    dateInput.text = "";
    dateInput2.text = "";
    // _getData();
  }

  @override
  void didChangeDependencies() {
    var dokumenString = ModalRoute.of(context)?.settings.arguments as String;
    print('page 2');
    print(dokumenString);

    var dokumenJson = jsonDecode(dokumenString);
    print(dokumenJson);

    setState(() {
      dokumen = Dokumen.fromJson(dokumenJson);
      keterangan_belanja = dokumen.keteranganBelanja;
    });

    super.didChangeDependencies();
  }

  TextEditingController dateInput = TextEditingController();
  TextEditingController dateInput2 = TextEditingController();
  late File _foto;
  late PickedFile _pickedFile;
  final _picker = ImagePicker();

  Future<void> _chooseImageFromCamera() async {
    _pickedFile = (await _picker.getImage(source: ImageSource.camera))!;
    if (_pickedFile != null) {
      setState(() {
        _foto = File(_pickedFile.path);
      });
    }
  }

  @override
  Future<bool> _uploadFoto(int id_dokumen, File foto) async {
    final bytes = foto.readAsBytesSync();
    final data = {
      "id_dokumen": base64Encode(bytes),
      "foto": foto,
    };
    final url = "http://e-blendrang.id/api/updateFoto";
    final response = await http.put(
      Uri.parse(url),
      body: jsonEncode(data),
    );
    final message = jsonDecode(response.body);
    if (message == 1) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor2,
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Detail Dokumen',
          style: secondTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: primaryColor,
            ),
            onPressed: () {},
          ),
        ],
        foregroundColor: blck,
      );
    }

    Widget nameInstansi() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Instansi',
              // '${dokumen['keterangan_belanja']}',
              // '${dokumen[index]['keterangan_belanja']}',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 40,
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_email.png',
                      width: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    // Expanded(
                    //     child: TextFormField(
                    //   readOnly: true,
                    //   style: primaryTextStyle,
                    //   decoration: InputDecoration(
                    //     hintText: '' + (dokumen.instansi.namaInstansi),
                    //     // hintStyle: inputStyle,
                    //     enabledBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(
                    //         color: grayChoose,
                    //       ),
                    //     ),
                    //   ),
                    // )),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget noSPK() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nomor Surat Perjanjian Kerja',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 40,
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_code.png',
                      width: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                      style: primaryTextStyle,
                      decoration: InputDecoration(
                        hintText: '' + (dokumen.noSpk.toString()),
                        hintStyle: inputStyle,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: grayChoose,
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget dateSPK() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tanggal Surat Perjanjian Kerja',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 40,
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_date.png',
                      width: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                      controller: dateInput,
                      style: primaryTextStyle,
                      readOnly: true,
                      onTap: () async {
                        DateTime? dateSPK = DateTime.parse(dokumen.tglSpk);
                        dateSPK = await showDatePicker(
                          context: context,
                          initialDate: DateTime.parse(dokumen.tglSpk),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (dateSPK != null) {
                          print(dateSPK);
                          String formattedDate =
                              DateFormat('dd-MM-yyyy').format(dateSPK);
                          print(formattedDate);
                          setState(() {
                            dateInput.text = formattedDate;
                          });
                        } else {
                          print("Tanggal Kosong");
                        }
                      },
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget noBAST() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nomor Berita Acara Serah Terima',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 40,
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_code.png',
                      width: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                      style: primaryTextStyle,
                      decoration: InputDecoration(
                        hintText: '' + (dokumen.noBast.toString()),
                        hintStyle: inputStyle,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: grayChoose,
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget dateBAST() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tanggal Berita Acara Serah Terima',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 40,
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_date.png',
                      width: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                      controller: dateInput2,
                      style: primaryTextStyle,
                      readOnly: true,
                      onTap: () async {
                        DateTime? dateBAST = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (dateBAST != null) {
                          print(dateBAST);
                          String formattedDate =
                              DateFormat('dd-MM-yyyy').format(dateBAST);
                          print(formattedDate);
                          setState(() {
                            dateInput2.text = formattedDate;
                          });
                        } else {
                          print("Tanggal Kosong");
                        }
                      },
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget button() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: marginLogin,
          right: marginLogin,
        ),
        child: Row(
          children: [
            Expanded(
                child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pdf');
              },
              child: Text(
                "File SPK",
                style: secondTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: backgroundColor12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              // color: Colors.black,
              // textColor: Colors.white,
            )),
            SizedBox(
              width: 8,
            ),
            Expanded(
                child: TextButton(
              onPressed: _chooseImageFromCamera,
              child: Text(
                "Foto",
                style: secondTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: backgroundColor12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              // color: Colors.black,
              // textColor: Colors.white,
            )),
            SizedBox(
              width: 8,
            ),
            Expanded(
                child: TextButton(
              onPressed: () {},
              child: Text(
                "File BAST",
                style: secondTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: backgroundColor12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              // color: Colors.black,
              // textColor: Colors.white,
            )),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: marginLogin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 500,
              height: 100,
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: Column(
                children: [
                  Text(
                    '' + (dokumen.keteranganBelanja),
                    style: primaryTextStyle.copyWith(
                      fontSize: 25,
                      fontWeight: reguler,
                    ),
                  ),
                ],
              ),
            ),
            // tesnameInput(),
            nameInstansi(),
            noSPK(),
            dateSPK(),
            noBAST(),
            dateBAST(),
            button(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor15,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: backgroundColor2,
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Detail Dokumen',
          style: secondTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: primaryColor,
            ),
            onPressed: () {},
          ),
        ],
        foregroundColor: blck,
      ),
      body: content(),
    );
  }
}
