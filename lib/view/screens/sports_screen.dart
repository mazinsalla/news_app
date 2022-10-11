
import 'package:flutter/material.dart';
import 'package:news/provider/sports_provider.dart';
import 'package:provider/provider.dart';


class SportsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sports News'),
      ),
      body: Consumer<SportsProvider>(
        builder: (context, provider, child) {
          return provider.sportList.length == 0 ? Center(child: CircularProgressIndicator()) : ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  color: const Color(0xff151f2c),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            child: Image.network(provider
                                .sportList[index].urlToImage ??
                                "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png")),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                              provider.sportList[index].title
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                              provider.sportList[index].descripition
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
      ));

  }
}
