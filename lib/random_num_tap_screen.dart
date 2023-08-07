// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:number_selector/widgets/app_button.dart';

class ButtonGrid extends StatefulWidget {
  final int numberOfButtons;
  const ButtonGrid({
    Key? key,
    required this.numberOfButtons,
  }) : super(key: key);
  @override
  State<ButtonGrid> createState() => _ButtonGridState();
}

class _ButtonGridState extends State<ButtonGrid> {
  int enabledButtonIndex = -1;
  List selectedButtons = [];
  int? trueCount;
  @override
  void initState() {
    super.initState();
    selctedButtons();

    enableRandomButton();
  }

  selctedButtons() {
    selectedButtons = List.generate(widget.numberOfButtons, (index) => false);
  }

  void enableRandomButton() async {
    int tempVar = Random().nextInt(widget.numberOfButtons);
    if (selectedButtons[tempVar] == true &&
        !(trueCount == selectedButtons.length - 1)) {
      enableRandomButton();
    } else {
      setState(() {
        enabledButtonIndex = tempVar;
      });
    }
    trueCount = selectedButtons.where((element) => element == true).length;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];
    for (int i = 0; i < widget.numberOfButtons; i++) {
      buttons.add(
        AppButton(
          buttonName: "Button ${i + 1}",
          buttonColor: selectedButtons[i]
              ? Colors.green
              : enabledButtonIndex == i
                  ? Colors.blue
                  : Colors.grey,
          onPress: enabledButtonIndex == i
              ? () {
                  setState(() {
                    selectedButtons[i] = true;
                    enableRandomButton();
                  });
                }
              : null,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Screen 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
        child: Center(
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: buttons,
            ),
          ),
        ),
      ),
    );
  }
}
