import 'package:flutter/material.dart';

import 'package:chat/pages/pages.dart';

final Map<String, Widget Function( BuildContext )> appRoutes = {
  'usuarios': (_) => UsuariosPage(),
  'char'    : (_) => ChatPage(),
  'login'   : (_) => LoginPage(),
  'register': (_) => RegisterPage(),
  'loading' : (_) => LoadingPage(),
};