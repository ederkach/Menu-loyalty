part of 'main_menu_bloc.dart';

@freezed
class MainMenuEvent with _$MainMenuEvent {
  const factory MainMenuEvent.fetchMainMenu() = FetchMainMenu;
  const factory MainMenuEvent.filterByCategory(String idCategory) =
      FilterByCategory;
}
