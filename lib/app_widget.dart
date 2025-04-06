import 'package:example/app_router.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRoutes,
      title: 'Modular Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
