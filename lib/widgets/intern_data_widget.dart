import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:palcmentor/Screen/jobDescription.dart';
import '../model/oncampous_intern_data.dart';
import 'package:intl/intl.dart';

class InternDetail extends StatefulWidget {
  const InternDetail({super.key, required this.data});
  final InternDetails data;

  @override
  State<InternDetail> createState() => _InternDetailState();
}

class _InternDetailState extends State<InternDetail> {
  bool getFavorite(e) {
    if (e.isfavorite == null) e.isfavorite = false;
    return e.isfavorite;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Within the `FirstRoute` widget

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => JobDescription(
                    data: widget.data,
                  )),
        );
      },
      child: Container(
        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
        height: 110,
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
          elevation: 7,
          shadowColor: Color.fromARGB(255, 129, 129, 127),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: 60,
                    // height: 70,
                    child: widget.data.img.isEmpty
                        ? Image.asset(
                            'assets/images/job-offer.png',
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/2895265.jpg',
                            // widget.data.img,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        width: 260,
                        child: Text(
                          widget.data.category,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Oswald',
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        width: 260,
                        margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(
                          widget.data.company,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Oswald',
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      DateFormat.yMMMd().format(widget.data.todayDaaate),
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Container(
                    width: 200,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      '${widget.data.package} LPA',
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  InkWell(
                    splashColor: Color.fromARGB(255, 197, 35, 84),
                    radius: 10,
                    onTap: (() {
                      setState(() {
                        // getFavorite(widget.data)
                        //     ? widget.data.isfavorite = false
                        //     : widget.data.isfavorite = true;
                        if (getFavorite(widget.data)) {
                          FirebaseFirestore.instance
                              .collection('InternDetails')
                              .doc(widget.data.cloudID)
                              .update({'fav': false});
                        } else {
                          FirebaseFirestore.instance
                              .collection('InternDetails')
                              .doc(widget.data.cloudID)
                              .update({'fav': true});
                        }
                      });
                    }),
                    child: Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        width: 30,
                        child: (getFavorite(widget.data)
                            ? Icon(
                                Icons.favorite,
                                color: Color.fromARGB(255, 197, 35, 84),
                              )
                            : Icon(Icons.favorite_border,
                                color: Color.fromARGB(255, 197, 35, 84)))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
