part of 'menu_bloc.dart';

@freezed
class MenuEvent with _$MenuEvent {
  const factory MenuEvent.fetchMenu() = FetchMenu;
  const factory MenuEvent.menuEventReceived(
          Either<ServerException, List<MenuModel>> failureOrCategoriesOffer) =
      MenuEventReceived;
  const factory MenuEvent.choseCategoryOffer(String idCategoryOffer) =
      ChoseCategoryOffer;
  const factory MenuEvent.choseCategory(String idCategory) = ChoseCategory;
}
