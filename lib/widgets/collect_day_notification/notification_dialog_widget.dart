import 'package:flutter/material.dart';

import 'confirmation_dialog_widget.dart';

class NotificationActivationDialog extends StatelessWidget {
  final Function() onConfirm;
  final Function() onDeny;

  const NotificationActivationDialog({Key key, this.onConfirm, this.onDeny})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConfirmationDialog(
      title: Text(
        'Deseja receber lembretes sobre o dia de coleta dessa rota?',
        style: Theme.of(context).textTheme.headline2,
      ),
      children: [
        Text(
            'Ao confirmar, você receberá notificações um dia antes do caminhão de coleta seletiva passar por este local.',
            style: Theme.of(context).textTheme.bodyText1)
      ],
      confirmationButton: Text(
        "Sim",
        style: TextStyle(
          color: Theme.of(context).accentColor,
        ),
      ),
      onConfirm: onConfirm,
      denyButton: Text(
        "Não",
        style: TextStyle(
          color: Colors.red,
        ),
      ),
      onDeny: onDeny,
    );
  }
}

class NotificationDeactivationDialog extends StatelessWidget {
  final Function() onConfirm;
  final Function() onDeny;

  const NotificationDeactivationDialog({Key key, this.onConfirm, this.onDeny})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ConfirmationDialog(
      title: Text(
        'Deseja desativar as notificações sobre o caminhão de coleta nessa rota?',
        style: Theme.of(context).textTheme.headline2,
      ),
      children: [
        Text(
          'Ao confirmar, você não receberá mais notificações um dia antes do caminhão de coleta seletiva passar por este local.',
          style: Theme.of(context).textTheme.bodyText1,
        )
      ],
      confirmationButton: Text(
        "Desativar",
        style: TextStyle(
          color: Theme.of(context).accentColor,
        ),
      ),
      onConfirm: onConfirm,
      denyButton: Text(
        "Não",
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      onDeny: onDeny,
    );
  }
}
