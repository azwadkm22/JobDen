import 'package:flutter/material.dart';
import 'package:job_den/color_palette.dart';
import 'package:job_den/generic_button.dart';

class ViewDetailsButton extends GenericButton {
  ViewDetailsButton({
    required VoidCallback onPressed,
  }) :
        super(label: "View Details", onPressed: onPressed, borderRadius: 8, fontSize: 16, padding: 0);
}