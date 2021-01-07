import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTimeWeather{

  String location; //location name for the UI
  String time; // time in that location
  String flag; // url to asset file icon
  String url; //location url for api endpoints
  bool isDaytime; //true or false if daytime or not
  String temperature;
  int tempK;
  String humidity;

  //passing values to the class by creating a constructor
  WorldTimeWeather({this.location, this.flag, this.url});

  Future<void> getTimeWeather() async{

    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Response response2=await get('https://api.openweathermap.org/data/2.5/weather?q=$location&appid=2ad6d46a72fb055f6ad5f8309c910a22');
      Map data = jsonDecode(response.body);
      Map data2=jsonDecode(response2.body);
      //print(data);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      //print(datetime);
      //print(offset);

      tempK=data2['main']['temp'];
      temperature=(tempK-273.15).toString();
      humidity=data2['main']['humidity'].toString();

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(
          offset))); //subtracting offset from time using Duration method

      isDaytime=now.hour > 6 && now.hour < 18 ? true : false;

      //set the time property
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      time = 'could not find the data';
      print('$e');
    }
  }
}
