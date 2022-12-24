import 'package:eblendrang2/models/dokumen_model.dart';
import 'package:eblendrang2/themes.dart';
import 'package:flutter/material.dart';

class DataTitle extends StatefulWidget {
  final DokumenModel dokumen;
  DataTitle({required this.dokumen});
  // DataTitle({
  //   this.keterangan_belanja,
  //   this.no_spk,
  //   this.no_bast,
  //   this.alamat
  // });

  @override
  State<DataTitle> createState() => _DataTitleState();
}

class _DataTitleState extends State<DataTitle> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      'With One Class',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "${widget.dokumen.keterangan_belanja}",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Email : ${widget.dokumen.no_spk}",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "Phone : ${widget.dokumen.no_bast}",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "City : ${widget.dokumen.alamat}",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        // Container(
        //   child: Column(
        //     children: <Widget>[
        //       new NameDetail(
        //         name: widget.dName,
        //         email: widget.dEmail,
        //       ),
        //       new BagianIcon(),
        //       new BagianContact(
        //         phone: widget.dPhone,
        //         city: widget.dCity,
        //         postal: widget.dZip,
        //       )
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
