import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recycle_app/models/about_us_model.dart';
import 'package:recycle_app/models/question_answer_model.dart';
import 'package:url_launcher/url_launcher.dart';


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
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8,
            left: 8,
            right: 8,
          ),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                pinned: true,
                floating: true,
                snap: true,
                title: Text(
                  'Projeto Recicla Terê',
                  style: Theme.of(context).textTheme.headline1,
                ),
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
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
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
                                style: Theme.of(context).textTheme.bodyText1,
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
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 20, 10, 10),
                        child: Text(
                          'PERGUNTAS FREQUENTES:',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      Theme(data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child:
                        Card(
                          child: Column(
                            children: [
                              ExpansionTile(
                                childrenPadding: EdgeInsets.all(12),
                                leading: ImageIcon(
                                  AssetImage('assets/icons/balao.png'),
                                  color: Colors.black,
                                ),
                                title: Text(
                                  'O QUE É COLETA SELETIVA?',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                children: [
                                  Text('É um método que otimiza os processos de destinação do lixo. Dentro da Coleta'
                                    ' Seletiva temos a reciclagem que visa separar o lixo em resíduos reutilizáveis e'
                                    ' não reutilizáveis.',
                                      style: Theme.of(context).textTheme.bodyText1),
                                ],
                              ),
                              ExpansionTile(
                                childrenPadding: EdgeInsets.all(12),
                                leading: ImageIcon(
                                  AssetImage(
                                    'assets/icons/balao.png',
                                  ),
                                  color: Colors.black,
                                ),
                                title: Text(
                                  'QUAL É A SUA IMPORTÂNCIA?',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),children: [
                                Text('A importância da coleta seletiva é justamente a redução dos impactos '
                                    'ambientais do consumo. Quando separamos os nossos resíduos, facilitamos '
                                    'muito o seu tratamento e diminuímos as chances de impactos nocivos para o '
                                    'ambiente e para a saúde da vida no planeta, incluindo a vida.',
                                    style: Theme.of(context).textTheme.bodyText1),
                                ],
                              ),
                              ExpansionTile(
                                childrenPadding: EdgeInsets.all(12),
                                leading: ImageIcon(
                                  AssetImage('assets/icons/balao.png'),
                                  color: Colors.black,
                                ),
                                title: Text(
                                  'COMO VOCÊ PODE CONTRIBUIR?',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                children: [
                                  Text('Separando o seu material e descartando corretamente na coleta seletiva '
                                        'e em caso de ainda não possuir rota de coleta em sua rua, deposite o seu '
                                        'resíduo em um dos nossos eco pontos espalhados pela cidade. '
                                        'Outra forma de contribuição é a divulgação do nosso programa de coleta '
                                        'seletiva, para os seus parentes, vizinhos e também em suas redes sociais, como '
                                        'também divulgando o nosso Instragram (@associacaocatadores) e este aplicativo.',
                                      style: Theme.of(context).textTheme.bodyText1),
                                ],
                              ),
                              ExpansionTile(
                                childrenPadding: EdgeInsets.all(12),
                                leading: ImageIcon(
                                  AssetImage('assets/icons/balao.png'),
                                  color: Colors.black,
                                ),
                                title: Text(
                                  'QUEM SOMOS?',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),children: [
                                    Text(questionsList.last.answer.first + '\n' + questionsList.last.answer.last,
                                          style: Theme.of(context).textTheme.bodyText1),
                                ],
                              ),
                              const Divider(
                                height: 30,
                                thickness: 1,
                                indent: 60,
                                endIndent: 60,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: Text(
                                  'Para mais informações a respeito da coleta seletiva ou materiais recicláveis, ligue para Secretaria Municipal de Meio Ambiente:',
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              TextButton(onPressed: () => launch("tel://2742-7763"),
                                  child: Text("2742-7763")
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
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "NOSSOS PARCEIROS",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SingleChildScrollView(
                            child: Container(
                              height: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    height: 70,
                                    width: 130,
                                    child: Image.asset(
                                        'assets/img/logo-unifeso.png'),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    height: 70,
                                    width: 160,
                                    child: Image.asset(
                                        'assets/img/logo-prefeitura.png'),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
