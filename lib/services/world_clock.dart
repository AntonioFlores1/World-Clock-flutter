import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldClock {

  String location; //Location Name for UI
  String time; //Location Time
  String flag; //Url of flag icon
  String url; //Region URL endpoint
  bool isDaytime ;

  WorldClock({this.location,this.flag,this.url});

  //Future a temp placeholder for return
  Future<void> getTime() async {
    //Simulate a Network Request,Async Request
    //Duration is built in class
try {

    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    print(data);

    //Get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    //Date time object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    isDaytime = now.hour > 6 && now.hour < 20 ? true : false;

    //Changes Date to String like .desc in iOS
    time = DateFormat.jm().format(now);


  }
catch (error){
  //Error Handling
  time = 'Could not get data';
}


  }






}

