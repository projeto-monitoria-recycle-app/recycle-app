
import 'package:flutter/material.dart';

import 'confirmationDialogWidget.dart';

class NotificationActivationDialog extends StatelessWidget {
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
      denyButton: Text("Não"),
    );
  }
}

class NotificationDeactivationDialog extends StatelessWidget {
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
      denyButton: Text("Não"),
    );
  }
}