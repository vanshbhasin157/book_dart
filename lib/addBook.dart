import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Book extends StatefulWidget {
  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  File imageFile;
  TextEditingController nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Books'),
        centerTitle: true,
        backgroundColor: Colors.orange[900],
      ),
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
      begin: Alignment.topCenter,
      colors: [
        Colors.orange[900],
        Colors.orange[800],
        Colors.orange[400]
      ]
            )
          ),
          child: Column(
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'book name'
                ),
              ),
              //  file == null ? Text('No image selected.') : Image.file(file),
               FloatingActionButton(
        onPressed: () async {
              var image = await ImagePicker.pickImage(source: ImageSource.gallery);
              setState(() {
                imageFile = image;
              });
              fetchResults(context);
            },
        heroTag: 'btn1',
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      // FloatingActionButton(
      //   onPressed: (){fetchResults(context);},
      //   heroTag: 'btn2',

      //   ), 
            ],
          ),
      ),
      );
  }


fetchResults(BuildContext context) async{
    var url = 'http://192.168.43.148:8000/book_view_api/';
    var bytes = imageFile.readAsBytesSync();
    Map data = {
      'name' : nameController.text,
      'image': base64.encode(bytes)
    };
     await http.post(url,headers: {"Content-Type": "application/x-www-form-urlencoded"},body: json.encode(data)
    );
    
    
  }

}