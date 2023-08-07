import 'package:flutter/material.dart';
import 'package:number_selector/random_picker_screen.dart';
import 'package:number_selector/random_num_tap_screen.dart';

class NumSelectionScreen extends StatefulWidget {
  const NumSelectionScreen({super.key});

  @override
  State<NumSelectionScreen> createState() => _NumSelectionScreenState();
}

class _NumSelectionScreenState extends State<NumSelectionScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int? enteredNumber;
  final TextEditingController controller = TextEditingController();
  String? errorText;
  String? validateInput(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter a number.';
    }

    int? value;
    try {
      value = int.parse(input);
    } catch (e) {
      return 'Please enter a valid number.';
    }

    if (value < 0) {
      return 'Please enter a non-negative number.';
    } else if (value >= 25) {
      return 'Value must be less then 25.';
    }

    return null;
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      int inputValue = int.parse(controller.text);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ButtonGrid(
                    numberOfButtons: inputValue,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  enableInteractiveSelection: true,
                  controller: controller,
                  validator: validateInput,
                  autovalidateMode: AutovalidateMode.always,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.cyan),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.cyan),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    labelText: 'Enter a number below 25',
                    errorText: errorText,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  submitForm();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('Submit',style: TextStyle(fontSize: 16),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
