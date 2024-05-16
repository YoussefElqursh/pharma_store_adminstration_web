import 'package:flutter/material.dart';

class NotificationData {
  NotificationData( this.photo, this.name,  this.address,
      this.state, this.moreIcon);

  final String photo;
  final String name;
  final String address;
  final String state;

  final IconButton moreIcon;
}

List notificationDemoData = [
  NotificationData(

      'Pharmaceuticals\nIbnsina',
      'Dr. Osama El Tayeby',
      '15-3-2014 2:20 PM',
      'pharmacy',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  NotificationData(

      'Avano Pharma\nIbnsina\nEl Motahadah',
      'El Nahas',
      '25-8-2020 10:30 AM',
      'store',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  NotificationData(
      'El Motahadah\nIbnsina',
      '19011',
      '28-1-2023 9:25 PM',
      'pharmacy',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  NotificationData(
      'El Motahadah\nPharmaceuticals',
      'Zikry',
      '2-2-2023 12:20 AM',
      'store',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  NotificationData(

      'Pharmaceuticals  ',
      'El Delta',
      '15-3-2014 8:20 AM',
      'pharmacy',

      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  NotificationData(
      'Pharmaceuticals\nIbnsina',
      'Dr. Osama El Tayeby',
      '15-3-2014 2:20 PM',
      'store',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  NotificationData(
      'Avano Pharma\nIbnsina\nEl Motahadah',
      'El Nahas',
      '25-8-2020 10:30 AM',
      'store',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  NotificationData(
      'El Motahadah\nIbnsina',
      '19011',
      '28-1-2023 9:25 PM',
      'store',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  NotificationData(

      'El Motahadah\nPharmaceuticals',
      'Zikry',
      '2-2-2023 12:20 AM',
      'store',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  NotificationData(
      'Pharmaceuticals  ',
      'El Delta',
      '15-3-2014 8:20 AM',
      'store',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
];
