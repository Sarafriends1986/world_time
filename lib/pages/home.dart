import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //declare a MAP to get control from loading page
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // initially "ModalRoute.of(context).settings.arguments" is used to
    // catch data from loading page as navigation (pile up window)

    // secondly read the data from loading page as pop back window(no pile up)

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    //print (data);
    // set the background
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    //String fntColor = data['isDayTime'] ? 'black' : 'white';
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
          child: SafeArea(
              child: Column(
                children:<Widget> [
                  // click gps location icon and navigate to location page
                  FlatButton.icon(
                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'flag': result['flag'],
                          'isDayTime': result['isDayTime'],

                        };
                      });
                    },
                    icon: Icon(Icons.edit_location,
                      color: Colors.red,
                    ),
                    label: Text('Edit Location',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),

                  ),
                  SizedBox(height: 20.0,),
                  // Create Row for Location return data Ex. Berlin
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),

                  ),
                ],
              )),
        ),
      )
    );
  }
}
