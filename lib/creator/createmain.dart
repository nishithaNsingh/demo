import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'package:demo_fusionflourish_hub/creator/post.dart';
import 'package:demo_fusionflourish_hub/creator/search.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = [
    const SearchScreen(),
    PostScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create"),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/home_screen');
              // Handle the button tap
            },
          ),
        ],
      ),
      body: _tabs[_selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.black.withOpacity(0.3),
        color: Colors.black,
        activeColor: Colors.white24,
        items: const [
          TabItem(icon: Icons.search, title: 'Search'),
          TabItem(icon: Icons.add, title: 'Post'),
          // TabItem(icon: Icons.book, title: 'Canva'),
        ],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
