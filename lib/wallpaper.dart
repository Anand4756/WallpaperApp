import 'package:flutter/material.dart';

class wallpaper extends StatefulWidget {

  fetchapi() async {

  }

  @override
  _wallpaperState createState() => _wallpaperState();
}

class _wallpaperState extends State<wallpaper> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container(
            child: GridView.builder(
              itemCount: 80,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 2, crossAxisCount: 3, childAspectRatio: 2/3,mainAxisSpacing: 2),
              itemBuilder: (context,index){
              return Container(color: Colors.white);
              },)
          ),),
          Container(
              height: 50,
              width: double.infinity,
              color: Colors.pink,
              child: Center(child: Text("Load More", style: TextStyle(fontSize: 20, color: Colors.white),)))
        ]
      )
    );
  }
}
