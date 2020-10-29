import 'package:flutter/material.dart';

class ImpactScreen extends StatelessWidget {
  static const routeName = '/impact';

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
                title: Text('Impactos'),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                pinned: true,
                backgroundColor: Theme.of(context).accentColor,
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Reciclando, você ajuda a:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Manter a cidade mais limpa'),
                          ImageIcon(
                            AssetImage('assets/icons/limpeza.png'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Não poluir os solos e os rios'),
                          ImageIcon(
                            AssetImage('assets/icons/solo.png'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Preservar os recursos naturais'),
                          ImageIcon(
                            AssetImage('assets/icons/sustentabilidade.png'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Gerar novos empregos'),
                          ImageIcon(
                            AssetImage('assets/icons/crescimento.png'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Parabéns!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.8,
                      child: Image(
                        image: AssetImage(
                          'assets/img/World-bro.png',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
