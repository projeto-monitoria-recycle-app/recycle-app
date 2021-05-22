
import 'package:flutter/material.dart';

import 'confirmationDialogWidget.dart';

class NotificationActivationDialog extends StatelessWidget {
  final Function() onConfirm;
  final Function() onDeny;

  const NotificationActivationDialog({Key key, this.onConfirm, this.onDeny}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConfirmationDialog(
      title: Text(
          'Deseja receber lembretes sobre o dia de coleta dessa rota?'),
      children: [
        Text(
            'Ao confirmar, você receberá notificações um dia antes do caminhão de coleta seletiva passar por este local.')
      ],
      confirmationButton: Text("Sim"),
      onConfirm: onConfirm,
      denyButton: Text("Não"),
      onDeny: onDeny,
    );
  }
}

class NotificationDeactivationDialog extends StatelessWidget {
  final Function() onConfirm;
  final Function() onDeny;

  const NotificationDeactivationDialog({Key key, this.onConfirm, this.onDeny}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ConfirmationDialog(
      title: Text(
          'Deseja desativar as notificações sobre o caminhão de coleta nessa rota?'),
      children: [
        Text(
            'Ao confirmar, você não receberá mais notificações um dia antes do caminhão de coleta seletiva passar por este local.')
      ],
      confirmationButton: Text("Sim"),
      onConfirm: onConfirm,
      denyButton: Text("Não"),
      onDeny: onDeny,
    );
  }
}