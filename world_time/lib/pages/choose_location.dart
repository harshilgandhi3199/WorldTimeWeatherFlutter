import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTimeWeather> locations=[
    WorldTimeWeather(url: 'Europe/London', location: 'London', flag: 'uk.png', ),
    WorldTimeWeather(url: 'Europe/Greece', location: 'Athens', flag: 'greece.png', ),
    WorldTimeWeather(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png', ),
    WorldTimeWeather(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png', ),
    WorldTimeWeather(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png', ),
    WorldTimeWeather(url: 'America/NewYork', location: 'New York', flag: 'usa.png', ),
    WorldTimeWeather(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png', ),
    WorldTimeWeather(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png', ),
  ];

  void updateTimeWeather(index) async {
    WorldTimeWeather instance = locations[index];
    await instance.getTimeWeather();

    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          //return a card template for each element in the list
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTimeWeather(index);
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
                title: Text(locations[index].location),
              ),
            ),
          );
        },
      ),
    );
  }
}
