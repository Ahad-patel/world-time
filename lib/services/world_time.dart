import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location of the UI
  String time; // Time in that location
  String flag; //url to asset flag location
  String url; // location url to api endpoint
  bool isDaytime; //is true or false if daytime

  WorldTime({this.location, this.flag, this.url});

  Future<void> GetTime() async {
    // Response response =  await get(Uri.https('jsonplaceholder.typicode.com', 'todos/2'));
    // Map data = jsonDecode(response.body);
    // print(data);
    // print(data['title']);

    try {
      // Response response = await get('https://worldtimeapi.org/api/timezone/$url');
      Response response =
          await get(Uri.http('worldtimeapi.org', 'api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      //Get properties from data
      String datetime = data['datetime'];
      String offsetH = data['utc_offset'].substring(1, 3);
      String offsetM = data['utc_offset'].substring(4, 6);
      // print(datetime);
      // print(offsetH);
      print(offsetM);

      // Create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offsetH)));
      // now = now.add(Duration(hours: int.parse(offsetH),minutes: int.parse(offsetM)));

      //set time property
      // time = now.toString();
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error $e');
      time = 'Server Busy! try again';
      isDaytime = true;
    }
  }
}
