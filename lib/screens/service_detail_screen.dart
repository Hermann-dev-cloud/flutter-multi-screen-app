import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/services_data.dart';
import '../models/service_model.dart';

class ServiceDetailScreen extends StatelessWidget {
  final String serviceId;

  const ServiceDetailScreen({
    super.key,
    required this.serviceId,
  });

  ServiceModel? get service {
    for (final item in services) {
      if (item.id == serviceId) {
        return item;
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final currentService = service;

    if (currentService == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Service'),
        ),
        body: const Center(
          child: Text('Service introuvable.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(currentService.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context)
                        .colorScheme
                        .primaryContainer,
                  ),
                  child: const Icon(
                    Icons.miscellaneous_services,
                    size: 80,
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Chip(
                    label: Text(currentService.category),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              currentService.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            Text(
              currentService.category,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            Text(
              currentService.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  context.push('/request');
                },
                icon: const Icon(Icons.send),
                label: const Text('Faire une demande'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}