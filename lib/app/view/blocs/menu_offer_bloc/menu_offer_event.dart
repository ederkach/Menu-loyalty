part of 'menu_offer_bloc.dart';

@freezed
class MenuOfferEvent with _$MenuOfferEvent {
  const factory MenuOfferEvent.fetchMenu() = FetchMenu;
  const factory MenuOfferEvent.filterByCategoryOffer(String idCategoryOffer) =
      FilterByCategoryOffer;
}
