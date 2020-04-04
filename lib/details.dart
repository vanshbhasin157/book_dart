import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'Home.dart';

class Description extends StatefulWidget {
  int index;
  Description({this.index});
  @override
  _DescriptionState createState() => _DescriptionState(value:value);
}

class _DescriptionState extends State<Description> {
List userData;
Map details;
int value;



  Future getData() async {
    var url =  'http://192.168.43.148:8000/details_api/';
    Map data ={
      "id" : value.toString()
    };
    var body = json.encode(data);
    var resp = await http.post(url, body: body);
    var res = json.decode(resp.body);
    print(res);
        setState(() {
      userData = details["key"];
    });
  }
 Widget bookdescription(){
   return Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Material(
                elevation: 65.0,
                shadowColor: Colors.black,
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(1, 0),
                            blurRadius: 3,
                            spreadRadius: 5),
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(6, 10),
                            blurRadius: 3,
                            spreadRadius: 2)
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          "hey heyheyhey hey     hey heyheyhey heyheyhey heyheyhey heyhey heyheyhey heyhey heyheyhey heyhey heyheyhey heyhey heyheyhey heyhey heyheyhey heyhey heyheyhey heyhey heyheyhey heyhey heyheyhey hey heyheyhey heyhey heyheyhey heyhey heyheyhey hey"),
                    ),
                  ),
                ),
              ),
   );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[300],
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Image.network(
              userData[value]["image"],
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.2,
            ),
            SizedBox(
              height: 5,
            ),
            Text("${userData[value]["name"]}",
                style: GoogleFonts.rye(
                    fontSize: 25, color: Colors.white, letterSpacing: 2)),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("${userData[1]["author"]}",
                  style: GoogleFonts.rye(
                    fontSize: 15,
                    color: Colors.white,
                  )),
            ),
            SizedBox(
              height: 25,
            ),
            bookdescription()
           
          ]),
        ));
  }
}