import 'package:flutter/material.dart';

class PhotoView extends StatelessWidget {
  static const routeName = '/photo';

  @override
  Widget build(BuildContext context) {
    final String image = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        color: Colors.black.withOpacity(0.9),
        height: 2000,
        width: 2000,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              child: Image.asset(image, fit: BoxFit.contain),
            ),
            Positioned(
              top: 50,
              left: 20,
              child: InkWell(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).accentColor,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
