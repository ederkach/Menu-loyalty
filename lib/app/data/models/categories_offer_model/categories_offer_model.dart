import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_offer_model.freezed.dart';
part 'categories_offer_model.g.dart';

@freezed
abstract class CategoriesOffer with _$CategoriesOffer {
  const CategoriesOffer._();
  const factory CategoriesOffer({
    final String? id,
    required final String name,
    required final String iconPath,
    @Default(true) final bool active,
    @Default(0) final int? rank,
  }) = _CategoriesOffer;

  factory CategoriesOffer.empty() =>
      const CategoriesOffer(name: '', iconPath: '');

  factory CategoriesOffer.fromJson(Map<String, dynamic> json) =>
      _$CategoriesOfferFromJson(json);

  factory CategoriesOffer.fromDocument(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data()!;
    return CategoriesOffer.fromJson(data).copyWith(id: documentSnapshot.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
