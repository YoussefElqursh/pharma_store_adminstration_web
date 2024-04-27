import 'package:flutter/material.dart';

class PharmacyDataModel {

  PharmacyDataModel(this.id, this.photo, this.name, this.contact, this.address, this.state, this.moreIcon);
  final int id;
  final String photo;
  final String name;
  final String contact;
  final String address  ;
  final String state;
  final IconButton moreIcon;
}

