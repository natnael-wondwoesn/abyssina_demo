// domain/repository/blog_repository.dart

import 'package:abyssina_demo/core/errors/errors.dart';
import 'package:abyssina_demo/data/models/blog_model.dart';
import 'package:abyssina_demo/domain/entities/blog_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BlogRepository {
  Future<Either<Failure, List<BlogModel>>> getBlogs();
  Future<Either<Failure, BlogModel>> addBlog(BlogEntity blog);
}
