import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recicle_app/daos/collectDayNotificationDao.dart';
import 'package:recicle_app/models/CollectDayNotification.dart';
import 'package:recicle_app/models/collectPointModel.dart';
import 'package:recicle_app/models/collectRouteModel.dart';
import 'package:recicle_app/models/daysOfWeek.dart';
import 'package:recicle_app/services/collectDayNotificationService.dart';
import 'package:recicle_app/services/notificationService.dart';
import 'package:recicle_app/widgets/notificationDialogWidget.dart';
import 'package:recicle_app/widgets/toggleButtonWidget.dart';

class RecycleScreen extends StatefulWidget {
  final CollectDayNotificationService collectDayNotificationService =
      CollectDayNotificationService();

  @override
  _RecycleScreenState createState() => _RecycleScreenState();
}

class _RecycleScreenState extends State<RecycleScreen> {
  String selectedDistrict;
  List<String> districtList = ['Todos Bairros'];
  List<CollectPoint> filteredCollectPointList =
      new List<CollectPoint>.from(collectPointList);
  List<CollectRoute> filteredCollectRouteList =
      new List<CollectRoute>.from(collectRouteList);

  void filterPointList(
    String district,
  ) {
    filteredCollectPointList.clear();
    collectPointList.forEach(
      (element) {
        if (element.district == district) {
          filteredCollectPointList.add(element);
        }
      },
    );
  }

  void filterRouteList(String district) {
    filteredCollectRouteList.clear();
    collectRouteList.forEach(
      (element) {
        if (element.district == district) {
          filteredCollectRouteList.add(element);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();

    collectRouteList.sort((a, b) => a.district.compareTo(b.district));

    Set<String> districts =
        new Set<String>.from(collectRouteList.map((e) => e.district));

    districts.forEach((element) {
      districtList.add(element);
    });
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
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                pinned: true,
                floating: true,
                snap: true,
                title: Text('Coleta Seletiva'),
                expandedHeight: 170,
                backgroundColor: Theme.of(context).accentColor,
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
                      Container(
                        alignment: Alignment.center,
                        height: 45,
                        width: 200,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: DropdownButton<String>(
                          style: TextStyle(color: Colors.grey[700]),
                          hint: Text(
                            'Selecione o Bairro',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.5),
                            ),
                          ),
                          value: selectedDistrict,
                          onChanged: (String newValue) {
                            setState(() {
                              selectedDistrict = newValue;
                              filterPointList(selectedDistrict);
                              filterRouteList(selectedDistrict);
                              if (selectedDistrict == "Todos Bairros") {
                                collectPointList.forEach((element) {
                                  filteredCollectPointList.add(element);
                                });
                                collectRouteList.forEach((element) {
                                  filteredCollectRouteList.add(element);
                                });
                              }
                              }
                            });
                          },
                          items: districtList
                              .map<DropdownMenuItem<String>>((String district) {
                            return DropdownMenuItem<String>(
                              value: district,
                              child: Text(district),
                            );
                          }).toList(),
                        ),
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
                    padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ECOPONTOS',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                        ),
                        // Text('ver todos')
                      ],
                    ),
                  ),
                  // Text("Clique no card para ver o ponto no mapa."),
                  Container(
                    height: 180,
                    child: filteredCollectPointList.isEmpty
                        ? Column(
                            children: [
                              Card(
                                clipBehavior: Clip.antiAlias,
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                            width: 120,
                                            height: 120,
                                            child: Icon(
                                              Icons.delete_forever,
                                              color: Colors.grey[300],
                                              size: 50,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "ESSE BAIRRO NÃO TEM UM ECOPONTO AINDA.",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : ListView.builder(
                            addAutomaticKeepAlives: false,
                            scrollDirection: Axis.horizontal,
                            itemCount: filteredCollectPointList.length,
                            itemBuilder: (context, index) {
                              var name = filteredCollectPointList[index].name;
                              var district =
                                  filteredCollectPointList[index].district;
                              var image = filteredCollectPointList[index].image;
                              return Column(
                                children: [
                                  FlatButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/map',
                                        arguments:
                                            filteredCollectPointList[index],
                                      );
                                    },
                                    child: Card(
                                      clipBehavior: Clip.antiAlias,
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                width: 120,
                                                height: 120,
                                                child: Image.asset(image,
                                                    fit: BoxFit.cover),
                                              ),
                                              Positioned(
                                                bottom: 7,
                                                right: 7,
                                                child: Icon(
                                                  Icons.location_on,
                                                  size: 30,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 10,
                                                right: 10,
                                                child: Icon(Icons.location_on,
                                                    size: 24,
                                                    color: Theme.of(context)
                                                        .accentColor),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          district,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .accentColor),
                                        ),
                                        Text(
                                          name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
            SliverPersistentHeader(
              // pinned: true,
              // floating: false,
              delegate: CollectRouterHeader(),
            ),
            FutureBuilder<Set<int>>(
              future: Future.delayed(
                  Duration(seconds: 0),
                  () => widget.collectDayNotificationService
                      .getCollectRouteIds()),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CollectRouteSliverList(
                      filteredCollectRouteList, snapshot.data);
                } else {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: LinearProgressIndicator(),
                    ),
                  );
                }
              },
            ),
            // SliverList(
            //   delegate: SliverChildListDelegate(
            //       List.generate(filteredCollectRouteList.length, (index) {
            //     var collectRoute = filteredCollectRouteList[index];
            //     return CollectRouteListItem(collectRoute);
            //   })),
            // ),
          ],
        ),
      ),
    );
  }
}

class CollectRouteSliverList extends StatelessWidget {
  final List<CollectRoute> filteredCollectRouteList;
  final Set<int> collectRoutesWithNotificationActive;

  CollectRouteSliverList(
    this.filteredCollectRouteList,
    this.collectRoutesWithNotificationActive, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
          List.generate(filteredCollectRouteList.length, (index) {
        var collectRoute = filteredCollectRouteList[index];
        bool initialState =
            collectRoutesWithNotificationActive.contains(collectRoute.id);
        return CollectRouteListItem(
          collectRoute,
          collectRoutesWithNotificationActive: this.collectRoutesWithNotificationActive,
        );
      })),
    );
  }
}

class CollectRouteListItem extends StatelessWidget {
  final CollectRoute _collectRoute;
  final Set<int> collectRoutesWithNotificationActive;

  CollectRouteListItem(this._collectRoute, {this.collectRoutesWithNotificationActive});

  @override
  Widget build(BuildContext context) {
    bool initialButtonState = this.collectRoutesWithNotificationActive.contains(_collectRoute.id);
    return Card(
      child: ListTile(
          title: Text(this._collectRoute.location),
          subtitle: Text(
              "Bairro: ${this._collectRoute.district} - ${this._collectRoute.dayOfWeek.ptBrValue} - ${this._collectRoute.dayPart} "),
          trailing: ToggleNotificationButton(
            _collectRoute,
            initialButtonState: initialButtonState,
            collectRoutesWithNotificationActive: this.collectRoutesWithNotificationActive,

          )),
    );
  }
}

class ToggleNotificationButton extends StatelessWidget {
  final CollectRoute _collectRoute;
  final bool initialButtonState;
  final Set<int> collectRoutesWithNotificationActive;

  ToggleNotificationButton(this._collectRoute,
      {Key key, this.initialButtonState, this.collectRoutesWithNotificationActive, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool initialButtonState =  this.initialButtonState == null ? false : this.initialButtonState;
    return ToggleButton(key: UniqueKey(),
      initialButtonState: initialButtonState,
      iconOn: Icon(
        Icons.notifications_active,
        color: Theme.of(context).primaryColor,
      ),
      iconOff: Icon(
        Icons.notifications_none,
      ),
      onTurnOn: () async {
        bool confirmation = await _showConfirmationDialog(context, true);
        if (confirmation) {
          return CollectDayNotificationService()
              .scheduleNotification(this._collectRoute)
              .then((value) {
            if(this.collectRoutesWithNotificationActive != null){
              this.collectRoutesWithNotificationActive.add(this._collectRoute.id);
            }
            return true;
          })
              .catchError((e, stackTrace) {
            return false;
          });
        }
        return confirmation;
      },
      onTurnOff: () {
        return _showConfirmationDialog(context, false).then((confirmation) {
          return confirmation;
        });
      },
    );
  }

  Future<bool> _showConfirmationDialog(
      BuildContext context, bool activation) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return activation
            ? NotificationActivationDialog()
            : NotificationDeactivationDialog();
      },
    );
  }
}

class CollectRouterHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(
        'ROTAS DE COLETA SELETIVA',
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[800]),
      ),
    );
  }

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
