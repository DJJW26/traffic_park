import 'package:flutter/material.dart';
import 'package:traffic_park/util/colors.dart';

class bill extends StatefulWidget {
  const bill({Key? key}) : super(key: key);

  @override
  State<bill> createState() => _billState();
}

class _billState extends State<bill> {

  TextEditingController controller = TextEditingController();
  String text = "0.0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: hexStringToColor('1E1E1E'),
        title: const Center(
          child: Text(
            'Bill',
            style: TextStyle(
              fontFamily: 'Roboto-Regular',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                Center(
                  child: Text(
                    '                                TAX INVOICE\n                                 Park Smart\n-------------------------------------------------------',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Center(
                  child: Text(
                    'Date: ${DateTime.now().day.toString().padLeft(2, '0')}/${DateTime.now().month.toString().padLeft(2, '0')}/${DateTime.now().year}',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Center(
                  child: Text(
                    '-------------------------------------------------------',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  '   Cost per hour:                                              1.00\$',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Text('   Hours:',
                    style: TextStyle(
                      fontSize: 16.0
                    ),),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(270.0, 10.0, 10.0, 20.0),
                        child: TextField(
                          controller: controller,
                          onChanged: (String value){
                            setState(() {
                              text = controller.text;
                            });
                          },
                        ),
                      ),
                    ),
                    Text('\$      ',
                    style: TextStyle(
                      fontSize: 16.0
                    ),)
                  ],
                ),
                Text(
                  '  Total Amount:                                             $text\$',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
        );
  }
}
