import 'package:flutter/material.dart';
import 'package:vagos_app/model/menu_item.dart';

class MenuItems {

  static const List<MenuItem> itemsFirst = [
    itemGuardar,
    itemPartilhar,
    itemReportar,
    itemAutor,
  ];


  static const itemGuardar = MenuItem(
    text: 'Guardar',
    icon: Icons.bookmark_border_rounded,
  );

  static const itemPartilhar = MenuItem(
    text: 'Partilhar',
    icon: Icons.share_rounded,
  );

  static const itemReportar = MenuItem(
    text: 'Reportar',
    icon: Icons.flag_rounded,
  );

  static const itemAutor = MenuItem(
    text: 'Ver Autor',
    icon: Icons.person_search_rounded,
  );

}