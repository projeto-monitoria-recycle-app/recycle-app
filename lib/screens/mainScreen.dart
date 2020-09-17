import 'package:flutter/material.dart';
import 'package:recicle_app/models/questionAnswerModel.dart';
import 'package:recicle_app/screens/impactScreen.dart';
import 'package:recicle_app/screens/recycleScreen.dart';
import 'package:recicle_app/screens/homeScreen.dart';
import 'package:recicle_app/widgets/drawerWidget.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/homepage';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedMenu = 0;

  static List<Widget> _widgetList = <Widget>[
    HomeScreen(),
    RecycleScreen(),
    ImpactScreen(),
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
        backgroundColor: Theme.of(context).accentColor,
      ),
      drawer: DrawerConfig(),
      body: Container(
        child: _widgetList.elementAt(_selectedMenu),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/home.png'),
            ),
            title: Text('HomePage'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/recycle.png'),
            ),
            title: Text('Reciclar'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/impact.png'),
            ),
            title: Text('Impacto'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/user.png'),
            ),
            title: Text('Minha Conta'),
          ),
        ],
        currentIndex: _selectedMenu,
        onTap: _onMenuTapped,
        selectedIconTheme: IconThemeData(
          size: 32,
          color: Theme.of(context).accentColor,
        ),
        selectedLabelStyle: TextStyle(
          fontSize: 14,
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
