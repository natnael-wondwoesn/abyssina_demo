// main.dart
import 'package:abyssina_demo/locator.dart';
import 'package:abyssina_demo/presentation/bloc/bloc/home_bloc_bloc.dart';
import 'package:abyssina_demo/presentation/bloc/bloc/home_bloc_event.dart';
import 'package:abyssina_demo/presentation/screens/all_blogs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<HomeBloc>()..add(GetProductsEvent()),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: HomrScreen()),
    );
  }
}
