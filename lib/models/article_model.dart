
import 'package:flutter/foundation.dart';

class ArticleModel  {
final String title;
final String? descripition;
final String url ;
final String?urlToImage;

ArticleModel({required this.title,required  this.descripition,required  this.url, required this.urlToImage});
factory ArticleModel.fromJson(Map<String,dynamic>json){
  return ArticleModel(title: json["title"], descripition:json ["descripition"], url:json ["url"], urlToImage: json["urlToImage"],);

}

}


