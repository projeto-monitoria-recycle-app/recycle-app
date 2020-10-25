import 'package:flutter/material.dart';
import 'package:recicle_app/models/materialModel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchedItem = '';
  List<Waste> filteredWasteList = new List<Waste>.from(wasteList);

  filterGrid(search) {
    filteredWasteList.clear();
    for (var material in wasteList) {
      String itemList = material.searchItens.join().toLowerCase();
      if (itemList.contains(search)) {
        setState(() {
          filteredWasteList.add(material);
        });
      }
    }
  }

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
                title: Text('Materiais Recicláveis'),
                backgroundColor: Theme.of(context).accentColor,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                pinned: true,
                floating: true,
                snap: true,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 75,
                      ),
                      Text(
                        'O que você gostaria de descartar hoje?',
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
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: TextField(
                          onChanged: (value) {
                            setState(
                              () {
                                searchedItem = value.toLowerCase();
                                filterGrid(searchedItem);
                              },
                            );
                          },
                          decoration: InputDecoration(
                              hintText: 'Caderno',
                              hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.5),
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
                            top: 10,
                            left: 10,
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
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              sliver: SliverGrid.count(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount:
                    (MediaQuery.of(context).size.width / 140).floor(),
                children: List.generate(
                  filteredWasteList.length,
                  (index) {
                    var material = filteredWasteList[index].name;
                    var icon = filteredWasteList[index].icon;
                    var color = filteredWasteList[index].color;
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/material",
                          arguments: filteredWasteList[index],
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 50,
                        decoration: BoxDecoration(
                          image: new DecorationImage(
                            image:
                                new ExactAssetImage('assets/icons/recycle.png'),
                            alignment: Alignment(1.5, 1.5),
                            scale: 0.5,
                            colorFilter: ColorFilter.mode(
                                color.withOpacity(0.93), BlendMode.difference),
                          ),
                          color: color,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('$material',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center),
                            ImageIcon(
                              icon,
                              color: Colors.white,
                              size: 70,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
