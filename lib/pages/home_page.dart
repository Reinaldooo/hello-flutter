import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:helloworld/pages/image_detail.dart';
import 'package:http/http.dart' as http;
//
import 'package:helloworld/env.dart';
import '../drawer.dart';

class ScreenArguments {
  final String url;

  ScreenArguments(this.url);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic _data;
  int _nextPage = 1;
  int _totalPages = -1;
  bool _isLoading = false;

  fetchData() async {
    setState(() {
      _data = null;
      _isLoading = true;
    });
    Uri uri = Uri.https('api.unsplash.com', '/search/photos', {
      // TODO: find a better way to use ENV vars
      'client_id': clientId,
      'query': 'car',
      'orientation': 'squarish',
      'per_page': '12',
      'page': _nextPage.toString()
    });
    var result = await http.get(uri);
    setState(() {
      _nextPage++;
      _data = jsonDecode(result.body)['results'];
      _totalPages = jsonDecode(result.body)['total_pages'];
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _data != null
          ? Column(
              children: [
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: _data.length,
                  itemBuilder: (context, idx) {
                    return GestureDetector(
                      child: Image.network(_data[idx]["urls"]["thumb"]),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ImageDetail.routeName,
                          arguments:
                              ScreenArguments(_data[idx]["urls"]["full"]),
                        );
                        ;
                      },
                    );
                  },
                  shrinkWrap: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Página ${_nextPage - 1} de $_totalPages",
                  style:
                      const TextStyle(fontSize: 18, color: Colors.deepPurple),
                )
              ],
            )
          : Visibility(
              visible: _isLoading,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
          onPressed: fetchData,
          tooltip: 'Set caption',
          child: _nextPage == 1
              ? const Icon(Icons.search_outlined)
              : const Icon(Icons.navigate_next_outlined)),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerFloat, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
