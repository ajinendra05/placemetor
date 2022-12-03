import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:palcmentor/widgets/todolistchild.dart';

import '../widgets/todoinput.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List todo = ["Search For Softwear Job"];

  void addTransection(String title, DateTime date) {
    setState(() {
      if (title.isEmpty) return;

      todo.add(title);
    });
  }

  void openTransectionInputBar(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: ((bctx) {
        return GestureDetector(
          child: TransectionInput(addTransection),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment,
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            width: double.maxFinite,
            alignment: Alignment.center,
            // child: Card(
            //   elevation: 10,
            //   margin: EdgeInsets.all(5),
            //   child: Container(
            //     height: 45,
            //     width: 230,
            // alignment: Alignment.center,
            child: Text(
              'DOCKET',
              style: TextStyle(fontSize: 25, fontFamily: 'Pacifico'),
            ),
            //   ),
            // ),
          ),
          Container(
              width: 600,
              height: 600,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ToDoListChild(title: todo[index]);
                },
                itemCount: todo.length,
              )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (() => openTransectionInputBar(context)),
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
