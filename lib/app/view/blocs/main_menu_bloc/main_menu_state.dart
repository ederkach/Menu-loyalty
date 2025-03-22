part of 'main_menu_bloc.dart';

@freezed
class MainMenuState with _$MainMenuState {
  const factory MainMenuState.emptyMainMenu() = EmptyMainMenu;
  const factory MainMenuState.mainMenuLoading() = MainMenuLoading;
  const factory MainMenuState.mainMenuLoadFailure(ServerException failure) =
      MainMenuLoadFailure;
  const factory MainMenuState.mainMenuLoadSuccess(
      List<MenuModel> listMainMenu) = MainMenuLoadSuccess;
  const factory MainMenuState.mainMenuFilteredByCategory(
          List<MenuModel> listFilteredMainMenu, List<MenuModel> listOfferMenu) =
      MainMenuFilteredByCategory;
  const factory MainMenuState.mainMenuFiltered(
      List<MenuModel> listFilteredMainMenu) = MainMenuFiltered;
}
