part of 'page.dart';

class Informasi extends StatefulWidget {
  State<Informasi> createState() => _InstansiState();
}

class _InstansiState extends State<Informasi> {
  final List<String> items = [
    '2023',
    '2022',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return GeneralPage(
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
        title: 'Halaman Informasi',
        subtitle: "Tetap Semangaat Wisuda :')",
        // child: item(),
      );
    }

    Widget informasi() {
      return Container(
        margin: const EdgeInsets.only(
          top: 10,
          left: 8,
          right: 8,
        ),
        child: Card(
          elevation: 12,
          color: backgroundColor13,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                'Tujuan',
                style: blackFontStyle6.copyWith(
                  fontWeight: high,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 120,
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 15,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Text(
                          //   'Modul Home',
                          //   style: primaryTextStyle.copyWith(
                          //     fontWeight: semiBold,
                          //   ),
                          // ),
                          Text(
                            'Aplikasi ini bertujuan untuk mengetahui dokumen mana yang belum melakukan upload data SPK, BAST, dan Foto. Dan dapat berfungsi juga untuk mengupdate sebuah data',
                            style: subtitleTextStyle.copyWith(
                              fontWeight: light,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget homePage() {
      return Container(
        margin: const EdgeInsets.only(
          top: 20,
          left: 8,
          right: 8,
        ),
        child: Card(
          elevation: 12,
          color: backgroundColor13,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                'Modul Home',
                style: primaryTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 15,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/home.png',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Text(
                          //   'Modul Home',
                          //   style: primaryTextStyle.copyWith(
                          //     fontWeight: semiBold,
                          //   ),
                          // ),
                          Text(
                            'Pada Modul Home digunakan untuk melihat Instansi mana yang kurang mengupload berkas pada data dokumen',
                            style: subtitleTextStyle.copyWith(
                              fontWeight: light,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget dokumenPage() {
      return Container(
        margin: const EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 5),
        child: Card(
          elevation: 12,
          color: backgroundColor13,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                'Modul Dokumen',
                style: primaryTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 15,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/love_blue.png',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Text(
                          //   'Modul Home',
                          //   style: primaryTextStyle.copyWith(
                          //     fontWeight: semiBold,
                          //   ),
                          // ),
                          Text(
                            'Pada modul dokumen ini user dapat melihat dokumen yang sudah dibuat pada website e-blendrang, dan dapat melakukan filter dokumen mana yang belum melakukan upload file data ',
                            style: subtitleTextStyle.copyWith(
                              fontWeight: light,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget bottomapp() {
      return BottomAppBar(
        child: Row(children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: 5,
              ),
              child: Card(
                color: alert,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Tetap Semangat Wisuda Bestie :')",
                    style: secondTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ]),
              ),
            ),
          ),
          // Text('cemungutt'),
        ]),
      );
    }

    Widget bawahtext() {
      return new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[Text('halo')],
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
                            width: 4,
                          ),
                          Text(
                            'Pilih Tahun',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
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
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
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
                        color: Colors.redAccent,
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 200,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.redAccent,
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(-20, 0),
                    ),
                  ),
                  informasi(),
                  homePage(),
                  dokumenPage(),
                  TextButton(
                    onPressed: () async {
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
                    // (){Navigator.pushNamed(context, '/home');},
                    style: TextButton.styleFrom(
                      backgroundColor: backgroundColor12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Get Dokumen',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ),
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
        centerTitle: true,
        title: Text(
          'Modul Informasi Aplikasi',
          style: secondTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: content(),
      bottomNavigationBar: bottomapp(),
    );
  }
}
