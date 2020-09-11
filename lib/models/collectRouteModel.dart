import 'package:flutter/material.dart';

class CollectRoute {
  final String name;
  final TimeOfDay hour;
  final String dayOfWeek;
  final String district;
  final List<double> route;

  CollectRoute(
    this.name,
    this.hour,
    this.dayOfWeek,
    this.district, {
    this.route,
  });
}

List<CollectRoute> collectRouteList = [
  CollectRoute(
    "Vale do Paraíso 1",
    TimeOfDay(hour: 15, minute: 30),
    "Monday",
    "Vale do Paraíso",
  )
];
