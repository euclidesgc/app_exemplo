import 'package:example/modules/fruit_module/data/fruit_repository.dart';
import 'package:example/modules/fruit_module/domain/use_cases/get_fruit_by_id_use_case.dart';
import 'package:example/modules/fruit_module/presentation/fruit_details/cubit/fruit_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FruitDetailsPage extends StatefulWidget {
  final int fruitId;

  static Widget providerPageBuilder(BuildContext context, GoRouterState state) {
    final id = state.pathParameters['id'];
    if (id == null) {
      throw Exception("Fruit ID not provided");
    }
    final fruitId = int.parse(id);
    return MultiProvider(
      providers: [
        Provider(create: (context) => FruitRepository()),
        Provider(
          create:
              (context) => GetFruitByIdUseCase(
                repository: context.read<FruitRepository>(),
              ),
        ),
        BlocProvider(
          create:
              (context) => FruitDetailsCubit(
                usecase: context.read<GetFruitByIdUseCase>(),
              ),
        ),
      ],
      child: FruitDetailsPage(fruitId: fruitId),
    );
  }

  const FruitDetailsPage({super.key, required this.fruitId});

  @override
  State<FruitDetailsPage> createState() => _FruitDetailsPageState();
}

class _FruitDetailsPageState extends State<FruitDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<FruitDetailsCubit>().getFruitDetails(widget.fruitId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FruitDetailsCubit, FruitDetailsState>(
      builder: (context, state) {
        PreferredSizeWidget? appBar;
        Widget body;

        if (state is FruitDetailsError) {
          appBar = AppBar(title: Text("Error"));
          body = Center(child: Text(state.message));
        } else if (state is FruitDetailsLoaded) {
          appBar = AppBar(title: Text(state.fruit.name));
          body = Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(state.fruit.description),
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
