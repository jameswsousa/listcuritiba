import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField(
      {required this.onChanged, this.initialValue, this.isTitle = true});

  final Function(String) onChanged;
  final bool isTitle;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        decoration: InputDecoration(border: OutlineInputBorder()),
      );
    });
  }
}
