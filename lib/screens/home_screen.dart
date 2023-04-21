import 'package:flutter/material.dart';
import 'package:flutter_app/screens/task_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _formData = TextEditingController();
  String textValue = "";

  //  this list will contain all the todos
  List todoList = [];

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat(" kk:mm:ss \n EEE d MMM").format(now);
    return Scaffold(
      backgroundColor: Colors.red.shade300,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  "Good Afternoon, Smriti",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "its ${formattedDate}",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    controller: _formData,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter an item",
                      // prefixIcon: Icon(Icons.airplane_ticket),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // textValue=_formData.text;
                    // map
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
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white70,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                              value: item['checked'],
                              onChanged: (value) {
                                for (var i = 0; i < todoList.length; i++) {
                                  if (todoList[i] == item) {
                                    // print(todoList[i]);
                                    setState(() {
                                      todoList[i]['checked'] =
                                          !todoList[i]['checked'];
                                    });
                                  }
                                }
                              }),
                          GestureDetector(
                              onTap: () {
                                print("tap");
                                Get.to(
                                  TaskScreen(),
                                  // transition: Transition.rightToLeft,
                                  // transition: Transition.zoom,
                                  transition: Transition.fade,
                                );
                                // Navigator.push(
                                // context,
                                //  MaterialPageRoute(
                                //   builder: (_)=>TaskScreen(),
                                //   ),
                                //   );
                              },
                              child: Text(item['task'])),
                          Icon(item['icon']),
                          // Text("Course for 4th sem"),
                          // Icon(Icons.task_outlined),
                        ],
                      ),
                    );
                  },
                )
                // if(textValue != "")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
