// ignore_for_file: file_names

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:wallpaper_manager/wallpaper_manager.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';


class FullScreen extends StatefulWidget {

  final String imageurl;

  const FullScreen({Key? key, required this.imageurl}) : super(key: key);

  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  Future<void> setwallpaper() async {
  int location = WallpaperManager.HOME_SCREEN;
  var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
  String result = await WallpaperManager.setWallpaperFromFile(file.path, location);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child:Container(
                child: Image.network(widget.imageurl),
              )
            ),
            InkWell(
              onTap: () {
                setwallpaper();
              },
              child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.green,
                  child: Center(child: Text("Set Wallpaper", style: TextStyle(fontSize: 20, color: Colors.white),))),
            )
          ],
        )
      )
    );
  }
}
