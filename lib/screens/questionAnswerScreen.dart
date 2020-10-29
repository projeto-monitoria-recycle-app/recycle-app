import 'package:flutter/material.dart';

import '../models/questionAnswerModel.dart';

class QuestionAnswerScreen extends StatelessWidget {
  static const routeName = '/question';

  @override
  Widget build(BuildContext context) {
    final QuestionAnswer question = ModalRoute.of(context).settings.arguments;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text('Recicle Terê'),
        toolbarHeight: 60,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                question.question,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              SizedBox(
                height: 20,
              ),
              for (String sentence in question.answer)
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    sentence,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    question.images.length,
                    (index) {
                      return InkWell(
                        child: Card(
                          child: Container(
                            width: size.width * 0.4,
                            height: 100,
                            color: Colors.grey,
                            child: Image.asset(
                              question.images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, "/photo",
                              arguments: question.images[index]);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
