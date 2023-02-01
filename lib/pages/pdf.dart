import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:eblendrang2/themes.dart';
import 'package:file_picker/file_picker.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:eblendrang2/pages/detail_dokumen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
// import 'package:ext_storage/ext_storage.dart';
import 'package:path_provider/path_provider.dart';

import '../blocs/blocs_exports.dart';
import '../models/models.dart';
import '../services/dokumen_service.dart';

class Pdf extends StatefulWidget {
  final Dokumen dokumen;
  String? namaInstansi;
  String source, tipeData, path, field, title;
  Pdf(
      {required this.dokumen,
      required this.source,
      this.namaInstansi,
      required this.tipeData,
      required this.path,
      required this.field,
      required this.title});
  @override
  State<StatefulWidget> createState() {
    return _Pdf();
  }
}

class _Pdf extends State<Pdf> {
  final picker = ImagePicker();
  final pdf = pw.Document();
  List<File> _image = [];
  File? pdfSend;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          (_image.isNotEmpty)
              ? IconButton(
                  icon: const Icon(Icons.upload_file),
                  onPressed: () {
                    createPDF();
                    savePDF(widget.source);
                  })
              : const SizedBox()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          getImageFromGallery(widget.source);
        },
      ),
      body: _image.isNotEmpty
          ? ((widget.source.toUpperCase().contains("CAMERA"))
              ? ListView.builder(
                  itemCount: _image.length,
                  itemBuilder: (context, index) => Container(
                    height: 400,
                    width: double.infinity,
                    margin: const EdgeInsets.all(8),
                    child: Image.file(
                      _image[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Container(
                  height: 400,
                  width: double.infinity,
                  margin: const EdgeInsets.all(8),
                  child: Text("File PDF = ${pdfSend!.path}"),
                ))
          : const SizedBox(
              child: Center(
                child: Text("No File Selected ..."),
              ),
            ),
    );
  }

  Future<dynamic> getImageFromGallery(String source) async {
    File pickedFile;
    if (source.toUpperCase().contains("CAMERA")) {
      final a =
          await picker.getImage(source: ImageSource.camera, imageQuality: 50);
      pickedFile = File(a!.path);
    } else {
      var a = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
      pickedFile = File(a!.files.single.path!);
    }
    setState(() {
      if (pickedFile != null) {
        (widget.source.toUpperCase().contains("CAMERA"))
            ? _image.add(pickedFile)
            : pdfSend = pickedFile;
      } else {
        print('No image selected');
      }
    });
  }

  createPDF() async {
    for (var img in _image) {
      final image = pw.MemoryImage(img.readAsBytesSync());

      pdf.addPage(pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context contex) {
            return pw.Center(child: pw.Image(image));
          }));
    }
  }

  Future<String> filePath() async {
    Directory? docsDir = await getExternalStorageDirectory();
    String docsPath = docsDir!.path;
    return docsPath;
  }

  Future<dynamic> savePDF(String src) async {
    try {
      // final dir = await ExtStorage.getExternalStoragePublicDirectory(
      //     ExtStorage.DIRECTORY_DOWNLOADS);
      // final String dir = (await getApplicationDocumentsDirectory()).path;
      var dir = await filePath();
      print("Direktori => ${dir}");
      // final file = File('${dir}/filename${DateTime.now()}.pdf');
      // final file = File('${dir.path}/filename${DateTime.now()}.pdf');
      final file = File('${dir}/filename${DateTime.now()}.pdf');
      var file1;
      (src.toUpperCase().contains("CAMERA"))
          ? file1 = await file.writeAsBytes(await pdf.save()) //error disini
          : file1 = await file.writeAsBytes(pdfSend!);
      File fileUpload = File(file1.path);
      String res = await DokumenService().asyncFileUpload(
          widget.dokumen.idDokumen.toString(),
          fileUpload,
          widget.path,
          widget.field);
      (res.toUpperCase().contains("DATA BERHASIL DI UPLOAD"))
          ? AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              title: 'Selamat..',
              desc: "Data berhasil di update.. Terimakasih.",
              btnOkOnPress: () async {
                setState(() {});
                context.read<InstansiBloc>().add(LoadInstansi());
                context.read<DokumenBloc>().add(LoadDokumen());
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(dokumen: widget.dokumen)),
                    (route) => false);
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
                context.read<InstansiBloc>().add(LoadInstansi());
                context.read<DokumenBloc>().add(LoadDokumen());
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(dokumen: widget.dokumen)),
                    (route) => false);
              },
            ).show();
    } catch (e) {
      showPrintedMessage('error', e.toString());
    }
  }

  showPrintedMessage(String title, String msg) {
    Flushbar(
      title: title,
      message: msg,
      duration: Duration(seconds: 3),
      icon: Icon(
        Icons.info,
        color: Colors.blue,
      ),
    )..show(context);
  }
}
