// data/datasources/remote_data_source/remote_datasource.dart
import 'dart:convert';
import 'package:abyssina_demo/domain/entities/blog_entity.dart';
import 'package:http/http.dart' as http;
import 'package:abyssina_demo/data/models/blog_model.dart';

import 'package:abyssina_demo/constants/constants.dart';

abstract class RemoteDataSource {
  Future<List<BlogModel>> getBlogs();
  Future<BlogModel> addBlog(BlogEntity blog);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<BlogModel>> getBlogs() async {
    final response = await client.get(Uri.parse('${Urls_paths.url_path}blogs'));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['data'] as List)
          .map((e) => BlogModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load blogs');
    }
  }

  @override
  Future<BlogModel> addBlog(BlogEntity blog) async {
    final response = await client.post(
      Uri.parse('${Urls_paths.url_path}blogs'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': blog.title,
        'description': blog.description,
        'date': blog.date ?? '',
        'category': blog.category,
      }),
    );
    if (response.statusCode == 201) {
      return BlogModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to post blog');
    }
  }
}
