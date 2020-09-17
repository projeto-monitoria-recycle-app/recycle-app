import 'package:flutter/material.dart';
import 'package:recicle_app/models/questionAnswerModel.dart';

class DrawerConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).accentColor),
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
                      height: 100,
                      width: 150,
                      child: Image.asset('assets/img/logo-prefeitura.png'),
                      decoration: BoxDecoration(
                        // color: Colors.grey[300],
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
    );
  }
}
