import 'package:flutter/foundation.dart';

enum DayOfWeek{
  sunday, monday, tuesday, wednesday, thursday, friday, saturday

}

extension DayOfWeekExtension on DayOfWeek{
  String get value => describeEnum(this);

  static final Map<DayOfWeek, String> _ptBrValues = {
    DayOfWeek.sunday: "Domingo",
    DayOfWeek.monday: "Segunda-Feira",
    DayOfWeek.tuesday: "Terça-Feira",
    DayOfWeek.wednesday: "Quarta-Feira",
    DayOfWeek.thursday: "Quinta-Feira",
    DayOfWeek.friday: "Sexta-Feira",
    DayOfWeek.saturday: "Sábado"
  };

  static final Map<DayOfWeek, int> _intValues = {
    DayOfWeek.sunday: DateTime.sunday,
    DayOfWeek.monday: DateTime.monday,
    DayOfWeek.tuesday: DateTime.tuesday,
    DayOfWeek.wednesday: DateTime.wednesday,
    DayOfWeek.thursday: DateTime.thursday,
    DayOfWeek.friday: DateTime.friday,
    DayOfWeek.saturday: DateTime.saturday
  };




  int get intValue{
    return _intValues[this];
  }

  String get ptBrValue {
    return _ptBrValues[this];
  }
}