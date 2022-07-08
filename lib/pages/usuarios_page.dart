// ignore_for_file: prefer_final_fields

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:chat/models/usuario.dart';

class UsuariosPage extends StatefulWidget {

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  final usuarios = [
    Usuario( uid: '1', nombre: 'Maria', email: 'test1@test.com', online: true ),
    Usuario( uid: '2', nombre: 'Melissa', email: 'test2@test.com', online: false ),
    Usuario( uid: '3', nombre: 'Fernando', email: 'tes31@test.com', online: true ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Nombre', style: TextStyle( color: Colors.black54 )),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){}, 
          icon: const Icon( Icons.exit_to_app, color: Colors.black54 )
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only( right: 10 ),
            child: Icon( Icons.check_circle, color: Colors.blue[400] ),
            // child: const Icon( Icons.offline_bolt, color: Colors.red ),
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _cargarUsuarios,
        header: WaterDropHeader(
          complete: Icon( Icons.check, color: Colors.blue[400] ),
          waterDropColor: Colors.blue
          ),
        child: _listViewUsuarios(),
      ), 
   );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (_, i) => _usuarioListTile( usuarios[i] ),
      separatorBuilder: (_, i) => Divider(), 
      itemCount: usuarios.length
    );
  }

  ListTile _usuarioListTile( Usuario usuario ) {
    return ListTile(
        title: Text( usuario.nombre ),
        subtitle: Text( usuario.email ),
        leading: CircleAvatar(          
          backgroundColor: Colors.blue[200],
          child: Text( usuario.nombre.substring(0,2)),
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: usuario.online ? Colors.green[300] : Colors.red,
            borderRadius: BorderRadius.circular(100)
          )),
        );
  }

  _cargarUsuarios() async{
    
    await Future.delayed( const Duration(milliseconds: 1000) );
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}