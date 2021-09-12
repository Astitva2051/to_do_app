import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/taskdonelist.dart';

class TaskDone extends StatefulWidget {
  const TaskDone({Key? key}) : super(key: key);

  @override
  _TaskDone createState() => _TaskDone();
}

class _TaskDone extends State<TaskDone> {
  Taskcmplt taskcmplt = Taskcmplt();

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
              height: MediaQuery.of(context).size.height / 25,
            ),
            Text("Task Completed ", style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),),
            SizedBox(height: MediaQuery.of(context).size.height / 25,),
            Container(
              width: MediaQuery.of(context).size.width ,
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              child: Consumer<Taskcmplt>(builder: (context,taskcmplt,_){
                return
              ListView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: Provider.of<Taskcmplt>(context,listen: false).taskdonelist.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      tileColor:
                          Color((Random().nextDouble() * 0xFFFFFF).toInt())
                              .withOpacity(0.5),
                      title: Text(Provider.of<Taskcmplt>(context,listen: false).taskdonelist[index]),
                      ),
                  );
                },
              );
              }
              )

            ),
          ],
        ),
      ),
    );
  }
}
