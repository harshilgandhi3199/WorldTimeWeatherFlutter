import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};
  Map data2={};

  @override
  Widget build(BuildContext context) {

    //receive the data from loading page
    data=data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    data2=data2.isNotEmpty ? data2 : ModalRoute.of(context).settings.arguments;
    print(data2);

    // check if daytime or not
    String bgImage=data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor=data['isDaytime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result1=await Navigator.pushNamed(context, '/location');
                    dynamic result2=await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data={
                        'location': result1['location'],
                        'flag': result1['flag'],
                        'time': result1['time'],
                        'isDaytime': result1['isDaytime'],
                      };
                      data2={
                        'temperature': result2['temperature'],
                        'humidity': result2['humidity'],
                        'location': result2['location'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        letterSpacing: 1.4,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 67.0,
                  ),
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.thermostat_outlined),
                    Text(
                      data2['temperature'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.beach_access),
                    Text(
                      data2['humidity'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
