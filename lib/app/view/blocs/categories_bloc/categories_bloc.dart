import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:menu_loyalty/app/core/exception/exception.dart';
import 'package:menu_loyalty/app/data/datasources/repositories.dart';
import 'package:menu_loyalty/app/data/models/models.dart';

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
