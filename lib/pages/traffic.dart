import 'package:flutter/material.dart';
import 'package:traffic_park/util/colors.dart';

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
      body:
    );
  }
}
