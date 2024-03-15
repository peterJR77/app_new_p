import 'package:flutter/material.dart';
import 'package:untitled/core/confige/constants.dart';
import 'package:untitled/core/models/ArticlesDataModel.dart';

class ArticleItemWidget extends StatelessWidget {
  final Articles articles;
  const ArticleItemWidget({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 15) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
              child: Image.network(articles.urlToImage ?? "")
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              articles.source?.name?? "",
              textAlign: TextAlign.start,
              style: Constants.theme.textTheme.bodySmall?. copyWith(
                color: const Color(0xFF79828B),

              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0),
            child: Text(
              articles.title ?? "",
              textAlign: TextAlign.start,
              style: Constants.theme.textTheme.bodyMedium?. copyWith(
                color: Colors.black,
                  height: 1.0
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              articles.publishedAt?? "",
              textAlign: TextAlign.end,
              style: Constants.theme.textTheme.bodySmall?. copyWith(
                color: const Color(0xFF79828B),
              ),
            ),
          )
        ],
      ),
    );
  }
}
