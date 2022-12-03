import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:palcmentor/model/teacherdetails.dart';
import 'package:palcmentor/widgets/teachershortprofile.dart';
import '../widgets/usershortprofile.dart';

class TandP extends StatefulWidget {
  TandP({super.key});

  @override
  State<TandP> createState() => _TandPState();
}

class _TandPState extends State<TandP> {
  final List<TeacherDetails> teacherDetails = [
    TeacherDetails(
        name: "jaimala Jha",
        dprt: "CSE",
        mobile_no: "7584961230",
        email: "jaimal.jha@gmail.com"),
    TeacherDetails(
        name: "Mahesh Parmar",
        dprt: "CSE",
        mobile_no: "4512369870",
        email: "mahesh@gmail.com"),
  ];

  @override
  Widget build(BuildContext context) {
    // FirebaseFirestore.instance
    //     .collection('teachersDetails')
    //     .snapshots()
    //     .listen((event) {
    //   event.docs.forEach((element) {
    //     setState(() {
    //       teacherDetails.add(TeacherDetails(
    //           name: element.get('name'),
    //           dprt: element.get('dprt'),
    //           mobile_no: element.get('mobile_no'),
    //           email: element.get('email')));
    //     });

    //     print("object ${element.get('name')}");
    //     print("object ${teacherDetails[0].name},${teacherDetails[0]}");
    //   });
    // });

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Card(
            elevation: 10,
            margin: EdgeInsets.all(5),
            child: Container(
              height: 45,
              width: 230,
              alignment: Alignment.center,
              child: Text(
                'T&P Coordinators',
                style: TextStyle(fontSize: 25, fontFamily: 'Pacifico'),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //   Container(
          //     width: double.infinity,
          //     height: 400,
          //     child: ListView(
          //       children: [
          //         ...teacherDetails.map((e) {
          //           return TeacherShortProfile(teacher: e);
          //         }).toList()
          //       ],
          //     ),
          //   ),
          // ]),
          // TeacherShortProfile(teacher: teacherDetails[1]),
          // teacherShortProfile(
          //   teacher: teacherDetails[0],
          // ),
          // teacherShortProfile(
          //   teacher: teacherDetails[1],
          // ),
          Container(
              height: 200,
              width: 500,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return TeacherShortProfile(teacher: teacherDetails[index]);
                },
                itemCount: teacherDetails.length,
              )
              // child: ListView(scrollDirection: Axis.horizontal, children: [
              //   SizedBox(
              //     width: 10,
              //   ),
              //   teacherShortProfile(teacher: teacherDetails[0],),
              //   teacherShortProfile(teacher: teacherDetails[1],)
              // ]),
              ),
        ],
      ),
    );
  }
}
