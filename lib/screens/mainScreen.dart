import 'package:flutter/material.dart';
import 'package:recicle_app/screens/collectScreen.dart';
import 'package:recicle_app/screens/impactScreen.dart';
import 'package:recicle_app/screens/materialScreen.dart';
import 'package:recicle_app/widgets/drawerWidget.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/mainpage';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedMenu = 0;
  PageController _controller = PageController(
    initialPage: 0,
    keepPage: true,
  );

  static List<Widget> _widgetList = <Widget>[
    HomeScreen(),
    RecycleScreen(),
    ImpactScreen()
  ];

  void _onMenuTapped(int index) {
    setState(
      () {
        _controller.jumpToPage(index);

        _selectedMenu = index;
      },
    );
  }

  void _onPageViewChange(int page) {
    print("Current Page: " + page.toString());
    int previousPage = page.floor();
    if (page != 0)
      previousPage--;
    else
      previousPage = 2;
    print("Previous page: $previousPage");
    setState(() {
      _selectedMenu = page.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerConfig(),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overScroll) {
          overScroll.disallowGlow();
          return false;
        },
        child: PageView(
          controller: _controller,
          children: _widgetList,
          onPageChanged: _onPageViewChange,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/waste.png'),
            ),
            title: Text('Recicláveis'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/truck.png'),
            ),
            title: Text('Coleta Seletiva'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/earth-care.png'),
            ),
            title: Text('Impacto'),
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
