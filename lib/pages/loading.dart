import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';
  void seupWorldTime() async{
    // default location values
    WorldTime instance = WorldTime(
        location: 'Singapore', flag: 'singapore.png', url: 'Asia/Singapore');
    await instance.getTime();
    // send the control to home page
    // it pile up the loading screen and home screen.
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime': instance.isDayTime,
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seupWorldTime();
    //print('hello loading');


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Center(
        child: SpinKitDualRing(
          color: Colors.white,
          size: 50.0,

        ),


      )
    );
  }
}
