import 'package:flutter/material.dart';

import '../data/services_data.dart';
import '../models/service_model.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/search_bar.dart';
import '../widgets/service_card.dart';



class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  String searchQuery = '';
  String selectedCategory = 'Toutes';

  List<String> get categories {
    final categories = services
        .map((service) => service.category)
        .toSet()
        .toList();

    return ['Toutes', ...categories];
  }

  List<ServiceModel> get filteredServices {
    return services.where((service) {
      final matchesSearch = service.title.toLowerCase().contains(
            searchQuery.toLowerCase(),
          );

      final matchesCategory = selectedCategory == 'Toutes' ||
          service.category == selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
 
    final crossAxisCount = screenWidth >= 900
      ? 3
      : screenWidth >= 600
        ? 2
        : 1;
    return Scaffold(
     appBar: const CustomAppBar(
        title: 'Nos services',
        ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
           SearchBarWidget(
             onChanged: (value) {
              setState(() {
                  searchQuery = value;
                });
               },
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              initialValue: selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Catégorie',
                border: OutlineInputBorder(),
              ),
              items: categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                if (value == null) {
                  return;
                }

                setState(() {
                  selectedCategory = value;
                });
              },
            ),

            const SizedBox(height: 16),

            Expanded(
              child: filteredServices.isEmpty
                 ? const Center(
               child: Text(
                 'Aucun service trouvé.',
              ),
               )
             : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.8,
            ),
            itemCount: filteredServices.length,
            itemBuilder: (context, index) {
            final service = filteredServices[index];

            return ServiceCard(
              service: service,
              );
            },
            ),
          ),
          ],
        ),
      ),
    );
  }
}