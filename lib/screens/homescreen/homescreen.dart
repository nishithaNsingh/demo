import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   title: const Text('FusionFlourish Hub'),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: const Icon(Icons.person),
      //       onPressed: () {
      //         // Handle the button tap
      //       },
      //     ),
      //     IconButton(
      //       icon: const Icon(Icons.menu),
      //       onPressed: () {
      //         // ScaffoldMessenger.of(context).showSnackBar(
      //         //   const SnackBar(content: Text('This is a snackbar')));
      //       },
      //     ),
      //
      //   ],
      // ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image with reduced brightness
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.8),
              BlendMode.multiply,
            ),
            child: Image.asset(
              'assets/homescreenbg.webp',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/createscreen');
                        // Handle the button tap
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(40.0),
                        primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: Text(
                        'Create',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle the button tap
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(40.0),
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: Text(
                        'Jobs',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle the button tap
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(40.0),
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: Text(
                        'Shopping',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
