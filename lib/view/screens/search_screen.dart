import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../provider/search_provider.dart';

class SearchScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context,provider,child){
      return Scaffold(
          appBar: AppBar(
            title: TextField(onChanged:(value){
              provider.getAllSearchArticle(value);
            },
              decoration:InputDecoration(suffixIcon: Icon(Icons.search),hintText:"search"),),
          ),
          body:ListView.builder(itemCount:provider.searchList.length,itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              color: Colors.blueGrey,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Image.network(
                          provider.searchList[index].urlToImage??"https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png"),
                    ),
                  ),
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        title: Text(
                          provider.searchList[index].title.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          provider.searchList[index].descripition.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }) );
    });
  }
}