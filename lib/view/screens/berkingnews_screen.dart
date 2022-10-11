// image =  "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png"
// const Color(0xff151f2c),
import 'package:flutter/material.dart';
import 'package:news/provider/breakingnews_provider.dart';
import 'package:news/view/screens/webview.dart';
import 'package:provider/provider.dart';

class BreakingNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News app'),
        ),
        body: Consumer<BreakingNewsProvider>(
          builder: (context, provider, child) {
            return provider.breakingNewsList.length == 0 ? Center(child: CircularProgressIndicator()) : ListView.builder(
                itemCount: provider.breakingNewsList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Webviewscreen(url: provider.breakingNewsList[index].url),));
                    },
                    child: Container(
                      child: Card(
                        elevation: 10,
                        color: Colors.cyan,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Image.network(provider
                                          .breakingNewsList[index].urlToImage ??
                                      "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png")),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                    provider.breakingNewsList[index].title
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
                                    provider.breakingNewsList[index].descripition
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
        ));
  }
}
