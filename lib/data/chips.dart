import 'package:flutter/material.dart';
import 'package:vagos_app/model/chips.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class FilterChips {
  static final all = <FilterChipData>[
    FilterChipData(
      label: 'Ecoturismo',
      isSelected: false,
      color: Color(0xff1A9DD9),
      icon: FontAwesomeIcons.leaf,
      iconColor: Color(0xff1A9DD9),
    ),
    FilterChipData(
      label: 'Cultura',
      isSelected: false,
      color: Color(0xff1A9DD9),
      icon: Icons.museum_rounded,              //FontAwesomeIcons.landmark,
      iconColor: Color(0xff1A9DD9),
    ),
    FilterChipData(
      label: 'Praias',
      isSelected: false,
      color: Color(0xff1A9DD9),
      icon: Icons.beach_access_rounded,       //FontAwesomeIcons.umbrellaBeach,
      iconColor: Color(0xff1A9DD9),
    ),
    FilterChipData(
      label: 'Estadia',
      isSelected: false,
      color: Color(0xff1A9DD9),
      icon: Icons.hotel_rounded,          //FontAwesomeIcons.bed,
      iconColor: Color(0xff1A9DD9),
    ),
    FilterChipData(
      label: 'Religião',
      isSelected: false,
      color: Color(0xff1A9DD9),
      icon: FontAwesomeIcons.cross,      //FontAwesomeIcons.church,
      iconColor: Color(0xff1A9DD9),
    ),
    FilterChipData(
      label: 'Diversão',
      isSelected: false,
      color: Color(0xff1A9DD9),
      icon: Icons.attractions,
      iconColor: Color(0xff1A9DD9),
    ),
    FilterChipData(
      label: 'Lazer',
      isSelected: false,
      color: Color(0xff1A9DD9),
      icon: Icons.nature_people_rounded,
      iconColor: Color(0xff1A9DD9),
    ),
  ];
}
