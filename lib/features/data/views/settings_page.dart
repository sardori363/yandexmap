import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hw26/features/data/models/result.dart';
import 'package:hw26/features/data/services/network_service.dart';

class YandexPage extends StatefulWidget {
  const YandexPage({super.key});

  @override
  State<YandexPage> createState() => _YandexPageState();
}

class _YandexPageState extends State<YandexPage> {
  TextEditingController loc = TextEditingController();
  Result? result; // Declare Result outside of resToObject
  String address = "";

  void getSearchedLoc(String loc) async {
    var resultString = await NetService.searchLocation(loc);
    setState(() {
      print(resultString);
      print(resultString is Map<String, dynamic>);
      // address = resultString ?? "null";
      resToObject(resultString);
      // print(Result.fromJson(jsonDecode(resultString!)));
    });
  }

  void resToObject(Map<String, dynamic> json) {
    try {
      result = Result.fromJson(json);
      print(result?.results ?? "null");
    } catch (e) {
      print("Error decoding JSON: $e");
      result = null;
    }
  }

  @override
  void initState() {
    getSearchedLoc("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: TextField(
            controller: loc,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: "Search for a location",
            ),
            onChanged: (value) {
              getSearchedLoc(value);
            },
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/a.jpg'),
            fit: BoxFit.cover
          )
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: ListView.builder(
          itemCount: result?.results?.length ?? 0,
          itemBuilder: (_, index) {
            var item = result?.results?[index];
            return ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 152, 150, 150).withOpacity(0.2)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${item?.title?.text}", style: TextStyle(color: Colors.white, fontSize: 18),),
                  SizedBox(height: 10,),
                  Text("${item?.subtitle?.text}", style: TextStyle(color: Colors.white),)
                ],
              ),
            )
                ));
          },
        ),
      ),
    );
  }
}
