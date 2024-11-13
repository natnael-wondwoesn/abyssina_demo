// presentation/screens/all_blogs_screen.dart
import 'package:abyssina_demo/presentation/bloc/bloc/home_bloc_bloc.dart';
import 'package:abyssina_demo/presentation/bloc/bloc/home_bloc_event.dart';
import 'package:abyssina_demo/presentation/bloc/bloc/home_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomrScreen extends StatefulWidget {
  const HomrScreen({super.key});

  @override
  State<HomrScreen> createState() => _HomrScreenState();
}

class _HomrScreenState extends State<HomrScreen> {
  @override
  Widget build(BuildContext context) {
    Future<void> _refresh() {
      context.read<HomeBloc>().add(GetProductsEvent());
      return Future.delayed(Duration(seconds: 3));
    }

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Home'),
            ),
            body: Container(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeLoaded) {
                    return RefreshIndicator(
                      onRefresh: _refresh,
                      child: ListView.builder(
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(state.products[index].title),
                            subtitle: Text(state.products[index].description),
                          );
                        },
                      ),
                    );
                  } else if (state is HomeFailure) {
                    return Center(child: Text(state.message));
                  } else {
                    return Container();
                  }
                },
              ),
            )));
  }
}
