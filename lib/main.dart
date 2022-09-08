import 'package:flutter/material.dart';
import 'package:imc_calculator/input.dart';
import 'package:imc_calculator/radio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double imc = 0;
  var age = "";
  var weight = "";
  var height = "";
  SelectedSex sex = SelectedSex.masculine;

  @override
  Widget build(BuildContext context) {
    Widget informationText = Container(
      padding: const EdgeInsets.only(top: 32, left: 24),
      child: const Text(
        'Coloque os dados abaixo e calcule seu IMC',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black87,
        ),
      ),
    );

    Widget ageField = Input(
      label: 'Idade (anos)',
      onChanged: ((value) {
        setState(() {
          age = value;
        });
      }),
    );

    Widget weightField = Input(
      label: 'Peso (kg)',
      onChanged: ((value) {
        setState(() {
          weight = value;
        });
      }),
    );

    Widget heightField = Input(
      label: 'Altura (cm)',
      onChanged: ((value) {
        setState(() {
          height = value;
        });
      }),
    );

    void calculateImc() {
      double weightValue = double.parse(weight);
      double heightValue = double.parse(height);

      setState(() {
        imc = weightValue / (heightValue / 100 * heightValue / 100);
      });
      // ignore: avoid_print
      print('Calculating IMC...');
      // ignore: avoid_print
      print(sex);
    }

    var calculateButton = Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: ElevatedButton(
        onPressed: calculateImc,
        child: const Text('Calcular'),
      ),
    );

    var imcResult = Center(
      child: Text('Seu IMC é: $imc'),
    );

    Widget dividingLine = const Divider(
      height: 32,
      indent: 24,
      endIndent: 24,
      color: Colors.grey,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMC Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora de IMC'),
        ),
        body: ListView(
          children: [
            informationText,
            dividingLine,
            RadioInput(
              onChanged: ((value) {
                setState(() {
                  sex = value;
                });
              }),
            ),
            ageField,
            weightField,
            heightField,
            dividingLine,
            calculateButton,
            const SizedBox(height: 64),
            if (imc != 0) imcResult,
          ],
        ),
      ),
    );
  }

  void imcScreen() {
    Navigator.of(context);
  }
}
