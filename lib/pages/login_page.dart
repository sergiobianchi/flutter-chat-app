
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat/helpers/mostrar_alerta.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/widgets/widgets.dart';


class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Logo( titulo: 'Messenger' ),
        
                _Form(),
        
                Labels( 
                  ruta: 'register', 
                  titulo: '¿No tienes cuenta?', 
                  subtitulo: 'Crea una ahora!' 
                ),
        
                const Text( 'Terminos y condiciones de uso', style: TextStyle( fontWeight: FontWeight.w200 )),
                
              ],
            ),
          ),
        ),
      )
    );
  }
}


class _Form extends StatefulWidget {
  
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>( context ); 

    return Container(
      margin: const EdgeInsets.only( top: 40 ),
      padding: const EdgeInsets.symmetric( horizontal: 50 ),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),          
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textController: passCtrl,
            isPassword: true,
          ),          

          BotonAzul( 
            text: 'Ingrese', 
            onPressed: authService.autenticando ? null : () async {          

              FocusScope.of( context ).unfocus();

              final loginOK = await authService.login( emailCtrl.text.trim(), passCtrl.text.trim() );

              if ( loginOK ) {
                // Conectar a nuestro socket server

                // Navegar a otra pantalla
                Navigator.pushReplacementNamed( context, 'usuarios' );
                
              } else {
                // Mostrar alerta
                // ignore: use_build_context_synchronously
                mostrarAlerta(context, 'Login incorrecto', 'Revise sus credenciales nuevamentre' );
              }
            }
          ),
        ],
      ),
    );
  }
}
