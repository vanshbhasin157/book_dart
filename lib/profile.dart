import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username = "Nishverma ";
  String name = "Nishchay Verma";
  String email = "nishchayverma20@gmail.com";

  Widget displayImage() {
    return Positioned(
      left: 100,
      top: MediaQuery.of(context).size.height / 5,
      child: Material(
        elevation: 13,
        shadowColor: Colors.orange,
        borderRadius: BorderRadius.all(Radius.circular(70.0)),
        color: Colors.orange[100],
        child: CircleAvatar(
          child: Text(
            username[0],
            style: TextStyle(color: Colors.grey[800], fontSize: 60),
          ),
          radius: 70.0,
          backgroundColor: Colors.orangeAccent,
        ),
      ),
    );
  }

  Widget backButton() {
    return Positioned(
      top: 20,
      child: IconButton(
          onPressed: () => {},
          icon: Icon(
            Icons.chevron_left,
            size: 40,
          )),
    );
  }

  Widget displayFields() {
    return Positioned(
      top: 410,
      left: 20,
      child: Column(
        children: <Widget>[
        
              
              Material(
                borderRadius: BorderRadius.circular(70.0),
                elevation: 7.0,
                child: Container(
                  width: 320,
                  height: 55,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(3, 5),
                          blurRadius: 8,
                          color: Colors.orange[800],
                        )
                      ],
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(
                          colors: [Colors.orange[300], Colors.orange[900]])),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 18, 10, 10),
                    child: Text(username,
                        style:
                            TextStyle(color: Colors.grey[200], fontSize: 22)),
                  ),
                ),
              ),
              SizedBox(height: 20,),


              Material(
                borderRadius: BorderRadius.circular(70.0),
                elevation: 7.0,
                child: Container(
                  width: 320,
                  height: 55,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(3, 5),
                          blurRadius: 8,
                          color: Colors.orange[800],
                        )
                      ],
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(
                          colors: [Colors.orange[300], Colors.orange[900]])),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 18, 10, 10),
                    child: Text(name,
                        style:
                            TextStyle(color: Colors.grey[200], fontSize: 22)),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Material(
                borderRadius: BorderRadius.circular(70.0),
                elevation: 7.0,
                child: Container(
                  width: 320,
                  height: 55,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(3, 5),
                          blurRadius: 8,
                          color: Colors.orange[800],
                        )
                      ],
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(
                          colors: [Colors.orange[300], Colors.orange[900]])),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 18, 10, 10),
                    child: Text(email,
                        style:
                            TextStyle(color: Colors.grey[200], fontSize: 22)),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              
              
              
            ],
          ),
       
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        ClipPath(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Colors.orange[100], Colors.orange[900]])),
          ),
          clipper:GetClipper(),
        ),
        displayImage(),
        displayFields(),
        backButton(),
      ],
    ));
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height / 2.3);
    path.lineTo(size.width + 370, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClippper) {
    return true;
  }
}