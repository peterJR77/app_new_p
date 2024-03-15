import 'package:flutter/material.dart';
import 'package:untitled/core/confige/constants.dart';
import 'package:untitled/core/models/category_model.dart';
import 'package:untitled/network/api_manger.dart';
import 'package:untitled/page/home/widget/news_list_widget.dart';
import 'package:untitled/page/home/widget/tab_item_widget.dart';

import '../../../core/widget/custem_background_widegt.dart';
class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;
  const CategoryView({super.key, required this.categoryModel});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: FutureBuilder(
        future:ApiManager.fetchDataSources(widget.categoryModel),
    builder: (context , snapshot){
    if(snapshot.hasError){
    return const Center(
    child: Text("Something went wrong"),);}
    if(snapshot.connectionState == ConnectionState.waiting){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    var sourcesList = snapshot.data??[];
    return NewsListWidget(sourcesList: sourcesList);
    }
      ),
    );
  }
}
