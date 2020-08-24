import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedMenu = 0;
  static const List<Widget> _widgetList = <Widget>[
    Text('HomePage'),
    Text('Page 2'),
    Text('Page 3'),
    Text('Page 4')
  ];

  void _onMenuTapped(int index) {
    setState(() {
      _selectedMenu = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Recycle App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).accentColor),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dúvidas Frequentes',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text('Option 1'),
            ),
            ListTile(
              title: Text('Option 2'),
            ),
            ListTile(
              title: Text('Option 3'),
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetList.elementAt(_selectedMenu),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('HomePage'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sync),
            title: Text('Reciclar'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.priority_high),
            title: Text('Impacto'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Minha Conta'),
          ),
        ],
        currentIndex: _selectedMenu,
        onTap: _onMenuTapped,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).accentColor,
      ),
    );
  }
}
