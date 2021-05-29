import 'package:flutter/material.dart';
import 'package:recycle_app/widgets/chartResults.dart';

class ResultsScreen extends StatelessWidget {
  static const routeName = '/results';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
                title: Text('Resultados'),
                centerTitle: true,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                pinned: true,
                backgroundColor: Theme.of(context).accentColor,
                expandedHeight: 100,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Veja os resultados do projeto de reciclagem na cidade de Teresópolis',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text(
                    //   'Veja os resultados do projeto de reciclagem na cidade de Teresópolis',
                    //   style: TextStyle(
                    //     fontSize:  18,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    SizedBox(
                      height: 15,
                    ),
                    Card(
                        // child: BarChartSample2(),
                        ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      height: 300,
                      // child: [],
                    ),
                    // BarChartSample2(),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Número de Participantes',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Card(
                      // padding: EdgeInsets.all(5),
                      // decoration: BoxDecoration(
                      //   color: Colors.grey[300],
                      //   borderRadius: BorderRadius.all(
                      //     Radius.circular(5),
                      //   ),
                      // ),
                      // height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Visibility(
                              visible: true,
                              child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: ImageIcon(
                                    AssetImage(
                                        "assets/icons/icons8-user-groups-100.png"),
                                    size: 50,
                                    color: Colors.grey[900],
                                  )),
                            ),
                            Text(
                              "4 Empresas Apoiando\n" +
                                  "14 Colaboradores\n" +
                                  "20 Catadores Registrados\n" +
                                  "+200 Moradores Reciclando",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Total de Ecopontos',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Card(
                              // padding: EdgeInsets.all(10),
                              // decoration: BoxDecoration(
                              //   color: Colors.grey[300],
                              //   borderRadius: BorderRadius.all(
                              //     Radius.circular(5),
                              //   ),
                              // ),
                              // height: 55,
                              // width: screenWidth * .45,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: ImageIcon(
                                        AssetImage("assets/icons/waste.png"),
                                        size: 40,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    Text(
                                      '25',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF09995C),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Bairros Atendidos',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Card(
                              // padding: EdgeInsets.all(10),
                              // decoration: BoxDecoration(
                              //   color: Colors.grey[300],
                              //   borderRadius: BorderRadius.all(
                              //     Radius.circular(5),
                              //   ),
                              // ),
                              // // height: 55,
                              // width: screenWidth * .45,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: ImageIcon(
                                          AssetImage(
                                              "assets/icons/icons8-caminhão-de-lixo-100.png"),
                                          size: 40,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                      Text(
                                        '15',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF09995C),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
