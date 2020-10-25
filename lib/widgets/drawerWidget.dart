import 'package:flutter/material.dart';
import 'package:recicle_app/models/questionAnswerModel.dart';

class DrawerConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overScroll) {
          overScroll.disallowGlow();
          return false;
        },
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  image: new DecorationImage(
                    image: new ExactAssetImage('assets/icons/recycle.png'),
                    alignment: Alignment(1, 1),
                    scale: 0.5,
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).accentColor.withOpacity(0.93),
                        BlendMode.difference),
                  ),
                ),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Row(children: [],),
                      Text(
                        'Recicla Terê',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      // Text(
                      //   "MENU",
                      //   style: TextStyle(
                      //       color: Colors.white, fontWeight: FontWeight.bold),
                      // ),
                    ],
                  ),
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
            Spacer(),
            ListTile(
              title: Text(
                "NOSSOS PARCEIROS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              // scrollDirection: Axis.horizontal,
              // padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 100,
                      width: 150,
                      child: Image.asset("assets/img/logo-associacao.png"),
                      decoration: BoxDecoration(
                        // color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 80,
                      width: 150,
                      child: Image.asset('assets/img/logo-unifeso.png'),
                      decoration: BoxDecoration(
                        // color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 80,
                      width: 170,
                      child: Image.asset('assets/img/logo-prefeitura.png'),
                      decoration: BoxDecoration(
                        // color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
