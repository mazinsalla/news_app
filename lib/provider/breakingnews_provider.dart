import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';


class BreakingNewsProvider extends ChangeNotifier {

  List<ArticleModel> breakingNewsList = [];
  BreakingNewsProvider(){
    getAllBreakingNews();
  }




  Future getAllBreakingNews() async {
    try{
      var response= await Dio().get("https://newsapi.org/v2/top-headlines?country=eg&apiKey=528ffbdf133743068c1f707628d85a37");
      breakingNewsList=List<ArticleModel>.from(response.data["articles"].map((x)=>ArticleModel.fromJson(x)));
          notifyListeners();
    }
    catch(e){
      print(e);
    }
  }
    }


