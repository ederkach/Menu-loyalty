part of 'categories_offer_bloc.dart';

@freezed
abstract class CategoriesofferState with _$CategoriesofferState {
  const factory CategoriesofferState.initial() = _Initial;
  const factory CategoriesofferState.categoriesOfferLoading() =
      CategoriesofferStateLoading;
  const factory CategoriesofferState.categoriesOfferStateLoadFailure(
      ServerException failure) = CategoriesofferStateLoadFailure;
  const factory CategoriesofferState.categoriesOfferLoadSuccess(
      List<CategoriesOffer> logs) = CategoriesofferLoadSuccess;
}
