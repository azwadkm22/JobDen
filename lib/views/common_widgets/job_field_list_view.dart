import 'package:flutter/material.dart';
import 'color_palette.dart';

class JobFieldListView extends StatelessWidget {
  final List jobType;
  const JobFieldListView({required this.jobType,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: jobType.map((e) {
          return Container(
            padding: EdgeInsets.fromLTRB(6, 4, 6, 4),
            margin: EdgeInsets.only(right: 5),
            child: Text(
              e,
              style: const TextStyle(
                fontSize: 13,
                color: ColorPalette.black,
              ),
            ),
            decoration: BoxDecoration(
                color: ColorPalette.white,
                borderRadius: BorderRadius.circular(3)),
          );
        }).toList());
  }
}
