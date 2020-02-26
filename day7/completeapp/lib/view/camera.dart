import 'dart:io';

import 'package:completeapp/model/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  List imagefiles = List();
  openCamera(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        imagefiles.add(image);
      });
    }
    Navigator.of(context).pop();
  }

  openGallery(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imagefiles.add(image);
      });
    }
    Navigator.of(context).pop();
  }

  showDialogbox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Open with'),
            content: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    openCamera(context);
                  },
                  child: Container(
                    child: Text('Camera'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    openGallery(context);
                  },
                  child: Container(
                    child: Text('Gallery'),
                  ),
                ),
              ],
            )),
          );
        });
  }

  Future<void> share(String path) async {
    //print('${path}');
    await FlutterShare.shareFile(
        title: 'Example share', text: 'Example share text', filePath: path);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showDialogbox(context);
              },
              icon: Icon(Icons.camera))
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: imagefiles.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: <Widget>[
                  Image.file(imagefiles[index]),
                  FlatButton(
                    child: Icon(Icons.share),
                    onPressed: () {
                      share(imagefiles[index].path);
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
