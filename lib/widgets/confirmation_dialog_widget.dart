import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {

  final Widget title;
  final List<Widget> children;
  final Widget confirmationButton;
  final Widget denyButton;
  final Function() onConfirm;
  final Function() onDeny;
  ConfirmationDialog(
      {this.title, this.children, this.confirmationButton, this.denyButton, this.onConfirm, this.onDeny});

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
          onPressed: () async {
            if(onDeny != null) {
              await Future(onDeny);
            }
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: this.confirmationButton,
          onPressed: () async {
            if(onConfirm != null){
              await Future(onConfirm);
            }
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}

