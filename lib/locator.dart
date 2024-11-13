// locator.dart
import 'package:abyssina_demo/core/network/network_check.dart';
import 'package:abyssina_demo/data/datasources/remote_data_source/remote_datasource.dart';
import 'package:abyssina_demo/data/repositories/blog_repo_impl.dart';
import 'package:abyssina_demo/domain/repository/blog_repository.dart';
import 'package:abyssina_demo/domain/usecases/add_blog.dart';
import 'package:abyssina_demo/domain/usecases/get_blogs.dart';
import 'package:abyssina_demo/presentation/bloc/bloc/home_bloc_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //! Externals

  sl.registerLazySingleton<http.Client>(() => http.Client());
  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // Data Sources
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: sl()));

  //! Features
  // Repositories

  sl.registerLazySingleton<BlogRepository>(
      () => BlogRepoImpl(remoteDataSource: (sl()), networkInfo: (sl())));

  // Use Cases
  sl.registerLazySingleton<AddBlogUseCase>(() => AddBlogUseCase(sl()));
  sl.registerLazySingleton<GetBlogs>(() => GetBlogs(sl()));

  //BLoc
  sl.registerFactory(() => HomeBloc(GetBlogs(sl())));

  //!COre
}
