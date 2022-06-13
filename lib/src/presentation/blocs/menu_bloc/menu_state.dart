part of 'menu_bloc.dart';

@freezed
abstract class MenuState with _$MenuState {
  const factory MenuState.emptyMenu() = EmptyMenu;
  const factory MenuState.menuLoading() = MenuLoading;
  const factory MenuState.menuLoadFailure(ServerException failure) =
      MenuLoadFailure;
  const factory MenuState.menuLoadSuccess(List<MenuModel> listCategoriesOffer) =
      MenuLoadSuccess;
  const factory MenuState.menuFilteredCaregory(
      List<MenuModel> listCategoriesOffer) = MenuFilteredCaregory;
}
