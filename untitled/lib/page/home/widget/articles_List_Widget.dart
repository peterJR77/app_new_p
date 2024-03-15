import 'package:flutter/material.dart';
import 'package:untitled/network/api_manger.dart';
import 'package:untitled/page/home/widget/Article_Item_Widget.dart';
class ArticlesListWidget extends StatelessWidget {
  final String sourceId;
  const ArticlesListWidget({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: ApiManager.fetchDataArticles(sourceId),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return const Center(
              child: Text("Something went wrong"),);}
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var articlesList = snapshot.data ?? [];
         return Expanded(
           child: ListView.builder(
                itemBuilder: (context , index)=> ArticleItemWidget(articles:articlesList[index] ),
             itemCount: articlesList.length,
           )
          );
        }
    );
  }
}
