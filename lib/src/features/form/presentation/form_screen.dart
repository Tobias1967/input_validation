import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  // Konstruktor
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  // Methoden
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          child: Column(children: [
            TextFormField(
              /////////////////////////  Passwortfeld ////////////
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
              onPressed: () {},
              child: const Text("App-Login"),
            ),
          ]),
        ),
      ),
    );
  }

  // E-Mail-Validierung
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

  // Passwort-Validierung
  String? validatePassword(String? input) {
    if (input == null || input.isEmpty) {
      return "Pflichtfeld";
    } else if (input.length < 6 || input.length > 12) {
      return "Passwort muss zwischen 6 und 12 Zeichen lang sein";
    }
    return null;
  }
}
