import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {

  final Icon iconOn;
  final Icon iconOff;
  final Future<bool> Function() onTurnOn;
  final Future<bool> Function() onTurnOff;
  final bool initialButtonState;

  ToggleButton({Key key, this.iconOn, this.iconOff, this.onTurnOn, this.onTurnOff, this.initialButtonState}) : super(key: key);

  @override
  _ToggleButtonState createState() => _ToggleButtonState(initialButtonState: initialButtonState);
}

class _ToggleButtonState extends State<ToggleButton> {
  bool _on = false;

  _ToggleButtonState({bool initialButtonState}){
    if(initialButtonState != null){
      _on = initialButtonState;
    }
  }

  @override
  Widget build(BuildContext context) {

    return IconButton(
      icon: _chooseIcon(),
      onPressed: _toggle,
    );
  }

  void _toggle() {
    final Future<bool> Function() action = this._on ? widget.onTurnOff : widget.onTurnOn;
    if(action != null){
      action().then((confirmed){
        if(confirmed) {
          _toggleButtonState();
        }
      });
    } else {
      _toggleButtonState();
    }
   
  }

  void _toggleButtonState() {
    setState(() {
      this._on = !this._on;
    });
  }
  
  Icon _chooseIcon() {
    return this._on ? widget.iconOn : widget.iconOff;
  }
}