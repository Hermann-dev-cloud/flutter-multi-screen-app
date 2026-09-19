# Campus Services

Application Flutter multi-écrans permettant aux étudiants d'accéder facilement à différents services universitaires, administratifs et numériques.

## 📱 Présentation

Campus Services est une application mobile développée avec Flutter.

Elle permet à l'utilisateur de :

- consulter les services disponibles ;
- rechercher un service ;
- filtrer les services par catégorie ;
- consulter les détails d'un service ;
- transmettre une demande à travers un formulaire ;
- bénéficier d'une interface adaptée aux différentes tailles d'écran ;
- utiliser automatiquement le thème clair ou sombre du système.

## 🎯 Objectifs du projet

Ce projet a été réalisé dans le cadre d'un exercice Flutter portant sur :

- la navigation entre plusieurs écrans ;
- l'utilisation de GoRouter ;
- la séparation des données et de l'interface ;
- la création de widgets réutilisables ;
- la recherche et le filtrage ;
- le passage de paramètres entre les écrans ;
- la validation de formulaires ;
- la gestion des thèmes ;
- la conception responsive.

## 🛠️ Technologies utilisées

- Flutter
- Dart
- GoRouter
- Material 3
- Git
- GitHub

## 📂 Architecture du projet

```text
lib/
├── main.dart
├── app.dart
│
├── models/
│   └── service_model.dart
│
├── data/
│   └── services_data.dart
│
├── screens/
│   ├── home_screen.dart
│   ├── services_screen.dart
│   ├── service_detail_screen.dart
│   └── request_screen.dart
│
├── widgets/
│   ├── service_card.dart
│   ├── search_bar.dart
│   └── custom_app_bar.dart
│
└── theme/
    └── app_theme.dart