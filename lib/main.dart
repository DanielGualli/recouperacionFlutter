import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String? _selectedSex;
  bool _isChecked = false;

  List<String> _sexOptions = ['Masculino', 'Femenino', 'Otro'];

  void _showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alerta'),
          content: Column(
            children: [
              Text('¡Checkbox marcado!'),
              SizedBox(height: 10),
              Image.network(
                'https://picsum.photos/200/300?grayscale', // Reemplaza con la URL de tu imagen
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Nombre',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Apellido',
              ),
            ),
            SizedBox(height: 10),
            Text('Sexo:'),
            Column(
              children: _sexOptions.map((option) {
                return ListTile(
                  title: Text(option),
                  leading: Radio(
                    value: option,
                    groupValue: _selectedSex,
                    onChanged: (value) {
                      setState(() {
                        _selectedSex = value as String?;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                      if (_isChecked) {
                        _showAlert();
                      }
                    });
                  },
                ),
                Text('Acepto los términos y condiciones'),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Registrarse'),
              onPressed: () {
                // Acción al hacer clic en el botón de registro
              },
            ),
          ],
        ),
      ),
    );
  }
}
