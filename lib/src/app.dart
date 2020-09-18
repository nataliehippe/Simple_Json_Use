import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:simplejson/src/models/image_model.dart';
import 'dart:convert';

import 'package:simplejson/src/widgets/image_list_widget.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images=[];

  void fetchImage() async {
    counter++;
    var response =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        appBar: AppBar(
          title: Text('Fetching Pics'),
          backgroundColor: Colors.green[200],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_a_photo),
          onPressed: fetchImage,
        ),
      ),
    );
  }
}
