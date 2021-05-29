import 'package:flutter/material.dart';
import 'package:recycle_app/models/questionAnswerModel.dart';
import '../models/AboutUsModel.dart';

class AboutProject extends StatelessWidget {
  static const routeName = '/aboutproject';

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overScroll) {
        overScroll.disallowGlow();
        return false;
      },
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(5),
              sliver: SliverAppBar(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                pinned: true,
                floating: true,
                snap: true,
                title: Text('Projeto Recicla Terê'),
                centerTitle: true,
                expandedHeight: 100,
                backgroundColor: Theme.of(context).accentColor,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Conheça como funciona o projeto de reciclagem.',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              aboutUs.firstText,
                              textAlign: TextAlign.justify,
                              style:
                                  TextStyle(fontSize: 13.0, wordSpacing: 1.2),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                child: Container(
                                  height: 150,
                                  width: 350,
                                  child: Image.asset(aboutUs.images,
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            Text(
                              aboutUs.lastText,
                              textAlign: TextAlign.justify,
                              style:
                                  TextStyle(fontSize: 13.0, wordSpacing: 1.2),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 20, 10, 10),
                      child: Text('Perguntas Frequentes:'.toUpperCase()),
                    ),
                    Card(
                      child: Column(
                        children: [
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
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Text(
                              'Para mais informações a respeito da coleta seletiva ou materiais recicláveis, ligue para Secretaria Municipal de Meio Ambiente: 2742-7763.',
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 120,
                            width: 150,
                            child:
                                Image.asset("assets/img/logo-associacao.png"),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "NOSSOS PARCEIROS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SingleChildScrollView(
                              child: Container(
                                height: 100,
                                width: 320,
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5.0),
                                      height: 70,
                                      width: 150,
                                      child: Image.asset(
                                          'assets/img/logo-unifeso.png'),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5.0),
                                      height: 70,
                                      width: 170,
                                      child: Image.asset(
                                          'assets/img/logo-prefeitura.png'),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
