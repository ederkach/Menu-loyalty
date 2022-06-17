part of 'categories_bloc.dart';

@freezed
abstract class CategoriesState with _$CategoriesState {
  const factory CategoriesState.emptyCategories() = EmptyCategories;
  const factory CategoriesState.categoriesLoading() = CategoriesLoading;
  const factory CategoriesState.categoriesLoadFailure(ServerException failure) =
      CategoriesLoadFailure;
  const factory CategoriesState.categoriesLoadSuccess(
      List<Categories> listCategories) = CategoriesLoadSuccess;
}
