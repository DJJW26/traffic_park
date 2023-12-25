import 'package:flutter/material.dart';
import 'package:traffic_park/util/colors.dart';


class home extends StatefulWidget {
  //const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation1;
  late Animation<double> _opacityAnimation2;
  late Animation<Offset> _welcomeAnimation;
  late Animation<Offset> _toParkSmartAnimation;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _opacityAnimation1 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
    ));
    _opacityAnimation2 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
    ));

    _welcomeAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
    ));

    _toParkSmartAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: hexStringToColor('1E1E1E'),
        title: const Center(
          child: Text(
              'Park Smart',
            style: TextStyle(
              fontFamily: 'Roboto-Regular',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 300.0),
          Center(
            child: SlideTransition(
              position: _welcomeAnimation,
              child: FadeTransition(
                opacity: _opacityAnimation1,
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontFamily: 'Roboto-Regular',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: SlideTransition(
              position: _toParkSmartAnimation,
              child: FadeTransition(
                opacity: _opacityAnimation2,
                child: Text(
                  'to Park Smart',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontFamily: 'Roboto-Regular',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 250.0),
          Container(
            height: 5.0,
            color: hexStringToColor('FAF8E4'),
          ),
          SizedBox(height: 70.0),
          Center(
              child: Text(
                  'What can we do for you today?',
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Roboto-Regular',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
          ),
          SizedBox(height: 30.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network('https://elid.com.ph/wp-content/uploads/2021/06/parked-red-car-among-white-car-your-car-parking-lot-1.jpg'),
                )
              ),
              TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/book');
                  },
                child: const Text(
                    'Book a parking slot',
                  style: TextStyle(
                      fontFamily: 'Roboto-Regular',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network('https://www.thatslife.com.au/media/7260/traffic.jpg'),
                )
              ),
              TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/traffic');
                },
                child: const Text(
                    'Check for nearby traffic',
                  style: TextStyle(
                      fontFamily: 'Roboto-Regular',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ],
      ),
    );
  }
}
