import 'dart:convert';

import 'package:api_implement/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewaPage extends StatefulWidget {
  const NewaPage({Key? key}) : super(key: key);

  @override
  State<NewaPage> createState() => _NewaPageState();
}

class _NewaPageState extends State<NewaPage> {

  var _style =  TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  List<Articles> dataList = [];

  @override
  void initState() {
    getDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Api Demo"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height-100,
        child: dataList.length==0? Center(
          child: CircularProgressIndicator(),
        ): ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context,index){
              return Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                ),
                height: MediaQuery.of(context).size.height*.3,
                width: MediaQuery.of(context).size.height -20,
                child: Stack(
                  children: [
                    Image.network(dataList[index].urlToImage,
                      height: MediaQuery.of(context).size.height*.3,
                      width: MediaQuery.of(context).size.height -20,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*.3,
                      width: MediaQuery.of(context).size.height -20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(dataList[index].author, style: _style,),
                              Text(dataList[index].publishedAt, style: _style,),
                            ],
                          ),
                          //Text(dataList[index].title, style: _style,),
                          //Text(dataList[index].content, style: _style,),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(.4)
                              ),
                              alignment: Alignment.bottomCenter,
                              child: Text(dataList[index].description, style: _style, maxLines: 3,)),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
        ),
      ),
    );
  }

  getDataFromApi() async{
    String apiUrl = "https://newsapi.org/v2/everything?q=apple&from=2022-07-20&to=2022-07-20&sortBy=popularity&apiKey=1d98d6be1e5341b395e192c1603cba2e";
    var result = await http.get(Uri.parse(apiUrl));
    print (result.body);

    var jsonData = jsonDecode(result.body);
    print (jsonData);


    jsonData['articles'].forEach((item){
      Articles articles = Articles(
        item['author']??"",
        item['title']??"",
        item['description']??"",
        item['url']??"",
        item['urlToImage']??"",
        item['publishedAt']??"",
        item['content']??"",
      );

      dataList.add(articles);


    });

    print (dataList);

    setState(() {

    });

  }
}
