import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpre/home.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  String show = 'show';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  TextEditingController name = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController email = TextEditingController();

  void putdata(String value) async {
    SharedPreferences shad = await SharedPreferences.getInstance();
    shad.setString("value", value);
  }

  getdata() async {
    SharedPreferences shad = await SharedPreferences.getInstance();

    setState(() {
      show = shad.get("value").toString();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8))),
        title: Center(
            child: const Text(
          "Shared preference",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
        )),
        titleTextStyle: TextStyle(color: Color.fromARGB(255, 255, 248, 248)),
        backgroundColor: Color.fromARGB(255, 73, 133, 82),
      ),
      backgroundColor: Color.fromARGB(255, 210, 229, 245),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: name,
              decoration: InputDecoration(border: OutlineInputBorder())),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: email,
              decoration: InputDecoration(border: OutlineInputBorder())),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: password,
              decoration: InputDecoration(border: OutlineInputBorder())),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                show = name.text;
                putdata(name.text);
              });
            },
            child: Text('copy')),
        Text(show),
        ElevatedButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyWidget(),
                    ));
              });
            },
            child: Text("next"))
      ]),
    );
  }
}
