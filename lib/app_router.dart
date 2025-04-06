import 'package:example/modules/animals_module/animals_module.dart';
import 'package:go_router/go_router.dart';

import 'modules/fruit_module/fruit_module.dart';
import 'modules/home_module/home_module.dart';

final GoRouter appRoutes = GoRouter(
  initialLocation: '/home',
  routes: [HomeModule.route, FruitModule.route, AnimalsModule.route],
);
