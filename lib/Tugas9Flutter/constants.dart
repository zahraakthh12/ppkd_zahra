import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppImages {
  static const assetImage = "assets/images";
  static const kardus = "$assetImage/kardus.jpg";
  static const botol = "$assetImage/botol.jpg";
  static const gelas = "$assetImage/gelas.jpg";
  static const karung = "$assetImage/karung.jpg";
  static const jerigen = "$assetImage/jerigen.jpg";
  static const koran = "$assetImage/koran.jpg";
  static const besi = "$assetImage/besi.jpg";
  static const kulkas = "$assetImage/kulkas.jpg";
  static const mesincuci = "$assetImage/mesincuci.jpg";
  static const laptop = "$assetImage/laptop.jpg";
  static const girl = "$assetImage/girl.jpg";
}

extension CurrencyFormatter on String {
  String toRPCurrency() {
    final number = int.tryParse(this);
    if (number != null) {
      final formatter = NumberFormat.currency(locale: 'id_IDR', symbol: 'Rp');
      return formatter.format(number).replaceAll(RegExp(r',00$'), '');
    }
    return this;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SecondHandModel {
  final String name;
  final int price;
  final String condition;
  final String image;
  final Color? backgroundColor;
  SecondHandModel({
    required this.name,
    required this.price,
    required this.condition,
    required this.image,
    this.backgroundColor,
  });
}