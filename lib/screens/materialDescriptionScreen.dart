import 'package:flutter/material.dart';
import 'package:recicle_app/models/materialModel.dart';
import 'package:url_launcher/url_launcher.dart';

class MaterialWasteScreen extends StatelessWidget {
  static const routeName = '/material';

  @override
  Widget build(BuildContext context) {
    final Waste waste = ModalRoute.of(context).settings.arguments;

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
                      ? Container()
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
                      ? Container()
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
                      ? Container()
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
                  Expanded(
                    child: Image.asset(waste.images[0]),
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
