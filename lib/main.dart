import 'package:flutter/material.dart';
import 'package:transport/transport/assign_driver.dart';
import 'package:transport/transport/dashboard.dart';
import 'package:transport/transport/deliver_details_progress.dart';
import 'package:transport/transport/delivery_details.dart';
import 'package:transport/transport/delivery_details_completed.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: transporter_dashboard(),
    );
  }
}

