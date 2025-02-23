import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cruze/api_manager/api_manager.dart';
import 'package:news_app_cruze/api_manager/seorces_model/Sources.dart';
import 'package:news_app_cruze/repository_category/data_Source/source_local_data_source_impl.dart';
import '../../../repository_category/data_Source/source_data_source.dart';
import '../../../repository_category/data_Source/source_data_source_impl.dart';
import '../../../repository_category/source_repository/source_repository.dart';
import '../../../repository_category/source_repository/source_repository_impl.dart';

class CategoryDetailsViewmodel extends Cubit<CategoryState> {
  late SourceRepository sourceRepository;
  late SourceRemoteDataSource remoteDataSource;
  late ApiManager apiManager;

  CategoryDetailsViewmodel() : super(LoadingState(message: 'Loading...')) {
    apiManager = ApiManager();
    remoteDataSource = SourceRemoteDataSourceImpl(apiManager: apiManager);
    sourceRepository = SourceRepositoryImpl(
      sourceRemoteDataSource: remoteDataSource,
    );
  }

  getSources(String categoryId) async {
    try {
      var response = await sourceRepository.getSources(categoryId);
      if (response?.status == 'error') {
        emit(ErrorState(errorMessage: response?.message ?? ''));
      } else {
        emit(SuccessState(sourcesList: response?.sources ?? []));
      }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class CategoryState {}

class LoadingState extends CategoryState {
  String message;

  LoadingState({required this.message});
}

class ErrorState extends CategoryState {
  String errorMessage;

  ErrorState({required this.errorMessage});
}

class SuccessState extends CategoryState {
  List<Sources> sourcesList;

  SuccessState({required this.sourcesList});
}
