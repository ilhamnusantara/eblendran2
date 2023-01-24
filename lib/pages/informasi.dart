part of 'page.dart';

class Informasi extends StatefulWidget {
  State<Informasi> createState() => _InstansiState();
}

class _InstansiState extends State<Informasi> {
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
                height: 135,
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
                            'aplikasi ini dibuat untuk tujuan mengetahui dokumen mana yang belum melakukan upload berkas SPK, BAST, dan Foto. Selain itu pada aplikasi ini berfungsi untuk melakukan update data pada dokumen yang akan dilakukan perubahan data',
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
                height: 140,
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
                          Text(
                            'Pada modul home digunakan untuk melihat masing masing instansi yang belum lengkap dalam mengupload data dokumennya yang dimana nilai yang diambil dari File SPK, File BAST dan Foto',
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
                height: 160,
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
                          Text(
                            'Pada modul dokumen user dapat melihat dokumen yang sudah dibuat pada website e-blendrang, dan dapat melakukan filter dokumen berdasarkan file SPK, file BAST, dan Foto yang belum melakukan upload data ',
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
                  informasi(),
                  homePage(),
                  dokumenPage(),
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
