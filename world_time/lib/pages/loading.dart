import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time='loading';

  void setup() async {
    //creating class instance
    WorldTimeWeather instance=WorldTimeWeather(location: 'Berlin', flag: 'germany.png', url: 'Europe/London');
    await instance.getTimeWeather();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRing(
          color: Colors.blueGrey,
          size: 50.0,
        ),
      )
    );
  }
}
