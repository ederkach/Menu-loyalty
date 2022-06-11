import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:menu_loyalty/src/core/error/exception.dart';

import '../../../../../data/models/categories_offer_model/categories_offer_model.dart';
import '../../../../../data/repositories/categories_offer/categories_offer_repository.dart';

part 'categories_offer_event.dart';
part 'categories_offer_state.dart';
part 'categories_offer_bloc.freezed.dart';

class CategoriesofferBloc
    extends Bloc<CategoriesofferEvent, CategoriesofferState> {
  final CategoriesOfferRepository _categoriesOfferRepository;

  CategoriesofferBloc(this._categoriesOfferRepository)
      : super(const CategoriesofferState.emptyCategoriesOffer()) {
    on<FetchCategoriesOffer>(_onLoadCategoriesOffer);
  }

  void _onLoadCategoriesOffer(
      FetchCategoriesOffer event, Emitter<CategoriesofferState> emit) async {
    final dataCategoriesOfferRepository =
        await _categoriesOfferRepository.getCategoryOffer();

    emit(
      dataCategoriesOfferRepository.fold(
        (failure) => CategoriesofferState.categoriesOfferStateLoadFailure(
            ServerException(message: failure.message)),
        (categoriesOfferList) =>
            CategoriesofferState.categoriesOfferLoadSuccess(
                categoriesOfferList),
      ),
    );
  }
}
