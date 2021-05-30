import 'dart:core';

class CollectResult{
  final double quantidade;
  final String mes;

  CollectResult(
      this.quantidade,
      this.mes,
      );
}
List<String> meses = [
  "Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov","Dez",
];

List<int> indiceMateriais =[
  0,1,2,3,5,8
];

List<String> periodos =[
  "2020-1", "2020-2", "2021-1", "2021-2"
];