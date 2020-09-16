import 'package:flutter/material.dart';
import 'package:recicle_app/widgets/wasteGridWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 0.25 * size.height,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            // borderRadius: BorderRadius.only(
            //     bottomLeft: Radius.circular(40),
            //     bottomRight: Radius.circular(40)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Spacer(),
              //     Text(
              //       'Olá Kadu!',
              //       style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 18,
              //           fontWeight: FontWeight.w500),
              //     ),
              //     Spacer(
              //       flex: 5,
              //     ),
              //     CircleAvatar(
              //       child: Image.asset('assets/img/avatar.png'),
              //       backgroundColor: Colors.white,
              //     ),
              //     Spacer(),
              //   ],
              // ),
              Text(
                'O que você que descartar hoje?',
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
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Caderno',
                      hintStyle: TextStyle(
                        color: Theme.of(context).accentColor.withOpacity(0.5),
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
                    top: -10,
                    right: 10,
                    height: 60,
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
        WasteGrid()
      ],
    );
  }
}
