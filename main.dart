import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Persona> _personas = [
    Persona("Sara", "lopez", "976543210"),
    Persona("David", "gonzalez", "222222222"),
    Persona("Jose", "perez", "555555555"),
    Persona("Santiago", "sanchez", "111111111"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: ListView.builder(
              itemCount: _personas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onLongPress: () {
                    this._borrarPersona(context, _personas[index]);
                  },
                  title: Text(
                      _personas[index].name + " " + _personas[index].lastname),
                  subtitle: Text(_personas[index].phone),
                  leading: CircleAvatar(
                    child: Text(_personas[index].name.substring(0, 1)),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                );
              })),
    );
  }

  _borrarPersona(context, Persona persona) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar Contacto"),
              content:
                  Text("¿Estas seguro de que quiere eliminar un contacto?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancelar")),
                TextButton(
                    onPressed: () {
                      print(persona.name);
                      this._personas.remove(persona);
                      setState(() {});
                      Navigator.pop(context);
                    },
                    child: Text("Borrar"))
              ],
            ));
  }
}

class Persona {
  late String name;
  late String lastname;
  late String phone;

  Persona(String name, String lastname, String phone) {
    this.name = name;
    this.lastname = lastname;
    this.phone = phone;
  }
}
