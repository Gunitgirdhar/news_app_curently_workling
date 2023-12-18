import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/User_article.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<UserArticleModel> articlle;

  @override
  void initState() {
    super.initState();
    articlle = UserArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Text("News",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                autocorrect: true,
                decoration: InputDecoration(
                    hintText: "Enter your hot topics",
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.orange,
                    ),
                    suffixIcon: Container(
                      // color: Colors.orange,
                      height: 58,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(child: Text("Search")),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.greenAccent))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: articlle,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  return Expanded(
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1),
                      itemBuilder: (context, index) {
                        var base = snapshot.data!.articles![index];
                        var eachImage = base.urlToImage;
                        var cont = base.content!;
                        var src = base.source!;
                        var tlt = base.title!;
                        var author = base.author;
                        var desc = base.description;
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 165,
                              margin: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                        blurStyle: BlurStyle.normal,
                                        offset: Offset.zero),
                                  ],
                                  image: DecorationImage(
                                      image: eachImage != null
                                          ? NetworkImage(eachImage)
                                          : AssetImage(
                                                  "assets/images/images_news.jpg")
                                              as ImageProvider,
                                      fit: BoxFit.fill,
                                      filterQuality: FilterQuality.high)),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 22, 22),
                                  child: Text("${author}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(20, 150, 20, 0),
                                child: Text(
                                  "${desc}",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                            )
                          ],
                          fit: StackFit.passthrough,
                        );
                      },
                    ),
                  );
                }

                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}

Future<UserArticleModel> UserArticle() async {
  String url =
      "https://newsapi.org/v2/everything?q=keyword&apiKey=4b816d71d9524bdba2874cdcd77027c4";
  var res = await http.get(Uri.parse(url),
      headers: {"Authorization": "4b816d71d9524bdba2874cdcd77027c4"});
  //print(res.statusCode);
  //print(res.body);
  if (res.statusCode == 200) {
    var mData = jsonDecode(res.body);
    return UserArticleModel.fromJson(mData);
  } else {
    return UserArticleModel();
  }
}
// doubt 1 - Not able to change color to border of textfield at line no 69
//doubt 2 how to use published at
