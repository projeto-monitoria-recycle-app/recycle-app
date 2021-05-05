import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:recicle_app/models/materialModel.dart';
// import 'package:url_launcher/url_launcher.dart';

class NewMaterialWasteScreen extends StatelessWidget {
  static const routeName = '/newmaterial';

  @override
  Widget build(BuildContext context) {
    final Waste waste = ModalRoute.of(context).settings.arguments;
    // final double screenHeight = MediaQuery.of(context).size.height;
    // final double screenWidth = MediaQuery.of(context).size.width;

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overScroll) {
        overScroll.disallowGlow();
        return false;
      },
      child: Container(
        color: Colors.grey[100],
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
                  title: Text(waste.name),
                  expandedHeight: 200,
                  backgroundColor: waste.color,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Descubra os pontos de coleta próximos a você.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        SliverToBoxAdapter(
          child: Column(
            children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(children: [
                Container(
                  margin: EdgeInsets.only(top:15),
                  child: Row(
                    children: [
                      Text("COMO DESCARTAR " + waste.name.toUpperCase(), 
                        textAlign: TextAlign.left,
                        style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                      ),
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("oi"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:15),
                  child: Row(
                    children: [
                      Text("IMPACTOS", 
                        textAlign: TextAlign.left,
                        style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                      ),
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text("Impactos Economicos"),
                          Text("Impactos Ambiental"),
                          Text("Impactos Social"),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:15),
                  child: Row(
                    children: [
                      Text("TRATAMENTO DO RESÍDUO", 
                        textAlign: TextAlign.left,
                        style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                      ),
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("oi"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:15),
                  child: Row(
                    children: [
                      Text("ITENS RECICLÁVEIS", 
                        textAlign: TextAlign.left,
                        style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                      ),
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15),
                    ),
                  ),
                  child:
                    Column(
                      children: [
                        Row(
                          children: [],
                        ),
                        Wrap(
                          children: [
                            for (String item in waste.searchItens[1].split(","))
                            Card(
                              elevation: 0,
                              color: waste.color,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(100),
                                  ),
                                ),
                              child: 
                                Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                child: Text(item, style: TextStyle(color: Colors.white,),),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ),
                Container(
                  child: Row(
                    children: [
                      Text("ITENS NÃO RECICLÁVEIS", 
                        textAlign: TextAlign.left,
                        style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                      ),
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15),
                    ),
                  ),
                  child:
                    Column(
                      children: [
                        Row(
                          children: [],
                        ),
                        Wrap(
                          alignment: WrapAlignment.start,
                          children: [
                            for (String item in waste.searchItens[1].split(","))
                            Card(
                              elevation: 0,
                              color: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(100),
                                  ),
                                ),
                              child: 
                                Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                child: Text(item, style: TextStyle(color: Colors.white,),),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ),
              ],
            ),
          )
            ],
          ),
        )
            ],
          ),
        ),
      ),
    );
  }
}