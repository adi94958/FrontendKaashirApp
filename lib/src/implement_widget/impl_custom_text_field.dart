import 'package:flutter/material.dart';
import 'package:fe_kaashir/src/view/widgets/custom_text_field.dart';

class ImplCustomTextField extends StatefulWidget {
  @override
  _ImplCustomTextFieldState createState() => _ImplCustomTextFieldState();
}

class _ImplCustomTextFieldState extends State<ImplCustomTextField> {
  final _formKey = GlobalKey<FormState>(); // Kunci untuk form
  String username = '';
  String email = '';
  String password = '';
  String number = '';
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Demo Custom Text Field"),
      ),
      body: Form(
        key: _formKey, // Mengaitkan kunci form
        child: Column(
          children: [
            CustomTextField(
              labelText: 'Enter your username',
              inputType: TextInputType.text,
              onChanged: (value) {
                setState(() {
                  username = value ?? '';
                });
              },
            ),
            CustomTextField(
              labelText: 'Enter your email',
              inputType: TextInputType.emailAddress,
              onChanged: (value) {
                setState(() {
                  email = value ?? '';
                });
              },
            ),
            CustomTextField(
              labelText: 'Enter your password',
              inputType: TextInputType.text,
              isPassword: true,
              onChanged: (value) {
                setState(() {
                  password = value ?? '';
                });
              },
            ),
            CustomTextField(
              labelText: 'Enter your number',
              inputType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  number = value ?? '';
                });
              },
            ),
            CustomTextField(
              labelText: 'Select an option',
              inputType: TextInputType.datetime,
              dropdownItems: ['Option 1', 'Option 2', 'Option 3'],
              selectedValue: selectedOption,
              onDropdownChanged: (value) {
                setState(() {
                  selectedOption = value; // This can be null
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Tampilkan hasil input jika valid
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Input Values'),
                        content: Text(
                          'Username: $username\nEmail: $email\nPassword: $password\nNumber: $number\nSelected Option: $selectedOption',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
