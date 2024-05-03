import 'package:flutter/cupertino.dart';
import 'package:pharma_store_administration_web/shared/my_icons_icons.dart';

class PharmacyCardModel{

  PharmacyCardModel(this.cardTitle, this.cardNumber, this.cardIcon, this.cardImage, this.cardPercentage, this.cardState, this.color);

  final String cardTitle;
  final String cardNumber;
  final String cardImage;
  final IconData cardIcon;
  final String color;
  final String cardPercentage;
  final bool cardState;
}

//------------------------------------------------------------------------------
//this list data of card

List<PharmacyCardModel> pharmacyDataList = [
  PharmacyCardModel('Total Orders', '500', MyIcons.pharmacy, 'assets/icons/path (1).svg', '3%', false,'#FEC53D'),
  PharmacyCardModel('Total Sales', 'EGP 23980', MyIcons.store, 'assets/icons/path.svg', '6%', true,'#4AD991'),
];
