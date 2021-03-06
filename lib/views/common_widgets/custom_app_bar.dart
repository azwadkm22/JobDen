
import 'package:flutter/material.dart';

import 'color_palette.dart';
import 'logout_button.dart';

class CustomAppBar extends AppBar {
  final String label;
  final String assetLink = "assets/icon.png";
  bool showLogout;
  CustomAppBar({Key? key, required this.label, this.showLogout = true, logoInstead = false}): super(key: key,
  centerTitle: true,

  title: logoInstead ?
      SizedBox(height: 120, child: Image.asset("assets/icon.png"))
      :
  Text(label,
  textAlign: TextAlign.center,
  style: const TextStyle(color: ColorPalette.blue,
  ),
  ),

  iconTheme: const IconThemeData(
    color: ColorPalette.blue, //change your color here
  ),
  backgroundColor: ColorPalette.backgroundColor,
  bottom: PreferredSize(
  child: Container(
  color: ColorPalette.blue,
  height: 4.0,
  ),
  preferredSize: const Size.fromHeight(4.0)),
  actions: showLogout ? [
  LogoutButton(),
  ] : [],
  );
}