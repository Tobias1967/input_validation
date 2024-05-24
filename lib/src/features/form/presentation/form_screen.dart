import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // GlobalKey für das Formular

  void _trySubmitForm() {
    final isValid = _formKey.currentState?.validate(); // Validiert die Form
    if (isValid == true) {
      // Wenn das Formular gültig ist, hier könnte man weitere Schritte durchführen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formKey, // Verwendung des GlobalKey für die Form
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email-Eingabe",
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validateEmail,
            ),
            const SizedBox(height: 8),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Passwort-Abfrage",
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validatePassword,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed:
                  _trySubmitForm, // Verbindung des Buttons mit der Submit-Funktion
              child: const Text("App-Login"),
            ),
          ]),
        ),
      ),
    );
  }

  String? validateEmail(String? input) {
    if (input == null || input.isEmpty) {
      return "Pflichtfeld";
    } else if (!input.contains('@')) {
      return "Ihre E-Mail muss ein '@' enthalten";
    } else if (!(input.endsWith('.com') || input.endsWith('.de'))) {
      return "Ihre E-Mail muss mit .com oder .de enden";
    } else if (input.length < 6) {
      return "E-Mail muss aus mehr als 6 Zeichen bestehen";
    }
    return null;
  }

  String? validatePassword(String? input) {
    if (input == null || input.isEmpty) {
      return "Pflichtfeld";
    } else if (input.length < 6 || input.length > 12) {
      return "Passwort muss zwischen 6 und 12 Zeichen lang sein";
    }
    return null;
  }
}
