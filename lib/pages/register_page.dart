import 'package:flutter/material.dart';
import 'package:chat/widgets/widgets.dart';

class RegisterPage extends StatelessWidget {

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
                
                Logo( titulo: 'Registro' ),
        
                _Form(),
        
                Labels( 
                  ruta: 'login', 
                  titulo: '¿Ya tienes una cuenta?', 
                  subtitulo: 'Ingresa ahora!' 
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
  
  final nameCtrl  = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl  = TextEditingController();

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only( top: 40 ),
      padding: const EdgeInsets.symmetric( horizontal: 50 ),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Nombre',
            keyboardType: TextInputType.text,
            textController: nameCtrl,
          ),      

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
            onPressed: (){
              print( emailCtrl.text );
              print( passCtrl.text);
            }
          ),
        ],
      ),
    );
  }
}
