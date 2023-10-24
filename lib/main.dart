import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnagain/core/client/client.dart';
import 'package:learnagain/features/home/bloc/home_bloc.dart';
import 'package:learnagain/features/home/presentation/home_page.dart';


void main() async {
  await Client().setupClient();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(create: (context) => HomeBloc()),

        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 97, 15, 15)),
            useMaterial3: false,
          ),
          home: const HomePage(),
        ));
  }
}
