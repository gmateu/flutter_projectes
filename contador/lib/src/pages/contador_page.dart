import 'package:flutter/material.dart';


class ContadorPage extends StatefulWidget{
  
  @override
  createState() => _ContadorPageState();

}

class _ContadorPageState extends State<ContadorPage>{

  final _estiloTexto = new TextStyle(fontSize: 25);
  int _conteo=0;
  
  @override 
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Títol'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Número de clicks:', style: _estiloTexto),
          Text('$_conteo', style: _estiloTexto),
        ],
      )),
      floatingActionButton:_crearBotones()
      //floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  Widget _crearBotones(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30),
        FloatingActionButton(child:Icon(Icons.exposure_zero), onPressed:_reset),
        Expanded(child: SizedBox()),
        FloatingActionButton(child:Icon(Icons.remove), onPressed:_resta),
        SizedBox(width: 5),
        FloatingActionButton(child:Icon(Icons.add), onPressed:_suma,),
      ]
    );
  
  }
  
  void _suma(){ setState(()=> _conteo++);}
  void _resta(){ 
    if (_conteo>=1){
      setState(()=> _conteo--);
    }
  }
  void _reset(){ setState(()=> _conteo=0);}
}