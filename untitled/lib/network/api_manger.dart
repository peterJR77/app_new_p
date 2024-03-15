import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/core/confige/constants.dart';
import 'package:untitled/core/models/ArticlesDataModel.dart';
import 'package:untitled/core/models/category_model.dart';

import '../core/models/source_model.dart';
class ApiManager {

  static Future<List<SourceModel>> fetchDataSources(
      CategoryModel categoryModel) async {
    var url = Uri.https(
        Constants.baseUrl,
        "v2/top-headlines/sources",
        {
          "apiKey": Constants.apiKey,
          "category": categoryModel.id,
        }
    );
    final response = await http.get(url);
    List<SourceModel> sourcesDataList = [];
    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body);
      var sourcesList = data["sources"] as List;
      for (var element in sourcesList) {
        sourcesDataList.add(SourceModel.fromJson(element));
      }
      return sourcesDataList;
    }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  static Future <List<Articles>> fetchDataArticles(String sourceId) async {
    Map<String,dynamic> queryParams = {
      "apiKey": Constants.apiKey,
      "sources":sourceId,

    };
    var url = Uri.https(
      Constants.baseUrl,
      "/v2/everything",
        queryParams,
    );
    final response = await http.get(url);
    if (response.statusCode==200){
      var data =jsonDecode(response.body);
      List articlesList = data["articles"];
      ArticlesDataModel articlesDataModel =  ArticlesDataModel.fromJson(data);
      return articlesDataModel.articles ?? [];

      }
    else {
      throw Exception("Error fetching data articles");
    }
    }
}