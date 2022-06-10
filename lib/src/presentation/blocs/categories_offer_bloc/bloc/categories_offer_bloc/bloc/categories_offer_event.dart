part of 'categories_offer_bloc.dart';

@freezed
class CategoriesofferEvent with _$CategoriesofferEvent {
  const factory CategoriesofferEvent.started() = _Started;
  const factory CategoriesofferEvent.categoriesOfferReceived(
          Either<ServerException, List<CategoriesOffer>> data) =
      CategoriesofferReceived;
}
