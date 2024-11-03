import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cruze/api_manager/api_manager.dart';
import 'package:news_app_cruze/ui/categories_tab/category_data/category_item.dart';
import 'package:news_app_cruze/ui/categories_tab/categoty_details/category_details_viewModel.dart';
import 'package:news_app_cruze/ui/categories_tab/categoty_details/source_widegt/source_tab.dart';

class CategoryDetails extends StatefulWidget {
  CategoryItem catItem;

  CategoryDetails({required this.catItem});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  late CategoryDetailsViewmodel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = CategoryDetailsViewmodel();
    viewModel.getSources(widget.catItem.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: ApiManager.getSources(catItem.categoryId),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //     if (snapshot.hasError) {
    //       return Center(
    //         child: Text(snapshot.error.toString()),
    //       );
    //     }
    //     var sourcesList = snapshot.data?.sources ?? [];
    //     return SourceTab(sourceList: sourcesList);
    //   },
    // );
    return BlocBuilder<CategoryDetailsViewmodel, CategoryState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          case ErrorState():
            {
              return Center(
                child: Text(state.errorMessage),
              );
            }
          case SuccessState():
            {
              return SourceTab(sourceList: state.sourcesList);
            }
        }
      },
    );
  }
}
