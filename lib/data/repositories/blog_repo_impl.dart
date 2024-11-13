// data/repositories/blog_repo_impl.dart
import 'package:abyssina_demo/core/errors/errors.dart';
import 'package:abyssina_demo/core/network/network_check.dart';
import 'package:abyssina_demo/data/datasources/remote_data_source/remote_datasource.dart';
import 'package:abyssina_demo/data/models/blog_model.dart';
import 'package:abyssina_demo/domain/entities/blog_entity.dart';
import 'package:abyssina_demo/domain/repository/blog_repository.dart';
import 'package:dartz/dartz.dart';

class BlogRepoImpl implements BlogRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  BlogRepoImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<BlogModel>>> getBlogs() async {
    if (await networkInfo.isConnected) {
      try {
        final blogs = await remoteDataSource.getBlogs();
        return Right(blogs);
      } on ServerFailure {
        return const Left(ServerFailure("Server Issue"));
      }
    } else {
      return const Left(ConnectionFailure("No Internet"));
    }
  }

  @override
  Future<Either<Failure, BlogModel>> addBlog(BlogEntity blog) async {
    if (await networkInfo.isConnected) {
      try {
        final blogs = await remoteDataSource.addBlog(blog);
        return Right(blogs);
      } on ServerFailure {
        return const Left(ServerFailure("Server Issue"));
      }
    } else {
      return const Left(ConnectionFailure("No Internet"));
    }
  }
}
