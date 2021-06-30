import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location = ""; // location name for UI
  String time = "";
  String flag = "";
  String url = "";

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      // Get properties and data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // Set the time property
      time = now.toString();
    } catch (e) {
      print('Error http request $e');
      time = "An error occured";
    }
  }
}
