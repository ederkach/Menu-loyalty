part of 'menu_offer_bloc.dart';

@freezed
abstract class MenuOfferState with _$MenuOfferState {
  const factory MenuOfferState.emptyMenu() = EmptyMenu;
  const factory MenuOfferState.menuLoading() = MenuLoading;
  const factory MenuOfferState.menuLoadFailure(ServerException failure) =
      MenuLoadFailure;
  const factory MenuOfferState.menuLoadSuccess(
      List<MenuModel> listCategoriesOffer) = MenuLoadSuccess;
  const factory MenuOfferState.menuFilteredCaregory(
      List<MenuModel> listCategoriesOffer) = MenuFilteredCaregory;
}
