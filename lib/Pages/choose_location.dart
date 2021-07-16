 import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}


class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Kolkata',flag: 'india.png',url: 'Asia/Kolkata'),
    WorldTime(location: 'Helsinki',flag: 'finland.png',url: 'Europe/Helsinki'),
    WorldTime(location: 'Paris',flag: 'france.png',url: 'Europe/Paris'),
    WorldTime(location: 'Kuala_Lumpur',flag: 'malaysia.png',url: 'Asia/Kuala_Lumpur'),
    WorldTime(location: 'London',flag: 'united-kingdom.png',url: 'Europe/London'),
    WorldTime(location: 'Chicago',flag: 'united-states.png',url: 'America/Chicago'),
  ];

  void updateTime(index) async{

    WorldTime instance = locations[index];
    await instance.GetTime();

    //navigate back to home screen
    Navigator.pop(context,{
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    } );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Choose Location'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () {
                    // print(locations[index].location);
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('images/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
