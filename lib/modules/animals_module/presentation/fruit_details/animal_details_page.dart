import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../data/animals_repository.dart';
import '../../domain/use_cases/get_animal_by_id_use_case.dart';
import 'cubit/animals_details_cubit.dart';

class AnimalDetailsPage extends StatefulWidget {
  final int animalId;

  static Widget providerPageBuilder(BuildContext context, GoRouterState state) {
    final id = state.pathParameters['id'];
    if (id == null) {
      throw Exception("Animal ID not provided");
    }
    final animalId = int.parse(id);

    return MultiProvider(
      providers: [
        Provider(create: (context) => AnimalsRepository()),
        Provider(
          create:
              (context) => GetAnimalByIdUseCase(
                repository: context.read<AnimalsRepository>(),
              ),
        ),
        BlocProvider(
          create:
              (context) => AnimalsDetailsCubit(
                usecase: context.read<GetAnimalByIdUseCase>(),
              ),
        ),
      ],
      child: AnimalDetailsPage(animalId: animalId),
    );
  }

  const AnimalDetailsPage({super.key, required this.animalId});

  @override
  State<AnimalDetailsPage> createState() => _AnimalDetailsPageState();
}

class _AnimalDetailsPageState extends State<AnimalDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<AnimalsDetailsCubit>().getAnimalsDetails(widget.animalId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimalsDetailsCubit, AnimalsDetailsState>(
      builder: (context, state) {
        PreferredSizeWidget? appBar;
        Widget body;

        if (state is AnimalDetailsError) {
          appBar = AppBar(title: Text("Error"));
          body = Center(child: Text(state.message));
        } else if (state is AnimalDetailsLoaded) {
          appBar = AppBar(title: Text(state.animal.name));
          body = Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(state.animal.description),
          );
        } else {
          appBar = AppBar();
          body = Center(child: CircularProgressIndicator());
        }

        return Scaffold(appBar: appBar, body: body);
      },
    );
  }
}
