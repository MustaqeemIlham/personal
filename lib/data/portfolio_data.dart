import 'package:flutter/foundation.dart';
import 'models/project_model.dart';

final List<Project> projects = [
  const Project(
    title: 'Vegetable Crop Type Recommendation',
    technologies: 'Flutter • Python • Scikit-Learn • Flask',
    description: 'Hybrid mobile + ML backend for crop type recommendation and price prediction.',
    achievement: 'R² 94.23% · Accuracy 95.67%',
  ),
  const Project(
    title: 'IoT Flood Awareness System',
    technologies: 'Raspberry Pi • MQTT • Flutter • Firebase',
    description: 'Prototype for real-time water-level monitoring and early warning.',
    achievement: 'Deployed prototype in local community',
  ),
  const Project(
    title: 'Retail Price Optimization',
    technologies: 'Python • Genetic Algorithm • Regression',
    description: 'Optimization model combining regression with genetic algorithms for pricing.',
    achievement: 'Found near-optimal pricing strategies',
  ),
  const Project(
    title: 'Techworldwide E-Commerce',
    technologies: 'HTML • CSS • PHP • JS • MySQL',
    description: 'Group full-stack e-commerce website with product management and checkout.',
    achievement: 'Collaborative full-stack project',
  ),
];
