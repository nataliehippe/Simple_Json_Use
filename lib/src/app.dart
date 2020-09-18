import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:simplejson/src/model/image_model.dart';
import 'dart:convert';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images;

  void fetchingData() async {
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
        appBar: AppBar(
          title: Text('Fetching Pics'),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add_a_photo), onPressed: fetchingData),
        body: Text('$counter'),
      ),
    );
  }
}
