import 'package:go_router/go_router.dart';

import 'presentation/fruit_details/fruit_details_page.dart';
import 'presentation/fruit_list_page/fruit_list_page.dart';

class FruitModule {
  static GoRoute get route => GoRoute(
    path: '/fruit',
    name: 'fruit',
    builder: FruitListPage.providerPageBuilder,
    routes: [
      GoRoute(
        path: 'details/:id',
        name: 'fruit-details',
        builder: FruitDetailsPage.providerPageBuilder,
      ),
    ],
  );
}
