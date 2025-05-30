import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:menu_loyalty/app/core/exception/exception.dart';
import 'package:menu_loyalty/app/data/datasources/repositories.dart';
import 'package:menu_loyalty/app/data/models/models.dart';

part 'categories_offer_event.dart';
part 'categories_offer_state.dart';
part 'categories_offer_bloc.freezed.dart';

class CategoriesOfferBloc
    extends Bloc<CategoriesOfferEvent, CategoriesOfferState> {
  final CategoriesOfferRepository _categoriesOfferRepository;

  CategoriesOfferBloc({required categoriesOfferRepository})
      : _categoriesOfferRepository = categoriesOfferRepository,
        super(const CategoriesOfferState.emptyCategoriesOffer()) {
    on<FetchCategoriesOffer>(_onLoadCategoriesOffer);
  }

  void _onLoadCategoriesOffer(
      FetchCategoriesOffer event, Emitter<CategoriesOfferState> emit) async {
    emit(
      const CategoriesOfferState.categoriesOfferLoading(),
    );

    final dataCategoriesOfferRepository =
        await _categoriesOfferRepository.getCategoryOffer();

    emit(
      dataCategoriesOfferRepository.fold(
        (failure) => CategoriesOfferState.categoriesOfferStateLoadFailure(
            ServerException(message: failure.message)),
        (categoriesOfferList) =>
            CategoriesOfferState.categoriesOfferLoadSuccess(
                categoriesOfferList),
      ),
    );
  }
}
