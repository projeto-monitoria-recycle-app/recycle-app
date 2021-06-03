import 'package:flutter/material.dart';
import 'package:recycle_app/screens/AboutProject.dart';
import 'package:recycle_app/screens/collectScreen.dart';
import 'package:recycle_app/screens/materialScreen.dart';
import 'package:recycle_app/screens/resultsScreen.dart';

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
    AboutProject(),
    HomeScreen(),
    RecycleScreen(),
    ResultsScreen()
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
      // floatingActionButton: Container(
      //   width: screenWidth * 0.92,
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     border: Border.all(
      //       color: Colors.grey[500],
      //       width: 1,
      //     ),
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       Container(
      //         color: Colors.grey[100],
      //         child: IconButton(
      //             icon: ImageIcon(
      //               AssetImage('assets/icons/waste.png'),
      //               size: 24,
      //             ),
      //             onPressed: () {}),
      //       ),
      //       Container(
      //         color: Colors.white,
      //         child: IconButton(
      //           icon: ImageIcon(
      //             AssetImage('assets/icons/waste.png'),
      //             size: 24,
      //           ),
      //           onPressed: () {},
      //         ),
      //       ),
      //       Container(
      //         color: Colors.white,
      //         child: IconButton(
      //           icon: ImageIcon(
      //             AssetImage('assets/icons/waste.png'),
      //             size: 24,
      //           ),
      //           onPressed: () {},
      //         ),
      //       ),
      //       Container(
      //         color: Colors.white,
      //         child: IconButton(
      //           icon: ImageIcon(
      //             AssetImage('assets/icons/waste.png'),
      //             size: 24,
      //           ),
      //           onPressed: () {},
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icons8-planejamento-ambiental-100.png'),
            ),
            label: 'ReciclaTerê',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/waste.png'),
            ),
            label: 'Recicláveis',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icons8-caminhão-de-lixo-100.png'),
            ),
            label: 'Coleta Seletiva',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icons8-gráfico-positivo-100.png'),
            ),
            label: 'Resultados',
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
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
        selectedItemColor: Theme.of(context).accentColor,
        showUnselectedLabels: false,
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
