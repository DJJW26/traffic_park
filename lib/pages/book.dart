import 'package:flutter/material.dart';
import 'package:traffic_park/util/colors.dart';

class book extends StatefulWidget {
  const book({Key? key}) : super(key: key);

  @override
  State<book> createState() => _bookState();
}

class _bookState extends State<book> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation1;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _welcomeAnimation;
  late Animation<Offset> _itemAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    print("_controller initialized: ${_controller != null}");

    _opacityAnimation1 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
    ));
    _opacityAnimation = Tween<double>(
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

    _itemAnimation = Tween<Offset>(
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Check if animations and controller are not null before using them
    if (_controller == null ||
        _opacityAnimation1 == null ||
        _opacityAnimation == null ||
        _welcomeAnimation == null ||
        _itemAnimation == null) {
      return Container(); // Return an empty container or some fallback widget
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: hexStringToColor('1E1E1E'),
        title: const Center(
          child: Text(
            'Book a slot',
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
          SizedBox(height: 20.0),
          Center(
            child: SlideTransition(
              position: _welcomeAnimation,
              child: FadeTransition(
                opacity: _opacityAnimation1,
                child: Text(
                  'Available slots:',
                  style: TextStyle(
                    fontFamily: 'Roboto-Regular',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 40.0),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // Adjust the number of parking spaces per row as needed
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: 20, // Adjust the
            shrinkWrap: true,// total number of parking spaces as needed
            itemBuilder: (context, index) {
              return SlideTransition(
                position: _itemAnimation,
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: InkWell(
                    onTap: () {
                      // Handle the tap action for the parking space at index
                      Navigator.pushNamed(context, '/bill');
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Text(
                          'Space ${index+1}',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
