import 'package:flutter/material.dart';

import 'package:recycle_app/models/collectPointModel.dart';
import 'package:recycle_app/models/collectRouteModel.dart';
import 'package:recycle_app/screens/collect_screen/helpers/filter_helper.dart';
import 'package:recycle_app/screens/collect_screen/widgets/collect_point_horizontal_list.dart';
import 'package:recycle_app/screens/collect_screen/widgets/collect_route_sliver_list.dart';
import 'package:recycle_app/screens/collect_screen/widgets/collect_router_header.dart';
import 'package:recycle_app/services/collectDayNotificationService.dart';

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

  void _updateCollectPointsAndRoutesLists(String newValue) {
    setState(() {
      selectedDistrict = newValue;
      FilterHelper.filterPointList(selectedDistrict, filteredCollectPointList);
      FilterHelper.filterRouteList(selectedDistrict, filteredCollectRouteList);
      if (selectedDistrict == "Todos Bairros") {
        filteredCollectPointList.addAll(collectPointList);
        filteredCollectRouteList.addAll(collectRouteList);
      }
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
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(
                  right: 8,
                  left: 8,
                ),
                sliver: SliverAppBar(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  pinned: true,
                  floating: true,
                  snap: true,
                  title: Text(
                    'Coleta Seletiva',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  centerTitle: true,
                  expandedHeight: 160,
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
                          style: Theme.of(context).textTheme.subtitle1,
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
                          child: StringsDropdownButton(
                            selectedValue: selectedDistrict,
                            hintText: 'Selecione o Bairro',
                            onChanged: _updateCollectPointsAndRoutesLists,
                            items: districtList,
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
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ],
                      ),
                    ),
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
                                            width: 90,
                                            height: 110,
                                            child: Icon(
                                              Icons.delete_forever,
                                              color: Colors.grey[300],
                                              size: 50,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      "ESSE BAIRRO NÃO TEM UM ECOPONTO AINDA.",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                ),
                              ],
                            )
                          : CollectPointHorizontalList(
                              collectPoints: filteredCollectPointList),
                    ),
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: CollectRouterHeader(),
              ),
              CollectRouteSliverList(filteredCollectRouteList),
            ],
          ),
        ),
      ),
    );
  }
}

class StringsDropdownButton extends StatelessWidget {
  final String selectedValue;
  final Function(String) onChanged;
  final String hintText;
  final List<String> items;

  const StringsDropdownButton(
      {Key key,
      this.selectedValue,
      this.onChanged,
      this.hintText = "",
      this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      style: TextStyle(color: Colors.grey[700]),
      hint: Text(
        hintText,
        style: TextStyle(
          color: Theme.of(context).accentColor.withOpacity(0.7),
        ),
      ),
      value: selectedValue,
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((String district) {
        return DropdownMenuItem<String>(
          value: district,
          child: Text(district),
        );
      }).toList(),
    );
  }
}
