import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading...";

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        flag: "germany.png", url: 'Europe/Berlin', location: "Berlin");
    await instance.getTime();
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Text(time),
    ));
  }
}