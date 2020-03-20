import 'package:flutter/material.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'addBook.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
   Map data;
  List userData;

  Future getData() async {
    http.Response response = await http.get("http://192.168.43.148:8000/display_api/");
    data = json.decode(response.body);
    setState(() {
      userData = data["key"];
    });
  }
   @override
  void initState() {
    super.initState();
    getData();
  }

  TextEditingController _srchQueryController = new TextEditingController();
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('BookEx'),
        backgroundColor: Colors.orange[900],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Book Exchanger'),
              decoration: BoxDecoration(
                color: Colors.orange[900],
              ),
            ),
            ListTile(
              title: Text('Add Books'),
              onTap: () {
                 Navigator.push(context,MaterialPageRoute(builder: (context) => Book()),
  );
                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Search Books'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
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
              new Padding(padding:EdgeInsets.only(top:50.0)),
              Center(
                child: Container(
                  padding: EdgeInsets.only(left: 20.0),
                  height: 50.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color:Color(0xFFF9F9F9).withOpacity(0.7) ,
                  ),
                  child: Center(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      textInputAction: TextInputAction.search,
                      controller: _srchQueryController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,color: Colors.grey,),
                        hintText: "What book you would like to search",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none
                      ),
                    ),

                  ),
                ),
              ),
              new FloatingActionButton(
                onPressed: (){},
              child: Icon(Icons.search),
              backgroundColor: Colors.white.withOpacity(0.7),
              ),
              Expanded(
                  child: new ListView.builder(
                  itemCount: userData == null? 0: userData.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      padding: EdgeInsets.only(bottom: 15.0),
                  height: 80.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color:Color(0xFFF9F9F9).withOpacity(0.7) ,
                  ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(userData[index]["image"]),
                          ),
                          Text("${userData[index]["name"]}",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey
                          ),)
                          ],
                      ),
                    );
                  }
                  ),
              )
            ],
          ),
      )
    );
  }
}

