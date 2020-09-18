import 'package:flutter/material.dart';
import 'package:recicle_app/widgets/wasteGridWidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('Recycle App Sliver'),
          backgroundColor: Theme.of(context).accentColor,
          floating: true,
          snap: true,
          pinned: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              height: 0.25 * size.height,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 75,
                  ),
                  Text(
                    'O que você que descartar hoje?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: 300,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Caderno',
                          hintStyle: TextStyle(
                            color:
                                Theme.of(context).accentColor.withOpacity(0.5),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.search,
                            color: Theme.of(context).accentColor,
                          )),
                    ),
                  ),
                  Text(
                    'Aprenda aqui a separar cada tipo de material!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Stack(
                    children: [
                      Container(),
                      Positioned(
                        top: -10,
                        right: 10,
                        height: 60,
                        child: Image.asset(
                          'assets/img/Trash.png',
                        ),
                      ),
                    ],
                    overflow: Overflow.visible,
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(30),
          sliver: WasteGrid(),
        ),
      ],
    );
  }
}
