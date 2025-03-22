import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_model.freezed.dart';
part 'categories_model.g.dart';

@freezed
abstract class Categories with _$Categories {
  const Categories._();
  const factory Categories({
    final String? id,
    required final String name,
    @Default(true) final bool active,
    @Default(0) final int? rank,
  }) = _Categories;

  factory Categories.empty() => const Categories(name: '');

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);

  factory Categories.fromDocument(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data()!;
    return Categories.fromJson(data).copyWith(id: documentSnapshot.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
