part of 'categories_offer_bloc.dart';

@freezed
abstract class CategoriesOfferState with _$CategoriesOfferState {
  const factory CategoriesOfferState.emptyCategoriesOffer() =
      EmptyCategoriesOffer;
  const factory CategoriesOfferState.categoriesOfferLoading() =
      CategoriesOfferStateLoading;
  const factory CategoriesOfferState.CategoriesOfferStateLoadFailure(
      ServerException failure) = CategoriesOfferStateLoadFailure;
  const factory CategoriesOfferState.categoriesOfferLoadSuccess(
      List<CategoriesOffer> listCategoriesOffer) = CategoriesofferLoadSuccess;
}
