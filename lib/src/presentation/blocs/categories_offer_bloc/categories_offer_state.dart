part of 'categories_offer_bloc.dart';

@freezed
abstract class CategoriesofferState with _$CategoriesofferState {
  const factory CategoriesofferState.emptyCategoriesOffer() =
      EmptyCategoriesOffer;
  const factory CategoriesofferState.categoriesOfferLoading() =
      CategoriesofferStateLoading;
  const factory CategoriesofferState.categoriesOfferStateLoadFailure(
      ServerException failure) = CategoriesofferStateLoadFailure;
  const factory CategoriesofferState.categoriesOfferLoadSuccess(
      List<CategoriesOffer> listCategoriesOffer) = CategoriesofferLoadSuccess;
}