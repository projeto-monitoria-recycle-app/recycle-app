import 'package:flutter/material.dart';
import '../models/questionAnswerModel.dart';

class QuestionAnswerScreen extends StatelessWidget {
  static const routeName = '/question';

  @override
  Widget build(BuildContext context) {
    final QuestionAnswer question = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text('Recycle App'),
      ),
      body: Padding(
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
