import 'package:flutter/cupertino.dart';
import 'package:pharma_store_administration_web/shared/my_icons_icons.dart';

class DataCardModel{

  DataCardModel(this.cardTitle, this.cardNumber, this.cardIcon, this.cardImage, this.cardPercentage, this.cardState, this.color);

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

List<DataCardModel> dataList = [
  DataCardModel('Total Products', '1250', MyIcons.product, 'assets/icons/path.svg', '15%', true,'#8280FF'),
  DataCardModel('Total Pharmacies', '500', MyIcons.pharmacy, 'assets/icons/path (1).svg', '3%', false,'#FEC53D'),
  DataCardModel('Total Sales', '100', MyIcons.store, 'assets/icons/path.svg', '6%', true,'#4AD991'),
  DataCardModel('Total Orders', '200', MyIcons.order, 'assets/icons/path (1).svg', '12%', false,'#FF9066'),
];
