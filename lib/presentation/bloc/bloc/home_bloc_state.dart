// presentation/bloc/bloc/home_bloc_state.dart
import 'package:abyssina_demo/data/models/blog_model.dart';
import 'package:equatable/equatable.dart';

// part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  final List<BlogModel> products;

  const HomeLoaded(this.products);

  // return products;

  @override
  List<Object> get props => [products];
}

class HomeFailure extends HomeState {
  final String message;

  HomeFailure(this.message);

  @override
  List<Object> get props => [message];
}
