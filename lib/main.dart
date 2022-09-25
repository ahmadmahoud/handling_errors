import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handling_error/core/dependency_injection/injection.dart';
import 'package:handling_error/core/util/bloc/cubit.dart';
import 'package:handling_error/core/util/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (context) => di<AppBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: Routes.routes,
        initialRoute: Routes.home,
      ),
    );
  }
}

