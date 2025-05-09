part of 'menu_offer_bloc.dart';

@freezed
class MenuOfferState with _$MenuOfferState {
  const factory MenuOfferState.emptyMenu() = EmptyMenu;
  const factory MenuOfferState.menuLoading() = MenuLoading;
  const factory MenuOfferState.menuLoadFailure(ServerException failure) =
      MenuLoadFailure;
  const factory MenuOfferState.menuLoadSuccess(
      List<MenuModel> listCategoriesOffer) = MenuLoadSuccess;
  const factory MenuOfferState.menuFilteredCategory(
      List<MenuModel> listCategoriesOffer) = MenuFilteredCategory;
}
