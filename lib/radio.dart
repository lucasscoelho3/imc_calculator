import 'package:flutter/material.dart';

enum SelectedSex { masculine, feminine }

class RadioInput extends StatefulWidget {
  final void Function(SelectedSex)? onChanged;

  const RadioInput({Key? key, this.onChanged}) : super(key: key);

  @override
  State<RadioInput> createState() => _RadioInputState();
}

class _RadioInputState extends State<RadioInput> {
  SelectedSex? _sex = SelectedSex.masculine;

  void onChangedRadio(SelectedSex? value) {
    if (value != null) {
      widget.onChanged?.call(value);
    }
    setState(() {
      _sex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Masculino'),
          leading: Radio<SelectedSex>(
            value: SelectedSex.masculine,
            groupValue: _sex,
            onChanged: onChangedRadio,
          ),
        ),
        ListTile(
          title: const Text('Feminino'),
          leading: Radio<SelectedSex>(
            value: SelectedSex.feminine,
            groupValue: _sex,
            onChanged: onChangedRadio,
          ),
        ),
      ],
    );
  }
}
