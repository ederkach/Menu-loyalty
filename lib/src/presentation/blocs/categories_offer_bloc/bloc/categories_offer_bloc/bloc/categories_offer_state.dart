part of 'categories_offer_bloc.dart';

@freezed
abstract class CategoriesofferState with _$CategoriesofferState {
  const factory CategoriesofferState.initial() = _Initial;
  const factory CategoriesofferState.logsLoading() =
      CategoriesofferStateLoading;
  const factory CategoriesofferState.CategoriesofferStateLoadFailure(
      ServerException failure) = CategoriesofferStateLoadFailure;
  const factory CategoriesofferState.CategoriesofferLoadSuccess(
      List<CategoriesOffer> logs) = CategoriesofferLoadSuccess;
}
