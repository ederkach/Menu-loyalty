part of 'categories_offer_bloc.dart';

@freezed
class CategoriesOfferEvent with _$CategoriesOfferEvent {
  const factory CategoriesOfferEvent.fetchCategoriesOffer() =
      FetchCategoriesOffer;
  const factory CategoriesOfferEvent.categoriesOfferEventReceived(
      Either<ServerException, List<CategoriesOffer>>
          failureOrCategoriesOffer) = CategoriesOfferEventReceived;
}
