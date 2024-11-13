// domain/usecases/add_blog.dart
import 'package:abyssina_demo/constants/usecases.dart';
import 'package:abyssina_demo/core/errors/errors.dart';
import 'package:abyssina_demo/data/models/blog_model.dart';
import 'package:abyssina_demo/domain/entities/blog_entity.dart';
import 'package:abyssina_demo/domain/repository/blog_repository.dart';
import 'package:dartz/dartz.dart';

class AddBlogUseCase implements UseCase<BlogModel, BlogEntity> {
  final BlogRepository abstractblogrepo;

  AddBlogUseCase(this.abstractblogrepo);

  @override
  Future<Either<Failure, BlogModel>> call(BlogEntity newProduct) async {
    return await abstractblogrepo.addBlog(newProduct);
  }
}
