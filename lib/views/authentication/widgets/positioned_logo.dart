import 'package:flutter/material.dart';

class PositionedLogo extends Row {
  PositionedLogo({Key? key,
    String assetLink = "assets/icon.png",
}) :
        super(key: key,
          children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),

          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
              alignment: Alignment.center,
              child: Image.asset(assetLink),
            ),
          ),

          Expanded(
            flex: 1,
          child: Container(),
          ),

          ],
          );
}