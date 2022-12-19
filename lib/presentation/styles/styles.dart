import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

Color primary = const Color(0xFF904CCF);
Color secondary = const Color.fromARGB(255, 178, 97, 212);

class Styles {
  static Color primaryColor = primary;
  static Color secondaryColor = secondary;

  static TextStyle interactbuttons =
      const TextStyle(fontSize: 12, color: Colors.grey);

  static TextStyle profiledescript =
      const TextStyle(fontSize: 11, color: Colors.grey);

  static Icon editIcon =
      const Icon(FluentSystemIcons.ic_fluent_document_edit_regular);

  static Icon deleteIcon =
      const Icon(FluentSystemIcons.ic_fluent_delete_regular);

  static Icon heartIcon =
      const Icon(CupertinoIcons.suit_heart_fill, color: Colors.grey);

  static Icon commentIcon =
      const Icon(CupertinoIcons.text_bubble_fill, color: Colors.grey);

  static Icon shareIcon =
      const Icon(CupertinoIcons.share_solid, color: Colors.grey);

  static Icon shareIcon2 = const Icon(CupertinoIcons.share);

  static Icon searchIcon = const Icon(CupertinoIcons.search);
  static Icon emojiIcon = const Icon(Icons.add_reaction_outlined);

  static Icon arrowupIcon = const Icon(CupertinoIcons.arrow_up_circle_fill);

  static Icon homeIcon = const Icon(CupertinoIcons.home);

  static Icon addIcon = const Icon(CupertinoIcons.add);

  static Icon barsIcon = const Icon(CupertinoIcons.bars);

  static Icon location =
      Icon(Icons.location_on_outlined, color: Colors.grey.shade700);
  static Icon company =
      Icon(Icons.apartment_rounded, color: Colors.grey.shade700);
  static Icon cellphone = Icon(Icons.phone_iphone, color: Colors.grey.shade700);

  static final styleReadMore =
      TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.bold);

  static Icon send = Icon(Icons.send);
}
