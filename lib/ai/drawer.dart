import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Custom Drawer Example'),
        // Add a custom menu button to the AppBar
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Open the drawer when the menu button is clicked
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
      // Use the Drawer widget for the left-side drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Implement action for Item 1
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Implement action for Item 2
                Navigator.pop(context);
              },
            ),
            // Add more ListTiles for additional drawer items
          ],
        ),
      ),
      body: Center(
        child: Text('Click the menu button to open the drawer.'),
      ),
    );
  }
}
