import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'listas/listas.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Taller dia 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Contenido(title: 'Flutter taller dia 2'),
    );
  }
}

class Contenido extends StatelessWidget {
  final String title;

  const Contenido({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter taller 2'),
      ),
      body: ContenidoDinamico(),
      drawer: Drawer(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                  'https://miro.medium.com/max/2560/1*vgN2zojqiIYu23JPVuaSiA.jpeg'),
              Text('menu lateral', style: TextStyle(fontSize: 40),),
              RaisedButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Listas())),
                child: Text('Lista'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ContenidoDinamico extends StatefulWidget {
  @override
  _ContenidoDinamicoState createState() => _ContenidoDinamicoState();
}

class _ContenidoDinamicoState extends State<ContenidoDinamico> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _valor1 = TextEditingController();
  TextEditingController _valor2 = TextEditingController();
  TextEditingController _crearQr = TextEditingController();

  int _resultadoSuma;
  String _imagen;

  void sumaValores() {
    setState(() {
      _resultadoSuma = int.parse(_valor1.text) + int.parse(_valor2.text);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _resultadoSuma = 0;
    _imagen = '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              //valor1
              TextFormField(
                controller: _valor1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Valor 1'),
                validator: (valor) {
                  if (valor.isEmpty) {
                    return 'El campo esta vacio';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _valor2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'valor2'),
                validator: (valor) {
                  if (valor.isEmpty) {
                    return 'El campo esta vacio';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _crearQr,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Qr'),
                validator: (valor) {
                  if (valor.isEmpty) {
                    return 'El campo esta vacio';
                  }
                  return null;
                },
              ),
              Text(
                _resultadoSuma.toString(),
                style: TextStyle(fontSize: 60),
              ),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    print('ejecuto');
                    sumaValores();
                  }
                },
                child: Text('Sumar valores'),
              ),
              RaisedButton(onPressed: (){
                setState(() {
                  _imagen = _crearQr.text;
                });
              }, child: Text('Leer Qr'),),
              Text('Qr texto $_imagen'),
              Container(
                child: QrImage(
                  data: _imagen,
                  foregroundColor: Color(0xff03291c),
                  size: 200,
                  gapless: false,
                  embeddedImageStyle: QrEmbeddedImageStyle(
                    size: Size(80, 80),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
