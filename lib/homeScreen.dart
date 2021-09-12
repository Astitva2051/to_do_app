import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/taskdonelist.dart';
import 'package:to_do_app/todolist.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _item = TextEditingController();
  var uuid = Uuid();
  // ToDo todo = ToDo();
  // Taskcmplt taskcmplt = Taskcmplt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "To Do App",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width / 2,
                child: TextField(
                  controller: _item,
                  decoration: InputDecoration(
                    hintText: "Write here ...",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 2),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (_item.text != "") {
                    Provider.of<ToDo>(context, listen: false)
                        .Additem(_item.text);
                    _item.text = "";
                  } else {
                    SnackBar(content: Text("Please enter a Task"));
                  }
                },
                icon: Icon(Icons.add),
                color: Colors.green,
              ),
            ]),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            Text(
              "Task Pending ",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                child: Consumer<ToDo>(builder: (context, todo, _) {
                  return ListView.builder(
                    physics: ClampingScrollPhysics(),
                    itemCount: Provider.of<ToDo>(context, listen: false)
                        .todolist
                        .length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Dismissible(
                          key: ValueKey(uuid.v4()),
                          onDismissed: (direction) {
                            print("dismissed");
                            if (direction == DismissDirection.startToEnd) {
                              Provider.of<ToDo>(context, listen: false)
                                  .Deleteitem(index);

                              SnackBar(
                                content: Text("Task Deleted"),
                              );
                            } else {
                              Provider.of<Taskcmplt>(context, listen: false)
                                  .addtask(todo.todolist[index]);
                              Provider.of<ToDo>(context, listen: false)
                                  .Deleteitem(index);

                              SnackBar(
                                content: Text("Task marked as completed"),
                              );
                            }
                          },
                          background: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              alignment: AlignmentDirectional.centerStart,
                              color: Colors.red,
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          secondaryBackground: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              alignment: AlignmentDirectional.centerEnd,
                              color: Colors.green,
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            
                            tileColor: Color(
                                    (Random().nextDouble() * 0xFFFFFF).toInt())
                                .withOpacity(0.5),
                            title: Text(
                                Provider.of<ToDo>(context, listen: false)
                                    .todolist[index]),
                            trailing: TextButton(
                              child: Text(
                                "Done",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w100),
                              ),
                              onPressed: () {
                                Provider.of<Taskcmplt>(context, listen: false)
                                    .addtask(todo.todolist[index]);
                                Provider.of<ToDo>(context, listen: false)
                                    .Deleteitem(index);
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  );
                })),
          ],
        ),
      ),
    );
  }
}
