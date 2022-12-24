import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
// import 'package:ext_storage/ext_storage.dart';
import 'package:path_provider/path_provider.dart';

class Pdf extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Pdf();
  }
}

class _Pdf extends State<Pdf> {
  final picker = ImagePicker();
  final pdf = pw.Document();
  List<File> _image = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("image to pdf"),
        actions: [
          IconButton(
              icon: Icon(Icons.picture_as_pdf),
              onPressed: () {
                createPDF();
                savePDF();
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: getImageFromGallery,
      ),
      body: _image != null
          ? ListView.builder(
              itemCount: _image.length,
              itemBuilder: (context, index) => Container(
                  height: 400,
                  width: double.infinity,
                  margin: EdgeInsets.all(8),
                  child: Image.file(
                    _image[index],
                    fit: BoxFit.cover,
                  )),
            )
          : Container(),
    );
  }

  getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image.add(File(pickedFile.path));
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

  savePDF() async {
    try {
      // final dir = await ExtStorage.getExternalStoragePublicDirectory(
      //     ExtStorage.DIRECTORY_DOWNLOADS);
      // final String dir = (await getApplicationDocumentsDirectory()).path;
      var dir = await filePath();
      print("Direktori => ${dir}");
      // final file = File('${dir}/filename${DateTime.now()}.pdf');
      // final file = File('${dir.path}/filename${DateTime.now()}.pdf');
      final file = File('${dir}/filename${DateTime.now()}.pdf');
      await file.writeAsBytes(await pdf.save());
      showPrintedMessage('success', 'saved to documents');
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
