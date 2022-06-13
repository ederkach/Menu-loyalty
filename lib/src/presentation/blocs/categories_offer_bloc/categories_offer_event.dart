part of 'categories_offer_bloc.dart';

@freezed
class CategoriesofferEvent with _$CategoriesofferEvent {
  const factory CategoriesofferEvent.fetchCategoriesOffer() =
      FetchCategoriesOffer;
  const factory CategoriesofferEvent.categoriesofferEventReceived(
      Either<ServerException, List<CategoriesOffer>>
          failureOrCategoriesOffer) = CategoriesofferEventReceived;
}
