import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:eblendrang2/blocs/blocs_exports.dart';
import 'package:eblendrang2/models/dokumen_model.dart';
import 'package:eblendrang2/pages/home/main_page.dart';
import 'package:eblendrang2/pages/pdf.dart';
import 'package:eblendrang2/services/dokumen_service.dart';
import 'package:flutter/material.dart';
import 'package:eblendrang2/themes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class DetailPage extends StatefulWidget {
  final Dokumen dokumen;
  String? namaInstansi;
  DetailPage({required this.dokumen, this.namaInstansi});

  @override
  State<StatefulWidget> createState() {
    return _DetailPage();
  }
}

class _DetailPage extends State<DetailPage> {
  TextEditingController noSpk = TextEditingController();
  TextEditingController noBast = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  TextEditingController dateInput2 = TextEditingController();
  late File _foto;
  late PickedFile _pickedFile;
  final _picker = ImagePicker();
  String? navigator, tipeData;

  @override
  void initState() {
    super.initState();
    dateInput2.text = widget.dokumen.tglBast;
    dateInput.text = widget.dokumen.tglSpk;
    noBast.text = widget.dokumen.noBast;
    noSpk.text = widget.dokumen.noSpk;
  }

  Future<void> _chooseImageFromCamera(
      String path, String field, String dir) async {
    final _pickedFile =
        await _picker.getImage(source: ImageSource.camera, imageQuality: 50);
    if (_pickedFile != null) {
      setState(() {
        _foto = File(_pickedFile!.path);
      });
      String res = await DokumenService().asyncFileUpload(
          widget.dokumen.idDokumen.toString(), _foto, path, field);
      (res.toUpperCase().contains("DATA BERHASIL DI UPLOAD"))
          ? AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              title: 'Selamat..',
              desc: "Data berhasil di update.. Terimakasih.",
              btnOkOnPress: () async {
                setState(() {});
                Navigator.pop(context);
              },
            ).show()
          : AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'Maaf..!',
              desc: "Data gagal di upload, Silahkan ulangi lagi ya...",
              btnOkOnPress: () async {
                setState(() {});
                Navigator.pop(context);
              },
            ).show();
    }
  }

  Future<AwesomeDialog> filtered1(BuildContext context, String jenisFile,
      {String? title}) async {
    int fIndex = 0;
    return AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.question,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          const Text("Pilih Actions...",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              (jenisFile.toUpperCase().contains("SPK"))
                  ? Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Pdf(
                            dokumen: widget.dokumen,
                            source: "GALERY",
                            tipeData: jenisFile,
                            namaInstansi: (widget.namaInstansi == null)
                                ? widget.dokumen.namaInstansi
                                : widget.namaInstansi,
                            field: "file_spk",
                            path: "updateSpk",
                            title: (title == null)
                                ? "Please Add a file $jenisFile"
                                : title,
                          )))
                  : Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Pdf(
                            dokumen: widget.dokumen,
                            source: "GALERY",
                            tipeData: jenisFile,
                            namaInstansi: (widget.namaInstansi == null)
                                ? widget.dokumen.namaInstansi
                                : widget.namaInstansi,
                            field: "file_bast",
                            path: "updateBast",
                            title: (title == null)
                                ? "Please Add a file $jenisFile"
                                : title,
                          )));
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
                    child: Text("UPLOAD DATA",
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
              (jenisFile.toUpperCase().contains("SPK"))
                  ? Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Pdf(
                            dokumen: widget.dokumen,
                            source: "CAMERA",
                            tipeData: jenisFile,
                            namaInstansi: (widget.namaInstansi == null)
                                ? widget.dokumen.namaInstansi
                                : widget.namaInstansi,
                            field: "file_spk",
                            path: "updateSpk",
                            title: (title == null)
                                ? "Please Add a file $jenisFile"
                                : title,
                          )))
                  : Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Pdf(
                            dokumen: widget.dokumen,
                            source: "CAMERA",
                            tipeData: jenisFile,
                            namaInstansi: (widget.namaInstansi == null)
                                ? widget.dokumen.namaInstansi
                                : widget.namaInstansi,
                            field: "file_bast",
                            path: "updateBast",
                            title: (title == null)
                                ? "Please Add a file $jenisFile"
                                : title,
                          )));
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
                    child: Text("AMBIL DATA MANUAL",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  ),
                )),
          ),
          const SizedBox(height: 10),
        ],
      ),
      title: 'Filter',
      desc: 'Kategori :',
      // btnCancelOnPress: () {
      //   Navigator.pop(context);
      // },
    )..show();
  }

  @override
  Widget build(BuildContext context) {
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
                    Expanded(
                        child: TextFormField(
                      readOnly: true,
                      style: primaryTextStyle,
                      decoration: InputDecoration(
                        hintText: widget.namaInstansi == null
                            ? widget.dokumen.namaInstansi
                            : widget.namaInstansi,
                        // hintStyle: inputStyle,
                        // enabledBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(
                        //     color: grayChoose,
                        //   ),
                        // ),
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
                      controller: noSpk,
                      decoration: InputDecoration(
                        hintText: widget.dokumen.noSpk.toString(),
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
                        child: TextField(
                      decoration:
                          InputDecoration(hintText: widget.dokumen.tglSpk),
                      controller: dateInput,
                      style: primaryTextStyle,
                      readOnly: true,
                      onTap: () async {
                        DateTime? dateSPK = await showDatePicker(
                          context: context,
                          initialDate: (widget.dokumen.tglSpk != 'Not Detect')
                              ? DateTime.parse(widget.dokumen.tglSpk)
                              : DateTime.now(),
                          firstDate: DateTime(2021),
                          lastDate: DateTime(2101),
                        );
                        if (dateSPK != null) {
                          print(dateSPK);
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(dateSPK);
                          print(formattedDate);
                          setState(() {
                            dateInput.text = formattedDate;
                          });
                        } else {
                          dateInput.text = widget.dokumen.tglSpk;
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
                      controller: noBast,
                      decoration: InputDecoration(
                        hintText: '' + (widget.dokumen.noBast.toString()),
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
                      decoration:
                          InputDecoration(hintText: widget.dokumen.tglBast),
                      style: primaryTextStyle,
                      readOnly: true,
                      onTap: () async {
                        DateTime? dateBAST = await showDatePicker(
                          context: context,
                          initialDate: (widget.dokumen.noBast != 'Not Detect')
                              ? DateTime.parse(widget.dokumen.tglBast)
                              : DateTime.now(),
                          firstDate: DateTime(2021),
                          lastDate: DateTime(2101),
                        );
                        if (dateBAST != null) {
                          print(dateBAST);
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(dateBAST);
                          print(formattedDate);
                          setState(() {
                            dateInput2.text = formattedDate;
                          });
                        } else {
                          dateInput2.text = widget.dokumen.tglBast;
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
            (widget.dokumen.fileSpk.toUpperCase().contains("NOT DETECT"))
                ? Expanded(
                    child: TextButton(
                    onPressed: () {
                      filtered1(context, "SPK");
                    },
                    child: Text(
                      "New SPK",
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
                  ))
                : Expanded(
                    child: TextButton(
                    onPressed: () {
                      filtered1(context, "SPK", title: "Update File SPK");
                    },
                    child: Center(
                      child: Text(
                        "Update SPK",
                        style: secondTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: light,
                        ),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.brown[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    // color: Colors.black,
                    // textColor: Colors.white,
                  )),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                child: TextButton(
              onPressed: () {
                _chooseImageFromCamera("updateFoto", "foto", "CAMERA");
              },
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
            const SizedBox(
              width: 8,
            ),
            (widget.dokumen.fileBast.toUpperCase().contains("NOT DETECT"))
                ? Expanded(
                    child: TextButton(
                    onPressed: () {
                      filtered1(context, "BAST");
                    },
                    child: Text(
                      "new BAST",
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
                  ))
                : Expanded(
                    child: TextButton(
                    onPressed: () {
                      filtered1(context, "BAST", title: "Update File BAST");
                    },
                    child: Center(
                      child: Text(
                        "Update BAST",
                        style: secondTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: light,
                        ),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.brown[100],
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
              margin: const EdgeInsets.only(
                top: 20,
              ),
              child: Column(
                children: [
                  Text(
                    '' + (widget.dokumen.keteranganBelanja),
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
          icon: const Icon(Icons.close),
          color: Colors.white,
          onPressed: () {
            setState(() {});
            context.read<InstansiBloc>().add(LoadInstansi());
            context.read<DokumenBloc>().add(LoadDokumen());
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MainPage(cIndex: 0, fIndex: 0)));
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
            onPressed: () async {
              Dokumen docs = widget.dokumen.copyWith(
                  tglSpk: (dateInput.text == null)
                      ? widget.dokumen.tglSpk
                      : dateInput.text,
                  noSpk:
                      (noSpk.text == null) ? widget.dokumen.noSpk : noSpk.text,
                  noBast: (noBast.text == null)
                      ? widget.dokumen.noBast
                      : noBast.text,
                  tglBast: (dateInput2.text == null)
                      ? widget.dokumen.tglBast
                      : dateInput2.text);
              debugPrint(
                  "${docs.noBast}|${docs.tglSpk}|${docs.noSpk}|${docs.keteranganBelanja}");
              int res = await DokumenService().updateDokumen(docs);
              if (res != 200) {
                // ignore: use_build_context_synchronously
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.rightSlide,
                  title: 'Warning !',
                  desc: "Gagal upload Data, Silahkan ulangi sekali lagi...",
                  btnOkOnPress: () {
                    context.read<InstansiBloc>().add(LoadInstansi());
                    context.read<DokumenBloc>().add(LoadDokumen());
                    Navigator.pop(context);
                  },
                ).show();
              } else {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success,
                  animType: AnimType.rightSlide,
                  title: 'Selamat..',
                  desc: "Data berhasil di update.. Terimakasih.",
                  btnOkOnPress: () async {
                    setState(() {});
                    context.read<InstansiBloc>().add(LoadInstansi());
                    context.read<DokumenBloc>().add(LoadDokumen());
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MainPage(cIndex: 0, fIndex: 0)));
                  },
                ).show();
              }
            },
          ),
        ],
        foregroundColor: blck,
      ),
      body: content(),
    );
  }
}
