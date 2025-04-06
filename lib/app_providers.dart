import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Esta lista não pode estar vazia, esse Provider é apenas um exemplo.
        Provider<int>(create: (_) => 1),
      ],
      child: child,
    );
  }
}
