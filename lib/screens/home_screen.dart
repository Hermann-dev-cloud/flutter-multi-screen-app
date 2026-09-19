import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Services'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bienvenue sur Campus Services',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            const Text(
              'Trouvez facilement les services dont vous avez besoin.',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            ElevatedButton(
               onPressed: () {
                  context.go('/services');
                },
             child: const Text('Voir les services'),
           ),
          ],
        ),
      ),
    );
  }
}