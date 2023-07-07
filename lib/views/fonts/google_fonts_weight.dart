import 'package:flutter/material.dart';

/// This class contains all the fonts weight of google fonts lib.
enum GoogleFontsWeight {
  // Weights:
  THIN(FontWeight.w100),
  EXTRA_LIGHT(FontWeight.w200),
  LIGHT(FontWeight.w300),
  REGULAR(FontWeight.w400),
  MEDIUM(FontWeight.w500),
  SEMI_BOLD(FontWeight.w600),
  BOLD(FontWeight.w700),
  EXTRA_BOLD(FontWeight.w800),
  BLACK(FontWeight.w900);

  // Fields:
  final FontWeight weight;

  // Constructor:
  const GoogleFontsWeight(this.weight);
}
