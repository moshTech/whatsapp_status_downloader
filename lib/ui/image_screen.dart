import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'view_image_screen.dart';

final Directory _photoDir =
    Directory('/storage/emulated/0/WhatsApp/Media/.Statuses');

class ImageScreen extends StatefulWidget {
  @override
  ImageScreenState createState() => new ImageScreenState();
}

class ImageScreenState extends State<ImageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!Directory("${_photoDir.path}").existsSync()) {
      return Container(
        // padding: EdgeInsets.only(bottom: 60.0),
        child: Center(
          child: Text(
            "Install WhatsApp\nYour friend's status will be found here",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    } else {
      var imageList = _photoDir
          .listSync()
          .map((item) => item.path)
          .where((item) => item.endsWith(".jpg"))
          .toList(growable: false);
      if (imageList.length > 0) {
        return Container(
          padding: EdgeInsets.only(bottom: 10.0),
          child: StaggeredGridView.countBuilder(
            padding: EdgeInsets.all(2.0),
            itemCount: imageList.length,
            crossAxisCount: 4,
            itemBuilder: (context, index) {
              String imgPath = imageList[index];
              return Card(
                elevation: 2.0,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => ViewPhotos(imgPath)));
                    },
                    child: Image.file(
                      File(imgPath),
                      fit: BoxFit.cover,
                    )),
              );
            },
            staggeredTileBuilder: (i) =>
                StaggeredTile.count(2, i.isEven ? 2 : 3),
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
          ),
        );
      } else {
        return Scaffold(
          body: Center(
            child: Container(
                padding: EdgeInsets.only(bottom: 60.0),
                child: Text(
                  'Sorry, No Image Yet!',
                  style: TextStyle(fontSize: 18.0),
                )),
          ),
        );
      }
    }
  }
}
