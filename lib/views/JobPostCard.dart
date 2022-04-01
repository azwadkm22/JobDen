import 'package:flutter/material.dart';

// ignore: empty_constructor_bodies
class JobPostCard extends GestureDetector {
  JobPostCard({
    Color bgColor = Colors.white,
    required String title,
    required String id,
    required VoidCallback onPressed,
  }) :
        super  (
          onTap: onPressed,
          child: Container(
            color: bgColor,
            margin: EdgeInsets.all(5.0),
            child: Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(title,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
            ),
          );
}