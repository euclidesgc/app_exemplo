import 'package:go_router/go_router.dart';

import 'presentation/fruit_details/animal_details_page.dart';
import 'presentation/fruit_list_page/animals_list_page.dart';

class AnimalsModule {
  static GoRoute get route => GoRoute(
    path: '/animals',
    name: 'animals',
    builder: AnimalsListPage.providerPageBuilder,
    routes: [
      GoRoute(
        path: 'animals/:id',
        name: 'animals-details',
        builder: AnimalDetailsPage.providerPageBuilder,
      ),
    ],
  );
}
