import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:recycle_app/models/CollectResult.dart';
import 'dart:math';
import 'package:recycle_app/models/materialModel.dart';

class BarChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  int selectMaterial = 0;
  String selectPeriod = periodos.last;
  final Color leftBarColor = const Color(0xff09995C);
  final double width = 7;

  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          //mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 45,
                  // width: screenWidth * .45,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: DropdownButton<int>(
                    style: TextStyle(color: Colors.grey[700]),
                    hint: Text(
                      'Material',
                      style: TextStyle(
                        color: Theme.of(context).accentColor.withOpacity(0.5),
                      ),
                    ),
                    value: selectMaterial,
                    onChanged: (int newValue) {
                      setState(() {
                        selectMaterial = newValue;
                        print(selectMaterial);
                      });
                    },
                    items: indiceMateriais.map<DropdownMenuItem<int>>((int e) {
                      return DropdownMenuItem<int>(
                        value: e,
                        child: Text(wasteList[e].name),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 45,
                  // width: screenWidth * .45,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: DropdownButton<String>(
                    style: TextStyle(color: Colors.grey[700]),
                    hint: Text(
                      'Período',
                      style: TextStyle(
                        color: Theme.of(context).accentColor.withOpacity(0.5),
                      ),
                    ),
                    value: selectPeriod,
                    onChanged: (String newValue) {
                      setState(() {
                        selectPeriod = newValue;
                        print(selectPeriod);
                      });
                    },
                    items: periodos.map<DropdownMenuItem<String>>((e) {
                      return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e.toString()),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  width: 38,
                ),
              ],
            ),
            const SizedBox(
              height: 38,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: BarChart(
                  BarChartData(
                    barTouchData: BarTouchData(
                      enabled: false,
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.transparent,
                        getTooltipItem: (
                          BarChartGroupData group,
                          int groupIndex,
                          BarChartRodData rod,
                          int rodIndex,
                        ) {
                          return BarTooltipItem(
                            rod.y.round().toString(),
                            TextStyle(
                              color: Color(0xFF1E1E1E),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            ),
                          );
                        },
                      ),
                    ),
                    maxY: selectPeriod == '2020-2'
                        ? wasteList[selectMaterial]
                            .ano2020
                            .reduce(max)
                            .toDouble()
                        : wasteList[selectMaterial]
                            .ano2021
                            .reduce(max)
                            .toDouble(),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (value) =>
                            Theme.of(context).textTheme.bodyText1,
                        margin: 10,
                        getTitles: (double value) {
                          return meses[value.toInt()];
                        },
                      ),
                      leftTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: selectPeriod == '2020-2'
                        ? makeGroupData(wasteList[selectMaterial].ano2020)
                            .toList()
                        : makeGroupData(wasteList[selectMaterial].ano2021)
                            .toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Última atualização 06/2021.',
              style: TextStyle(
                  fontSize: 10, color: Colors.grey, fontFamily: 'Poppins'),
              textAlign: TextAlign.right,
            )
          ],
        ),
      ),
    );
  }

  makeGroupData(List<int> results) {
    List<BarChartGroupData> list = [];
    int ini = 6;
    int fim = 12;

    if (selectPeriod[5] == "1") {
      ini = 0;
      fim = 6;
    } else if (selectPeriod[5] == "2") {
      ini = 6;
      fim = 12;
    }

    for (int i = ini; i < fim; i++) {
      int num = 0;
      if (results[i] == 0) {
        num = -1;
      }
      BarChartGroupData br = BarChartGroupData(x: i, barRods: [
        BarChartRodData(
          y: results[i].toDouble(),
          colors: [wasteList[selectMaterial].color],
        )
      ], showingTooltipIndicators: [
        num
      ]);
      list.add(br);
    }
    return list;
  }
}
