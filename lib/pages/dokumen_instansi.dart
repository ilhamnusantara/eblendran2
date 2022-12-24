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
    return Container(
        margin: EdgeInsets.only(
          top: 10,
          left: marginLogin,
          right: marginLogin,
        ),
        child: (widget.docList != null)
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: widget.docList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/detailDokumen',
                          arguments: jsonEncode(widget.docList![index]));
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
                                  '${widget.docList![index].keteranganBelanja}',
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: semiBold,
                                  ),
                                ),
                                Text(
                                  '${widget.docList![index].idInstansi}',
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
                })
            : Center(
                child: const Text("NO DATA !!"),
              ));
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      onBackButtonPressed: () {
        Navigator.pop(context);
      },
      title: widget.namaInstansi,
      subtitle: "List Dokumen",
      child: item(),
    );
  }
}
