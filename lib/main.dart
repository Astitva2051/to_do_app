import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/homeScreen.dart';
import 'package:to_do_app/taskdoneScreen.dart';
import 'package:to_do_app/taskdonelist.dart';
import 'package:to_do_app/todolist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context) => ToDo()),
      ChangeNotifierProvider(create: (context) => Taskcmplt())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: SwipeScreen(),
      ),
    );
  }
}

class SwipeScreen extends StatefulWidget {
  SwipeScreen({Key? key}) : super(key: key);

  @override
  _SwipeScreenState createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        HomePage(),
        TaskDone(),
      ],
    );
  }
}
