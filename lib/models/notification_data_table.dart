class NotificationData {
  NotificationData(this.photo, this.name, this.address, this.state, this.id);

  final int id;

  final String photo;
  final String name;
  final String address;
  final String state;
}

List<NotificationData> notificationDemoData = [
  NotificationData('Pharmaceuticals\nIbnsina', 'Dr. Osama El Tayeby',
      '15-3-2014 2:20 PM', 'pharmacy', 1),
  NotificationData('Avano Pharma\nIbnsina\nEl Motahadah', 'El Nahas',
      '25-8-2020 10:30 AM', 'store', 2),
  NotificationData(
      'El Motahadah\nIbnsina', '19011', '28-1-2023 9:25 PM', 'pharmacy', 3),
  NotificationData('El Motahadah\nPharmaceuticals', 'Zikry',
      '2-2-2023 12:20 AM', 'store', 4),
  NotificationData(
      'Pharmaceuticals  ', 'El Delta', '15-3-2014 8:20 AM', 'pharmacy', 5),
  NotificationData('Pharmaceuticals\nIbnsina', 'Dr. Osama El Tayeby',
      '15-3-2014 2:20 PM', 'store', 6),
  NotificationData('Avano Pharma\nIbnsina\nEl Motahadah', 'El Nahas',
      '25-8-2020 10:30 AM', 'store', 7),
  NotificationData(
      'El Motahadah\nIbnsina', '19011', '28-1-2023 9:25 PM', 'store', 8),
  NotificationData('El Motahadah\nPharmaceuticals', 'Zikry',
      '2-2-2023 12:20 AM', 'store', 9),
  NotificationData(
      'Pharmaceuticals  ', 'El Delta', '15-3-2014 8:20 AM', 'store', 10),
];
