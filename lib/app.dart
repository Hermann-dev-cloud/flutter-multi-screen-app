import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/home_screen.dart';
import 'screens/request_screen.dart';
import 'screens/service_detail_screen.dart';
import 'screens/services_screen.dart';
import 'theme/app_theme.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/services',
      name: 'services',
      builder: (context, state) => const ServicesScreen(),
    ),

    GoRoute(
      path: '/services/:id',
      name: 'service-detail',
      builder: (context, state) {
        final serviceId = state.pathParameters['id']!;

        return ServiceDetailScreen(
          serviceId: serviceId,
        );
      },
    ),

    GoRoute(
      path: '/request',
      name: 'request',
      builder: (context, state) => const RequestScreen(),
    ),
  ],
);

class CampusServicesApp extends StatelessWidget {
  const CampusServicesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Campus Services',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
    );
  }
}