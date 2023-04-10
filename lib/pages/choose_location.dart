
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class ChooseLocation extends StatefulWidget {


  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  // int counter=0;
  List<WorldTime> locations = [

  WorldTime(location: 'London',time: '12:00 PM',flag: 'uk.png',url: 'Europe/London',isDaytime: true),
  WorldTime(location: 'Athens', time: '12:00 PM', flag: 'greece.png', url: 'Europe/Berlin', isDaytime: true),
  WorldTime(location: 'Cairo', time: '12:00 PM', flag: 'egypt.png', url: 'Africa/Cairo', isDaytime: true),
  WorldTime(location: 'Nairobi', time: '12:00 PM', flag: 'kenya.png', url: 'Africa/Nairobi', isDaytime: true),
  WorldTime(location: 'Chicago', time: '12:00 PM', flag: 'usa.png', url: 'America/Chicago', isDaytime: true),
  WorldTime(location: 'New York', time: '12:00 PM', flag: 'usa.png', url: 'America/New_York', isDaytime: true),
  WorldTime(location: 'Seoul', time: '12:00 PM', flag: 'korea.png', url: 'Asia/Seoul', isDaytime: true),
  WorldTime(location: 'Jakarta', time: '12:00 PM', flag: 'jakarta.png', url: 'Asia/Jakarta', isDaytime: true),



  ];

   void updateTime(index) async {
     WorldTime instance = locations[index];
     await instance.getTime();
     // navigate to home screen
     Navigator.pop(context, {
       'location': instance.location,
       'flag': instance.flag,
       'time': instance.time,
       'isDaytime': instance.isDaytime,
     });

   }


  @override
  Widget build(BuildContext context) {
    //print('initState function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
    body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: ( context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
            child: ListTile(
            onTap: (){
             updateTime(index);
            },
    title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
            ),
          );
        },
    ),
    );
  }
}
