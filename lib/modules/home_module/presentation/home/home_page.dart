import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          spacing: 16,
          children: [
            ElevatedButton(
              onPressed: () {
                context.push('/fruit');
              },
              child: const Text('Fruits'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push('/animals');
              },
              child: const Text('Animals'),
            ),
          ],
        ),
      ),
    );
  }
}
