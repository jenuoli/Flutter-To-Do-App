import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _formData = TextEditingController();
  String textValue = "";
  List todoList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "My college is Padmakanya",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("It's Tuesday,Jenu's fasting"),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFormField()),
                  TextFormField(
                    controller: _formData,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter a item",
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //textValue = _formData.text;
                      todoList.add({
                        "task": _formData.text,
                        "icon": Icons.task,
                        "checked": false,
                      });
                      _formData.text = "";
                      print(_formData.text);
                      setState(() {});
                    },
                    child: Text("Add"),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: todoList.length,
                    itemBuilder: (context, index) {
                      var item = todoList[index];
                      return Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(11.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(
                              value: item['checked'],
                              onChanged: (value) {
                                todoList.forEach((element) {
                                  print(element);
                                });
                              },
                            ),
                            Text(item['task']),
                            Icon(item['icon']),
                          ],
                        ),
                      );
                    },
                  ),
                  //if(textValue!="")
                ],
              ),
            ),
          ),
        ));
  }
}
