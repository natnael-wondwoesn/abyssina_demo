// presentation/bloc/bloc/home_bloc_bloc.dart
import 'package:abyssina_demo/constants/usecases.dart';
import 'package:abyssina_demo/domain/usecases/get_blogs.dart';
import 'package:abyssina_demo/presentation/bloc/bloc/home_bloc_event.dart';
import 'package:abyssina_demo/presentation/bloc/bloc/home_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final client = http.Client;
  GetBlogs getBlogs;

  HomeBloc(this.getBlogs) : super(HomeLoading()) {
    on<GetProductsEvent>((event, emit) async {
      emit(HomeLoading());
      var products = await getBlogs(NoParams());
      products.fold(
          (l) => emit(HomeFailure(l.message)), (r) => emit(HomeLoaded(r)));
    });
  }
}
