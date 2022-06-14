part of 'menu_offer_bloc.dart';

@freezed
class MenuOfferEvent with _$MenuOfferEvent {
  const factory MenuOfferEvent.fetchMenu() = FetchMenu;
  const factory MenuOfferEvent.menuOfferEventReceived(
          Either<ServerException, List<MenuModel>> failureOrCategoriesOffer) =
      MenuOfferEventReceived;
  const factory MenuOfferEvent.choseCategoryOffer(String idCategoryOffer) =
      ChoseCategoryOffer;
  const factory MenuOfferEvent.choseCategory(String idCategory) = ChoseCategory;
}
