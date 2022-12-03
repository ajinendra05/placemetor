import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:palcmentor/model/oncampous_intern_data.dart';

import '../widgets/intern_data_widget.dart';

class FavoritList extends StatelessWidget {
  FavoritList({super.key, required this.interndetailsList});
  final List<InternDetails> interndetailsList;
  final List<InternDetails> favoriteIntern = [];
  void FavListGenerator() {
    for (int i = 0; i < 3; i++) {
      if (interndetailsList[i].isfavorite) {
        favoriteIntern.add(interndetailsList[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    FavListGenerator();
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
                'Field Of Interest',
                style: TextStyle(fontSize: 25, fontFamily: 'Pacifico'),
              ),
            ),
          ),
          Container(
            width: 500,
            height: 600,
            child: ListView(
              children: [
                ...favoriteIntern.map((e) {
                  return InternDetail(data: e);
                }).toList()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
