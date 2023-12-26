import 'package:flutter/material.dart';
import 'package:traffic_park/util/colors.dart';
import 'package:traffic_park/util/traffic_data.dart';

class traffic extends StatefulWidget {
  const traffic({Key? key}) : super(key: key);

  @override
  State<traffic> createState() => _trafficState();
}

class _trafficState extends State<traffic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: hexStringToColor('1E1E1E'),
        title: const Center(
          child: Text(
            'Traffic for today',
            style: TextStyle(
              fontFamily: 'Roboto-Regular',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: hexStringToColor(colorCodes[index]),
              child: Center(child: Text('${data[index]}')),
            );
          }
      ),
    );
  }
}
