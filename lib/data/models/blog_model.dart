// data/models/blog_model.dart

import 'package:equatable/equatable.dart';

class BlogModel extends Equatable {
  final num id;
  final String title;
  final String description;
  final String? date;
  final String category;

  const BlogModel({
    required this.id,
    required this.title,
    required this.description,
    this.date,
    required this.category,
  });

  @override
  List<Object?> get props => [id, title, description, date, category];

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'], // TO be deleteed
      title: json['name'],
      description: json['description'],
      date: json['date'] ?? '',
      category: json['imageUrl'] ?? '',
    );
  }
}
