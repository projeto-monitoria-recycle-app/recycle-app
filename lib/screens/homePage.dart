import 'package:flutter/material.dart';
import 'package:recicle_app/screens/recyclePage.dart';
import 'package:recicle_app/screens/wastePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedMenu = 0;
  static List<Widget> _widgetList = <Widget>[
    WastePage(),
    RecyclePage(),
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
      body: Container(
        child: _widgetList.elementAt(_selectedMenu),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icons8-casa-50.png'),
            ),
            title: Text('HomePage'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icons8-sinal-de-reciclagem-50.png'),
            ),
            title: Text('Reciclar'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icons8-vaso-de-planta-50.png'),
            ),
            title: Text('Impacto'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icons8-usuário-50.png'),
            ),
            title: Text('Minha Conta'),
          ),
        ],
        currentIndex: _selectedMenu,
        onTap: _onMenuTapped,
        selectedIconTheme: IconThemeData(
          size: 35,
          color: Theme.of(context).accentColor,
        ),
        selectedLabelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        selectedItemColor: Theme.of(context).accentColor,
        showUnselectedLabels: true,
        unselectedIconTheme: IconThemeData(
          size: 25,
          color: Colors.grey[900],
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        unselectedItemColor: Colors.grey[900],
      ),
    );
  }
}
