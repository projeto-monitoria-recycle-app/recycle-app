import 'dart:core';

class CollectResult{
  final String material;
  final int quantidade;
  final String mes;

  CollectResult(
      this.material,
      this.quantidade,
      this.mes,
      );
}

List<List<Object>> ano2020 = [
  ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov","Dez"],
  [0,0,0,0,0,0,3775,8,3399,3868,3571,2623], //Papel
  [0,0,0,0,0,0,1374,8,1327,2092,2075,1086], //Plastico
  [0,0,0,0,0,0,2167,8,2805,1640,1023,971], //Metal
  [0,0,0,0,0,0,0,8,0,0,15160,0], //Vidro
  [0,0,0,0,0,0,135,8,40,150,150,0], //Oleo
  [0,0,0,0,0,0,3,8,0,26,0,0], //Eletronico
];