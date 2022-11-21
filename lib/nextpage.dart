import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var getdatavariable;
  var deletebtn;

  getdata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    getdatavariable = sharedPreferences.getString("sazid").toString();
    setState(() {});
  }

  deletefctn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    deletebtn = await sharedPreferences.remove("sazid");
  }

  void initState() {
    getdata();
    deletefctn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$getdatavariable"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  deletefctn();
                });
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: Column(
        children: [
          Container(child: Center(child: Text("$getdatavariable"))),
          IconButton(
              onPressed: () {
                print(getdatavariable);
                setState(() {
                  deletefctn();
                });
              },
              icon: Icon(Icons.reddit))
        ],
      ),
    );
  }
}
