// domain/usecases/get_blogs.dart
import 'package:abyssina_demo/constants/usecases.dart';
import 'package:abyssina_demo/core/errors/errors.dart';
import 'package:abyssina_demo/data/models/blog_model.dart';
import 'package:abyssina_demo/domain/repository/blog_repository.dart';
import 'package:dartz/dartz.dart';

class GetBlogs implements UseCase<List<BlogModel>, NoParams> {
  final BlogRepository abstactBlogRepo;

  GetBlogs(this.abstactBlogRepo);

  @override
  Future<Either<Failure, List<BlogModel>>> call(NoParams params) async {
    return await abstactBlogRepo.getBlogs();
  }
}
