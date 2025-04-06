import 'package:example/modules/home_module/presentation/home/home_page.dart';
import 'package:go_router/go_router.dart';

class HomeModule {
  static GoRoute get route => GoRoute(
    path: '/home',
    name: 'home',
    builder: (context, state) => const HomePage(),
    routes: [],
  );
}
