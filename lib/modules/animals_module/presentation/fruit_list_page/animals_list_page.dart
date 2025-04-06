import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../data/animals_repository.dart';
import '../../domain/use_cases/get_all_animals_use_case.dart';
import 'cubit/animal_list_cubit.dart';

class AnimalsListPage extends StatefulWidget {
  static Widget providerPageBuilder(BuildContext context, GoRouterState state) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => AnimalsRepository()),
        Provider(
          create:
              (context) => GetAllAnimalsUseCase(
                repository: context.read<AnimalsRepository>(),
              ),
        ),
        BlocProvider(
          create:
              (context) => AnimalListCubit(
                usecase: context.read<GetAllAnimalsUseCase>(),
              ),
        ),
      ],
      child: const AnimalsListPage(),
    );
  }

  const AnimalsListPage({super.key});

  @override
  State<AnimalsListPage> createState() => _AnimalsListPageState();
}

class _AnimalsListPageState extends State<AnimalsListPage> {
  @override
  void initState() {
    context.read<AnimalListCubit>().getAllAnimals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animais')),
      body: BlocBuilder<AnimalListCubit, AnimalListState>(
        builder: (context, state) {
          if (state is AnimalLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AnimalLoaded) {
            return ListView.builder(
              itemCount: state.animals.length,
              itemBuilder: (_, i) {
                final animal = state.animals[i];
                return ListTile(
                  title: Text(animal.name),
                  subtitle: Text(animal.description),
                  onTap: () {
                    context.pushNamed(
                      'animals-details',
                      pathParameters: {'id': animal.id.toString()},
                    );
                  },
                );
              },
            );
          } else if (state is AnimalError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Clique para carregar animais'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<AnimalListCubit>().getAllAnimals(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
