part of 'categories_offer_bloc.dart';

@freezed
class CategoriesOfferState with _$CategoriesOfferState {
  const factory CategoriesOfferState.emptyCategoriesOffer() =
      EmptyCategoriesOffer;
  const factory CategoriesOfferState.categoriesOfferLoading() =
      CategoriesOfferStateLoading;
  const factory CategoriesOfferState.categoriesOfferStateLoadFailure(
      ServerException failure) = CategoriesOfferStateLoadFailure;
  const factory CategoriesOfferState.categoriesOfferLoadSuccess(
      List<CategoriesOffer> listCategoriesOffer) = CategoriesofferLoadSuccess;
}
