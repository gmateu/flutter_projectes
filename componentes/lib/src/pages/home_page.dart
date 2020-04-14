
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> sanpshot){

        print(sanpshot.data);

        return ListView(
          children: _listaItems(sanpshot.data),
        );
      },
    );

  }

  List<Widget> _listaItems(List<dynamic> data) {
    
    final List<Widget> opciones=[];

    data.forEach((opt){
      final widgetTemp=ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right,color:Colors.blue),
        onTap: (){},
      );

      opciones..add(widgetTemp)
              ..add(Divider());
    });

    return opciones;


  }
}