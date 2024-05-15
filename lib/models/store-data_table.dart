import 'package:flutter/material.dart';

class StoreData {
  StoreData(this.id, this.photo, this.name, this.contactNumber, this.address,
      this.moreIcon);

  final int id;
  final String photo;
  final String name;
  final String contactNumber;
  final String address;
  final IconButton moreIcon;
}

List storeDemoData = [
  StoreData(
      1,
      'Pharmaceuticals\nIbnsina',
      'Dr. Osama El Tayeby',
      '15-3-2014 2:20 PM',
      'Delivered',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  StoreData(
      2,
      'Avano Pharma\nIbnsina\nEl Motahadah',
      'El Nahas',
      '25-8-2020 10:30 AM',
      'Delivered',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  StoreData(3, 'El Motahadah\nIbnsina', '19011', '28-1-2023 9:25 PM', 'On Hold',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  StoreData(
      4,
      'El Motahadah\nPharmaceuticals',
      'Zikry',
      '2-2-2023 12:20 AM',
      'On Way',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  StoreData(5, 'Pharmaceuticals  ', 'El Delta', '15-3-2014 8:20 AM', 'On Way',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  StoreData(
      6,
      'Pharmaceuticals\nIbnsina',
      'Dr. Osama El Tayeby',
      '15-3-2014 2:20 PM',
      'Delivered',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  StoreData(
      7,
      'Avano Pharma\nIbnsina\nEl Motahadah',
      'El Nahas',
      '25-8-2020 10:30 AM',
      'Delivered',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  StoreData(8, 'El Motahadah\nIbnsina', '19011', '28-1-2023 9:25 PM', 'On Hold',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  StoreData(
      9,
      'El Motahadah\nPharmaceuticals',
      'Zikry',
      '2-2-2023 12:20 AM',
      'On Way',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  StoreData(10, 'Pharmaceuticals  ', 'El Delta', '15-3-2014 8:20 AM', 'On Way',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  StoreData(11, 'Pharmaceuticals  ', 'El Delta', '15-3-2014 8:20 AM', 'On Way',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  StoreData(12, 'Pharmaceuticals  ', 'El Delta', '15-3-2014 8:20 AM', 'On Way',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),

];
