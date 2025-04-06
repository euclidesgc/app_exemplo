import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../data/fruit_repository.dart';
import '../../domain/use_cases/get_all_fruits_use_case.dart';
import 'cubit/fruit_list_cubit.dart';

class FruitListPage extends StatefulWidget {
  static Widget providerPageBuilder(BuildContext context, GoRouterState state) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => FruitRepository()),
        Provider(
          create:
              (context) => GetAllFruitsUseCase(
                repository: context.read<FruitRepository>(),
              ),
        ),
        BlocProvider(
          create:
              (context) =>
                  FruitListCubit(usecase: context.read<GetAllFruitsUseCase>()),
        ),
      ],
      child: const FruitListPage(),
    );
  }

  const FruitListPage({super.key});

  @override
  State<FruitListPage> createState() => _FruitListPageState();
}

class _FruitListPageState extends State<FruitListPage> {
  @override
  void initState() {
    context.read<FruitListCubit>().getAllFruits();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Frutas')),
      body: BlocBuilder<FruitListCubit, FruitListState>(
        builder: (context, state) {
          if (state is FruitLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FruitLoaded) {
            return ListView.builder(
              itemCount: state.fruits.length,
              itemBuilder: (_, i) {
                final fruit = state.fruits[i];
                return ListTile(
                  title: Text(fruit.name),
                  subtitle: Text(fruit.description),
                  onTap: () {
                    context.pushNamed(
                      'fruit-details',
                      pathParameters: {'id': fruit.id.toString()},
                    );
                  },
                );
              },
            );
          } else if (state is FruitError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Clique para carregar frutas'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<FruitListCubit>().getAllFruits(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
