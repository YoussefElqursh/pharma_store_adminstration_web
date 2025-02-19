import 'package:flutter/material.dart';

class StoreOrderData {
  StoreOrderData(
      this.id, this.from, this.to, this.date, this.state, this.moreIcon);

  final int id;
  final String from;
  final String to;
  final String date;
  final String state;
  final IconButton moreIcon;
}

List<StoreOrderData> storeOrderDemoData = [
  StoreOrderData(
      1,
      'Pharmaceuticals\nIbnsina',
      'Dr. Osama El Tayeby',
      '15-3-2014 2:20 PM',
      'Delivered',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  StoreOrderData(
      2,
      'Avano Pharma\nIbnsina\nEl Motahadah',
      'El Nahas',
      '25-8-2020 10:30 AM',
      'Canceled',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  StoreOrderData(
      3,
      'El Motahadah\nIbnsina',
      '19011',
      '28-1-2023 9:25 PM',
      'On Hold',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  StoreOrderData(
      4,
      'El Motahadah\nPharmaceuticals',
      'Zikry',
      '2-2-2023 12:20 AM',
      'On Way',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  StoreOrderData(
      5,
      'Pharmaceuticals  ',
      'El Delta',
      '15-3-2014 8:20 AM',
      'On Way',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  StoreOrderData(
      6,
      'Pharmaceuticals\nIbnsina',
      'Dr. Osama El Tayeby',
      '15-3-2014 2:20 PM',
      'Delivered',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  StoreOrderData(
      7,
      'Avano Pharma\nIbnsina\nEl Motahadah',
      'El Nahas',
      '25-8-2020 10:30 AM',
      'Delivered',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  StoreOrderData(
      8,
      'El Motahadah\nIbnsina',
      '19011',
      '28-1-2023 9:25 PM',
      'On Hold',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  StoreOrderData(
      9,
      'El Motahadah\nPharmaceuticals',
      'Zikry',
      '2-2-2023 12:20 AM',
      'On Way',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  StoreOrderData(
      10,
      'Pharmaceuticals  ',
      'El Delta',
      '15-3-2014 8:20 AM',
      'On Way',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
];
