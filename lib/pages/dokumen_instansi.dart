part of 'page.dart';

// import 'package:flutter/material.dart';

class DokumenInstansi extends StatefulWidget {
  final List<Dokumen>? docList;
  final String namaInstansi;
  DokumenInstansi({this.docList, required this.namaInstansi});
  @override
  State<DokumenInstansi> createState() => _DokumenInstansiState();
}

class _DokumenInstansiState extends State<DokumenInstansi> {
  Widget item() {
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
          child: (widget.docList != null)
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.docList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                      dokumen: widget.docList![index],
                                      namaInstansi: widget.namaInstansi,
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
                                    widget.docList![index].keteranganBelanja,
                                    style: primaryTextStyle.copyWith(
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                  Text(
                                    widget.namaInstansi,
                                    style: subtitleTextStyle.copyWith(
                                      fontWeight: light,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '',
                              // widget.docList![index].dataKos,
                              style: subtitleTextStyle.copyWith(
                                fontWeight: light,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    );
                  })
              : const Center(
                  child: Text("NO DATA !!"),
                ),
        )),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GeneralPage(
      onBackButtonPressed: () {
        Navigator.pop(context);
      },
      title: widget.namaInstansi,
      subtitle: "List dokumen yang masih kosong",
      child: Container(
        width: size.width,
        height: size.height - 140,
        alignment: Alignment.center,
        child: item(),
      ),
    );
  }
}
