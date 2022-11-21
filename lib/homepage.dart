import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'nextpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController editingController = TextEditingController();
  var addDatatable;
  addData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    addDatatable = sharedPreferences.setString("sazid", editingController.text);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [Icon(Icons.ac_unit)],
        ),
        body: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                controller: editingController,
                decoration: InputDecoration(hintText: "Nextpage"),
              ),
            ),
            MaterialButton(
              onPressed: () {
                addData();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyWidget()));
                print(addDatatable);
              },
              child: Text("Next page"),
              color: Colors.red,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyWidget()));
                },
                child: Text("Onm"))
          ],
        )),
      ),
    );
  }
}
