import 'package:flutter/material.dart';
import 'package:recicle_app/models/questionAnswerModel.dart';
import 'package:recicle_app/screens/impactScreen.dart';
import 'package:recicle_app/screens/recycleScreen.dart';
import 'package:recicle_app/screens/homeScreen.dart';

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
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).accentColor),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(),
                    Text(
                      'Recicla Terê',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      "MENU",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage('assets/icons/balao.png'),
                color: Colors.black,
              ),
              title: Text('O QUE É COLETA SELETIVA?'),
              onTap: () {
                Navigator.pushNamed(context, '/question',
                    arguments: questionsList[0]);
              },
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage(
                  'assets/icons/balao.png',
                ),
                color: Colors.black,
              ),
              title: Text('QUAL É A SUA IMPORTÂNCIA?'),
              onTap: () {
                Navigator.pushNamed(context, '/question',
                    arguments: questionsList[1]);
              },
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage('assets/icons/balao.png'),
                color: Colors.black,
              ),
              title: Text('PORQUE É IMPORTANTE RECICLAR?'),
              onTap: () {
                Navigator.pushNamed(context, '/question',
                    arguments: questionsList[4]);
              },
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage('assets/icons/balao.png'),
                color: Colors.black,
              ),
              title: Text('COMO VOCÊ PODE CONTRIBUIR?'),
              onTap: () {
                Navigator.pushNamed(context, '/question',
                    arguments: questionsList[2]);
              },
            ),
            ListTile(
              leading: ImageIcon(
                AssetImage('assets/icons/balao.png'),
                color: Colors.black,
              ),
              title: Text('QUEM SOMOS?'),
              onTap: () {
                Navigator.pushNamed(context, '/question',
                    arguments: questionsList[3]);
              },
            ),
            ListTile(
              title: Text(
                "NOSSOS PARCEIROS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                // padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.red[300],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
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
