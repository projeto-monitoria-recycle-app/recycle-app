import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:recycle_app/models/CollectResult.dart';
import 'dart:math';


class BarChartSample2 extends StatefulWidget {
  @override

  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          //mainAxisSize: MainAxisSize.max,
          children: <Widget>[
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
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                    ),
                    maxY: ano2020[0].reduce(max).toDouble(),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (value) => const TextStyle(
                            color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
                        margin: 20,
                        getTitles: (double value) {
                          return meses[value.toInt()];
                        },
                      ),
                      leftTitles: SideTitles(
                        showTitles: false,
                        getTextStyles: (value) => const TextStyle(
                            color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
                        margin: 32,
                        reservedSize: 14,


                      ),
                    ),
                      borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: makeGroupData(ano2020[0]).toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  makeGroupData(List<int> results) {
    List<BarChartGroupData> list = [];
    for(int i =  0; i<12; i++){
      if(results[i]==0){
        continue;
      }
      BarChartGroupData br = BarChartGroupData(
        x: i,

        barRods: [
          BarChartRodData(y:results[i].toDouble(), colors: [Colors.lightBlueAccent, Colors.greenAccent])
        ],
        showingTooltipIndicators: [0]
      );
    list.add(br);
    }
    return list;
  }
}
