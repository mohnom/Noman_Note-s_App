import 'package:flutter/material.dart';

import 'Router_app.dart';

void main() {
  runApp(Noman_note());
 
}

class Noman_note extends StatelessWidget {
  const Noman_note({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouterApp.router,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
     debugShowCheckedModeBanner: false,
    );
  }
}
