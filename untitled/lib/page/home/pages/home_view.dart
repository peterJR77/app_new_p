import 'package:flutter/material.dart';
import 'package:untitled/core/confige/constants.dart';
import 'package:untitled/main.dart';
import 'package:untitled/page/home/pages/category_view.dart';
import 'package:untitled/page/home/widget/custome_drawer.dart';

import '../../../core/models/category_model.dart';
import '../../../core/widget/custem_background_widegt.dart';
import '../widget/custom_item_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<CategoryModel> categoriesList = [
    CategoryModel(
        id: "sports",
        title: "Sports",
        image: "assets/images/sports.png",
        backgroundColor: const Color(0xFFC91C22),
    ),
    CategoryModel(
      id: "General",
      title: "Politics",
      image: "assets/images/Politics.png",
      backgroundColor: const Color(0xFF003E90),
    ),
    CategoryModel(
      id: "health",
      title: "Health",
      image: "assets/images/health.png",
      backgroundColor: const Color(0xFFED1E79),
    ),
    CategoryModel(
      id: "business",
      title: "Business",
      image: "assets/images/bussines.png",
      backgroundColor: const Color(0xFFCF7E48),
    ),
    CategoryModel(
      id: "environment",
      title: "Environment",
      image: "assets/images/environment.png",
      backgroundColor: const Color(0xFF4882CF),
    ),
    CategoryModel(
      id: "science",
      title: "Science",
      image: "assets/images/science.png",
      backgroundColor: const Color(0xFFF2D352),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return  CustomBackgroundWidget(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 80,
          title: Text(
            selectCategory == null ? "News App" : selectCategory!.title,
            style: Constants.theme.textTheme.titleLarge,
          ) ,
        ),
        drawer:  CustomDrawer(
            onCategoryDrawerTap: onDrawerCategoryClicked ,
        ),
        body: selectCategory == null ? Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "pick your cetegory \nof interest",
                textAlign: TextAlign.start,
                style: Constants.theme.textTheme.bodyLarge?.copyWith(
                  color: const Color(0xFF4F5A69),
                  height: 1.2
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 25 , horizontal: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  mainAxisSpacing:10.0,
                   crossAxisSpacing: 10.0,
                    childAspectRatio: 4/5,
                ),
                  itemBuilder:(context, index) =>
                      CustomItemWidget(index: index,
                        categoryModel: categoriesList[index],
                        onCategoryClicked: onCategoryClicked ,
                      ) ,
                  itemCount: 6,
                ),
              )
            ],
          ),
        ): CategoryView(categoryModel: selectCategory!,),
       ) ,
    ) ;
  }
  CategoryModel? selectCategory;
 void onCategoryClicked(CategoryModel categoryModel){
   selectCategory = categoryModel;
   setState(() {});

 }
 void onDrawerCategoryClicked(){
   setState(() {
     selectCategory = null;
   });
   navigatorKey.currentState!.pop();
 }
}
