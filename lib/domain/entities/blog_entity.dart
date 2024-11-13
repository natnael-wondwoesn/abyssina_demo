// domain/entities/blog_entity.dart

import 'package:equatable/equatable.dart';

class BlogEntity extends Equatable {
  final String title;
  final String description;
  final String? date;
  final String category;

  const BlogEntity({
    required this.title,
    required this.description,
    this.date,
    required this.category,
  });

  @override
  List<Object?> get props => [title, description, date, category];
}
