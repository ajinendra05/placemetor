import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Resources extends StatefulWidget {
  const Resources({super.key});

  @override
  State<Resources> createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SizedBox(
          height: 50,
        ),
        Card(
          elevation: 10,
          margin: EdgeInsets.all(5),
          child: Container(
            height: 50,
            width: 230,
            alignment: Alignment.center,
            child: Text(
              'Resources',
              style: TextStyle(fontSize: 25, fontFamily: 'Pacifico'),
            ),
          ),
        ),
        Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          margin: EdgeInsets.all(8),
          child: Container(
            height: 100,
            width: 500,
            alignment: Alignment.center,
            child: Text(
              'Sample Resume \n This repo contains all the resume of students',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'LibreBaskerville',
              ),
            ),
          ),
        ),
        Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          margin: EdgeInsets.all(8),
          child: Container(
            height: 100,
            width: 500,
            alignment: Alignment.center,
            child: Text(
              'Tutorial Video Link \n This contain tutorial videos for interview preparation',
              style: TextStyle(fontSize: 20, fontFamily: 'LibreBaskerville'),
            ),
          ),
        ),
      ]),
    );
  }
}
