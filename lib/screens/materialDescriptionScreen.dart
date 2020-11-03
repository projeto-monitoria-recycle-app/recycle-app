import 'package:flutter/material.dart';
import 'package:recicle_app/models/materialModel.dart';
import 'package:url_launcher/url_launcher.dart';

class MaterialWasteScreen extends StatelessWidget {
  static const routeName = '/material';

  @override
  Widget build(BuildContext context) {
    final Waste waste = ModalRoute.of(context).settings.arguments;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: waste.color,
        title: Text(waste.name),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
          ),
        ),
        toolbarHeight: 75,
        actions: [
          ImageIcon(
            waste.icon,
            size: 40,
          ),
          Container(
            width: 40,
          )
        ],
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overScroll) {
          overScroll.disallowGlow();
          return false;
        },
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    waste.title,
                    style: TextStyle(
                        color: waste.color,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  for (String item in waste.content)
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        item,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  waste.links.isEmpty
                      ? SizedBox()
                      : Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: InkWell(
                            onTap: () async {
                              String url = waste.links[0][1];
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Não foi possivel acesse o link: $url.';
                              }
                            },
                            child: Text(
                              waste.links[0][0],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue),
                            ),
                          ),
                        ),
                  waste.recyclable.isEmpty
                      ? SizedBox()
                      : Text(
                          "O que separar para a coleta seletiva: ",
                          style: TextStyle(
                              color: waste.color,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      waste.recyclable,
                      textAlign: TextAlign.justify,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  waste.notRecyclable.isEmpty
                      ? SizedBox()
                      : Text(
                          "O que não jogar nos Ecopontos: ",
                          style: TextStyle(
                              color: waste.color,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      waste.notRecyclable,
                      textAlign: TextAlign.justify,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  waste.hints.isEmpty
                      ? SizedBox()
                      : Column(
                          children: List.generate(
                            waste.hints.length,
                            (index) {
                              return Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.orangeAccent[200],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Spacer(),
                                    Container(
                                      width: screenWidth * 0.50,
                                      child: Text(
                                        waste.hints[index][0],
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                    Spacer(),
                                    InkWell(
                                      child: Container(
                                        height: screenWidth * 0.3,
                                        width: screenWidth * 0.3,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(1),
                                              blurRadius: 1,
                                              offset: Offset(2, 1),
                                            ),
                                          ],
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        child: Image.asset(
                                          waste.hints[index][1],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.pushNamed(context, "/photo",
                                            arguments: waste.hints[index][1]);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      waste.images[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
