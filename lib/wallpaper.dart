import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'FullScreen.dart';
class wallpaper extends StatefulWidget {


  @override
  _wallpaperState createState() => _wallpaperState();
}

class _wallpaperState extends State<wallpaper> {

  List images = [];
  int page = 1;
  void initState(){
    super.initState();
    fetchapi();
  }
  fetchapi() async {
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
        headers:{'Authorization':'API KEY'}).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
      });
    print(images);
    });
  }

  loadmore() async {
    setState(() {
      page += 1;
    });
    String url = 'https://api.pexels.com/v1/curated?per_page=80&page=' +
        page.toString();
    await http.get(Uri.parse(url),
        headers: {
          'Authorization': 'API KEY'
        }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images.addAll(result['photos']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container(
            child: GridView.builder(
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 2, crossAxisCount: 3, childAspectRatio: 2/3,mainAxisSpacing: 2),
              itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FullScreen(imageurl: images[index]['src']['large2x'],)));
                },
                child: Container(color: Colors.white,
                child: Image.network(images[index]['src']['tiny'], fit: BoxFit.cover,)
                ),
              );

              },)
          ),),

          InkWell(
            onTap: () {
              loadmore();
            },
            child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.pink,
                child: Center(child: Text("Load More", style: TextStyle(fontSize: 20, color: Colors.white),))),
          )
        ]
      )
    );
  }
}
