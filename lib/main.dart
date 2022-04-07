
import 'package:flutter/material.dart';
import 'dart:convert';
// import 'dart:html';
import 'package:http/http.dart' as http;

void main() {
  runApp(new oneApp());
}
// stateful cause it usees more states
class oneApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return oneAppState();
  }

}


// State Object
class oneAppState extends State<oneApp> {
// _ represents static vairable
  var _isLoading = true;
  

  fecthData() async {
  print("Attempting to fetch data from network");
// // API To Fetch Data
  final url = ("https://jsonplaceholder.typicode.com/photos");
  final response = await http.get(Uri.parse(url));
    // If the server did return a 200 OK response,
    // then parse the JSON.
  if (response.statusCode == 200) {
    // print(response.body);
    final map = json.decode(response.body);
    final titlesJson = map["title"];
    titlesJson.forEach((titles) {
      // print(titles["title"]);
    });
    print(map["title"]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Data');
  }
}

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("One"),
          actions: <Widget> [
            new IconButton(icon: new Icon(Icons.refresh),
             onPressed: () { 
               print("reloading...");
               setState(() {
                //  Sets the state
                 _isLoading = false;
               });
               fecthData();
              },)
          ],
        ),
        body: new Center(
          // reevaluate sentence with new state
          child: _isLoading ? new CircularProgressIndicator() :
          new Text("Finished Loading..."),
        ),
        ),
    );
  }
}