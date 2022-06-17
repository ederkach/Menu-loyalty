import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:menu_loyalty/src/core/error/exception.dart';
import 'package:menu_loyalty/src/data/datasources/remote/repositories/categories/categories_repository_copy.dart';

import '../../../data/models/categories_model/categories_model.dart';

part 'categories_event.dart';
part 'categories_state.dart';
part 'categories_bloc.freezed.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepository _categoriesRepository;

  CategoriesBloc({required CategoriesRepository categoriesRepository})
      : _categoriesRepository = categoriesRepository,
        super(const CategoriesState.emptyCategories()) {
    on<FetchCategories>(_onLoadMenu);
  }

  void _onLoadMenu(FetchCategories event, Emitter<CategoriesState> emit) async {
    emit(
      const CategoriesState.categoriesLoading(),
    );

    final dataCategoriesRepository = await _categoriesRepository.getCategory();

    emit(
      dataCategoriesRepository.fold(
        (failure) => CategoriesState.categoriesLoadFailure(
            ServerException(message: failure.message)),
        (categoriesOfferList) =>
            CategoriesState.categoriesLoadSuccess(categoriesOfferList),
      ),
    );
  }
}
