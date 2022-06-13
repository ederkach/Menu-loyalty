import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_model.freezed.dart';
part 'menu_model.g.dart';

@freezed
abstract class MenuModel implements _$MenuModel {
  const MenuModel._();
  const factory MenuModel({
    final String? id,
    required final String name,
    final String? imagePath,
    final bool? allergy,
    final bool? spicy,
    final bool? vegan,
    @Default(0) final int? rank,
    @Default([]) List<String> categories,
    @Default([]) List<String> categoriesOffer,
  }) = _MenuModel;

  factory MenuModel.empty() => const MenuModel(name: '');

  factory MenuModel.fromJson(Map<String, dynamic> json) =>
      _$MenuModelFromJson(json);

  factory MenuModel.fromDocument(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data()!;
    return MenuModel.fromJson(data).copyWith(id: documentSnapshot.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
