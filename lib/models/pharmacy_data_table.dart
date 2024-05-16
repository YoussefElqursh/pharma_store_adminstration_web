import 'package:flutter/material.dart';

class PharmacyData {
  PharmacyData(this.id, this.photo, this.name, this.contactNumber, this.address,
      this.state, this.moreIcon);

  final int id;
  final String photo;
  final String name;
  final String contactNumber;
  final String address;
  final String state;

  final IconButton moreIcon;
}

List pharmacyDemoData = [
  PharmacyData(
      1,
      'Pharmaceuticals\nIbnsina',
      'Dr. Osama El Tayeby',
      '15-3-2014 2:20 PM',
      'Delivered',
      'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyData(
      2,
      'Avano Pharma\nIbnsina\nEl Motahadah',
      'El Nahas',
      '25-8-2020 10:30 AM',
      'Delivered',
      'Deactivated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyData(
      3,
      'El Motahadah\nIbnsina',
      '19011',
      '28-1-2023 9:25 PM',
      'On Hold',
      'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyData(
      4,
      'El Motahadah\nPharmaceuticals',
      'Zikry',
      '2-2-2023 12:20 AM',
      'On Way',
      'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyData(
      5,
      'Pharmaceuticals  ',
      'El Delta',
      '15-3-2014 8:20 AM',
      'On Way',
      'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyData(
      6,
      'Pharmaceuticals\nIbnsina',
      'Dr. Osama El Tayeby',
      '15-3-2014 2:20 PM',
      'Delivered',
      'Deactivated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyData(
      7,
      'Avano Pharma\nIbnsina\nEl Motahadah',
      'El Nahas',
      '25-8-2020 10:30 AM',
      'Delivered',
      'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyData(
      8,
      'El Motahadah\nIbnsina',
      '19011',
      '28-1-2023 9:25 PM',
      'On Hold',
      'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyData(
      9,
      'El Motahadah\nPharmaceuticals',
      'Zikry',
      '2-2-2023 12:20 AM',
      'On Way',
      'Deactivated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyData(
      10,
      'Pharmaceuticals  ',
      'El Delta',
      '15-3-2014 8:20 AM',
      'On Way',
      'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyData(
      11,
      'Pharmaceuticals  ',
      'El Delta',
      '15-3-2014 8:20 AM',
      'On Way',
      'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyData(
      1,
      'Pharmaceuticals\nIbnsina',
      'Dr. Osama El Tayeby',
      '15-3-2014 2:20 PM',
      'Delivered',
      'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyData(
      2,
      'Avano Pharma\nIbnsina\nEl Motahadah',
      'El Nahas',
      '25-8-2020 10:30 AM',
      'Delivered',
      'Deactivated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyData(
      3,
      'El Motahadah\nIbnsina',
      '19011',
      '28-1-2023 9:25 PM',
      'On Hold',
      'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyData(
      4,
      'El Motahadah\nPharmaceuticals',
      'Zikry',
      '2-2-2023 12:20 AM',
      'On Way',
      'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyData(
      5,
      'Pharmaceuticals  ',
      'El Delta',
      '15-3-2014 8:20 AM',
      'On Way',
      'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyData(
      6,
      'Pharmaceuticals\nIbnsina',
      'Dr. Osama El Tayeby',
      '15-3-2014 2:20 PM',
      'Delivered',
      'Deactivated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyData(
      7,
      'Avano Pharma\nIbnsina\nEl Motahadah',
      'El Nahas',
      '25-8-2020 10:30 AM',
      'Delivered',
      'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyData(
      8,
      'El Motahadah\nIbnsina',
      '19011',
      '28-1-2023 9:25 PM',
      'On Hold',
      'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyData(
      9,
      'El Motahadah\nPharmaceuticals',
      'Zikry',
      '2-2-2023 12:20 AM',
      'On Way',
      'Deactivated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyData(
      10,
      'Pharmaceuticals  ',
      'El Delta',
      '15-3-2014 8:20 AM',
      'On Way',
      'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyData(
      11,
      'Pharmaceuticals  ',
      'El Delta',
      '15-3-2014 8:20 AM',
      'On Way',
      'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
];
