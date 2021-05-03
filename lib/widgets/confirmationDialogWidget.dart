import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {

  final Widget title;
  final List<Widget> children;
  final Widget confirmationButton;
  final Widget denyButton;

  ConfirmationDialog(
      {this.title, this.children, this.confirmationButton, this.denyButton});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: this.title,
      content: SingleChildScrollView(
        child: ListBody(
          children: this.children,
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: this.denyButton,
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: this.confirmationButton,
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}

