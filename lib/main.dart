import 'package:flutter/material.dart';
import 'package:traffic_park/pages/home.dart';
import 'package:traffic_park/pages/book.dart';
import 'package:traffic_park/pages/traffic.dart';
import 'package:traffic_park/pages/bill.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context)=> home(),
        '/book': (context)=> book(),
        '/traffic': (context)=> traffic(),
        '/bill': (context)=> bill(),
      }
  ));
}