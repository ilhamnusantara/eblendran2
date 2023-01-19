import 'dart:io';

import 'package:eblendrang2/models/models.dart';
import 'package:eblendrang2/pages/home/main_page.dart';
import 'package:eblendrang2/services/dokumen_service.dart';
import 'package:eblendrang2/services/master_data.dart';
import 'package:flutter/material.dart';
import 'package:eblendrang2/themes.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AddData extends StatefulWidget {
  final User user;
  AddData({required this.user});
  @override
  State<StatefulWidget> createState() {
    return _AddData();
  }
}

class _AddData extends State<AddData> {
  @override
  void initState() {
    setDropdown();
    namaInstansi.text = setNameInstansi();
    dateInput.text = "";
    dateInput2.text = "";
    dateInput3.text = "";
    super.initState();
    // super.initState();
  }

  TextEditingController dateInput = TextEditingController();
  TextEditingController dateInput2 = TextEditingController();
  TextEditingController dateInput3 = TextEditingController();
  TextEditingController namaInstansi = TextEditingController();
  TextEditingController keteranganT = TextEditingController();
  TextEditingController noSpk = TextEditingController();
  TextEditingController noBast = TextEditingController();
  TextEditingController satuanT = TextEditingController();
  TextEditingController volumeT = TextEditingController();
  TextEditingController nomorPerUnit = TextEditingController();
  TextEditingController noPpbT = TextEditingController();
  TextEditingController datePpbT = TextEditingController();
  String? masterDataT;
  String? rekananT;

  List<JenisBelanja>? company = [];
  List<Instansi>? instansi1 = [];
  List<Rekanan1>? rekanan1 = [];

  String setNameInstansi() {
    debugPrint(widget.user.user.idInstansi.toString());
    String nama = "";
    for (int i = 1; i <= instansi1!.length; i++) {
      debugPrint("statement");
      if (widget.user.user.idInstansi == instansi1![i].idInstansi) {
        debugPrint(instansi1![i].namaInstansi);
        nama = instansi1![i].namaInstansi;
      }
    }
    return nama;
  }

  void setDropdown() async {
    List<JenisBelanja>? data =
        (await MasterData1().getMasterData("jenis_belanja"))
            .cast<JenisBelanja>();
    List<Instansi>? data1 =
        (await MasterData1().getMasterData("instansi")).cast<Instansi>();
    List<Rekanan1>? data2 =
        (await MasterData1().getMasterData("rekanan")).cast<Rekanan1>();
    setState(() {
      company = data;
      instansi1 = data1;
      rekanan1 = data2;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> showSuccessDialog(String header, String body) async {
      return showDialog(
        context: context,
        builder: (BuildContext contex) => Container(
          width: MediaQuery.of(context).size.width - (2 * marginLogin),
          child: AlertDialog(
            backgroundColor: backgroundColor16,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                      ),
                    ),
                  ),
                  Image.asset(
                    (header.toUpperCase().contains("SELAMAT"))
                        ? 'assets/icon_success.png'
                        : 'assets/icon_information2.png',
                    width: 100,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    header,
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    body,
                    style: subtitleTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 154,
                    height: 44,
                    child: TextButton(
                      onPressed: () {
                        //post data into server..
                        (header.toUpperCase().contains("SELAMAT"))
                            ? Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MainPage(cIndex: 0, fIndex: 0),
                                ),
                                (route) => false)
                            : Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: backgroundColor12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Ok',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget header() {
      return AppBar(
        title: Text(
          'Tambah Dokumen',
          style: secondTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: primaryColor,
            ),
            onPressed: () {
              showSuccessDialog("", "");
            },
          ),
        ],
        foregroundColor: blck,
      );
    }

//controller masterDataT
    Widget masterData() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        // child: DropdownSearch<String>(
        //   mode: Mode.MENU,
        //   showSelectedItems: true,
        //   items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada', 'Canada', 'Canada', 'Canada', 'Canada', 'Canada', 'Canada'],
        //   dropdownSearchDecoration: InputDecoration(
        //     labelText: "Menu mode",
        //     hintText: "country in menu mode",
        //   ),
        //   popupItemDisabled: (String s) => s.startsWith('I'),
        //   onChanged: print,
        //   selectedItem: "Brazil",
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Master Data',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 40,
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_masterData.png',
                      width: 25,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Row(
                          children: [
                            const Icon(
                              Icons.list,
                              size: 16,
                              color: Colors.blue,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Pilih Master Data',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                          ],
                        ),
                        items: company!
                            .map((item) => DropdownMenuItem<String>(
                                  value: item.idJenis!.toString(),
                                  child: Text(
                                    item.jenisBelanja!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: masterDataT,
                        onChanged: (value) {
                          setState(() {
                            masterDataT = value as String;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.blue,
                        iconDisabledColor: Colors.grey,
                        buttonHeight: 50,
                        buttonWidth: 285,
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 14),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.black26,
                          ),
                          color: Colors.white,
                        ),
                        buttonElevation: 2,
                        itemHeight: 40,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 200,
                        dropdownWidth: 300,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        dropdownElevation: 8,
                        scrollbarRadius: const Radius.circular(40),
                        scrollbarThickness: 6,
                        scrollbarAlwaysShow: true,
                        offset: const Offset(-20, 0),
                      ),
                    ),
                    // Container(
                    //   child : DropdownSearch<String>(
                    //     mode: Mode.MENU,
                    //     showSelectedItems: true,
                    //     items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                    //     dropdownSearchDecoration: InputDecoration(
                    //       labelText: "Menu mode",
                    //       hintText: "country in menu mode",
                    //     ),
                    //     popupItemDisabled: (String s) => s.startsWith('I'),
                    //     onChanged: print,
                    //     selectedItem: "Brazil",
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

//controller namaInstansi
    Widget nameInstansi() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Instansi',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
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
                      controller: namaInstansi,
                      decoration: InputDecoration(
                        hintText: namaInstansi.text,
                        hintStyle: primaryTextStyle,
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

//controller keteranganT
    Widget keterangan() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Keterangan Belanja',
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
                      'assets/icon_ket.png',
                      width: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                      style: primaryTextStyle,
                      controller: keteranganT,
                      decoration: InputDecoration(
                        hintText: 'Belanja Modal Vacum Cleaner',
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

//controller noSpk
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
                      controller: noSpk,
                      style: primaryTextStyle,
                      decoration: InputDecoration(
                        hintText: '027/4.3.2.1/PPKom.438.7.7.7/2022',
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

//controller dateInput
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
                        DateTime? dateSPK = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
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

//keterangan noBast
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
                      controller: noBast,
                      style: primaryTextStyle,
                      decoration: InputDecoration(
                        hintText: '027/4.3.2.4/PPKom.438.7.7.7/2022',
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

//controller dateInput2
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

//controller satuanT
    Widget satuan() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Satuan Barang',
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
                      'assets/icon_ket.png',
                      width: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                      style: primaryTextStyle,
                      controller: satuanT,
                      decoration: InputDecoration(
                        hintText: 'Paket/Unit/Buah/Tahun',
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

//controller volumeT
    Widget volume() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jumlah Volume Barang',
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
                      'assets/icon_ket.png',
                      width: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextField(
                      style: primaryTextStyle,
                      controller: volumeT,
                      decoration: InputDecoration(
                        hintText: '1 - 100',
                        hintStyle: inputStyle,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: grayChoose,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

//controller nomorPerUnit
    Widget nomPerUnit() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nominal Belanja Per Unit',
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
                      'assets/icon_money.png',
                      width: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                      style: primaryTextStyle,
                      controller: nomorPerUnit,
                      decoration: InputDecoration(
                        hintText: 'Rp.1.000.000,-',
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

    Widget rekanan() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Rekanan',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 40,
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_ket.png',
                      width: 25,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    DropdownButton2(
                      hint: Text(
                        'Pilih Data Rekanan',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: rekanan1!
                          .map((item) => DropdownMenuItem<String>(
                                value: item.idRekanan!.toString(),
                                child: Text(
                                  item.namaRekanan!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: rekananT,
                      onChanged: (value) {
                        setState(() {
                          rekananT = value as String;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.blue,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 285,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 300,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(-20, 0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

//controller noPpbT
    Widget noPpb() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nomor PPB / SPM',
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
                      'assets/icon_ket.png',
                      width: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                      style: primaryTextStyle,
                      controller: noPpbT,
                      decoration: InputDecoration(
                        hintText: '601011107-PPB',
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

//controller dateInput3
    Widget dateppb() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tanggal PPB / SPM',
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
                      controller: dateInput3,
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
                            dateInput3.text = formattedDate;
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

    // Widget button() {
    //   return Container(
    //     margin: EdgeInsets.only(
    //       top: 10,
    //       bottom: 30,
    //     ),
    //     child: Row(
    //       children: [
    //         Expanded(
    //             child: TextButton(
    //           onPressed: () {
    //             Navigator.pushNamed(context, '/pdf');
    //           },
    //           child: Text(
    //             "File SPK",
    //             style: secondTextStyle.copyWith(
    //               fontSize: 16,
    //               fontWeight: medium,
    //             ),
    //           ),
    //           style: TextButton.styleFrom(
    //             backgroundColor: backgroundColor12,
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(12),
    //             ),
    //           ),
    //           // color: Colors.black,
    //           // textColor: Colors.white,
    //         )),
    //         SizedBox(
    //           width: 8,
    //         ),
    //         Expanded(
    //             child: TextButton(
    //           onPressed: _chooseImageFromCamera,
    //           child: Text(
    //             "Foto",
    //             style: secondTextStyle.copyWith(
    //               fontSize: 16,
    //               fontWeight: medium,
    //             ),
    //           ),
    //           style: TextButton.styleFrom(
    //             backgroundColor: backgroundColor12,
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(12),
    //             ),
    //           ),
    //           // color: Colors.black,
    //           // textColor: Colors.white,
    //         )),
    //         SizedBox(
    //           width: 8,
    //         ),
    //         Expanded(
    //             child: TextButton(
    //           onPressed: () {},
    //           child: Text(
    //             "File BAST",
    //             style: secondTextStyle.copyWith(
    //               fontSize: 16,
    //               fontWeight: medium,
    //             ),
    //           ),
    //           style: TextButton.styleFrom(
    //             backgroundColor: backgroundColor12,
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(12),
    //             ),
    //           ),
    //           // color: Colors.black,
    //           // textColor: Colors.white,
    //         )),
    //       ],
    //     ),
    //   );
    // }

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
                  masterData(),
                  nameInstansi(),
                  keterangan(),
                  noSPK(),
                  dateSPK(),
                  noBAST(),
                  dateBAST(),
                  satuan(),
                  volume(),
                  nomPerUnit(),
                  rekanan(),
                  noPpb(),
                  dateppb(),
                  // button(),
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
        title: Text(
          'Tambah Dokumen',
          style: secondTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: primaryColor,
            ),
            onPressed: () async {
              DokumenUpload docs = DokumenUpload(
                  id_instansi: 2,
                  id_jenis: 2,
                  keterangan_belanja: keteranganT.text,
                  no_spk: noSpk.text,
                  tgl_spk: dateInput.text,
                  no_bast: noBast.text,
                  tgl_bast: dateInput2.text,
                  tahun: "2023",
                  satuan: satuanT.text,
                  volume: int.parse(volumeT.text),
                  nominal_belanja: int.parse(nomorPerUnit.text),
                  id_rekanan: 1,
                  no_pbb_ls: noPpbT.text,
                  tgl_belanja: dateInput3.text);
              String res = await DokumenService().addDokumen(docs);
              if (res.toUpperCase().contains("DOKUMEN BERHASIL DI UNGGAH")) {
                showSuccessDialog("SELAMAT", res);
              } else {
                showSuccessDialog("SORRY,..", res);
              }
            },
          ),
        ],
        foregroundColor: blck,
      ),
      body: content(),
    );
    DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
          value: item,
          child: Text(
            item,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        );
  }
}
