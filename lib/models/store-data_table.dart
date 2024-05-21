
class StoreData {
  StoreData(this.id, this.photo, this.name, this.contactNumber, this.address, this.state,
      );

  final int id;
  final String photo;
  final String name;
  final String contactNumber;
  final String address;
  final String state;

}

List <StoreData>storeDemoData = [
  StoreData(
      1,
      'Pharmaceuticals\nIbnsina',
      'Dr. Osama El Tayeby',
      '15-3-2014 2:20 PM',
      'Delivered',"Activated"
  ),
  StoreData(
      2,
      'Avano Pharma\nIbnsina\nEl Motahadah',
      'El Nahas',
      '25-8-2020 10:30 AM',
      'Delivered',"Activated"
  ),
  StoreData(3, 'El Motahadah\nIbnsina', '19011', '28-1-2023 9:25 PM', 'On Hold',"Deactivated"
  ),
  StoreData(
      4,
      'El Motahadah\nPharmaceuticals',
      'Zikry',
      '2-2-2023 12:20 AM',
      'On Way',"Activated"
  ),
  StoreData(5, 'Pharmaceuticals  ', 'El Delta', '15-3-2014 8:20 AM', 'On Way',"Deactivated"
  ),
  StoreData(
      6,
      'Pharmaceuticals\nIbnsina',
      'Dr. Osama El Tayeby',
      '15-3-2014 2:20 PM',
      'Delivered',"Activated"
  ),
  StoreData(
      7,
      'Avano Pharma\nIbnsina\nEl Motahadah',
      'El Nahas',
      '25-8-2020 10:30 AM',
      'Delivered',"Deactivated"
  ),
  StoreData(8, 'El Motahadah\nIbnsina', '19011', '28-1-2023 9:25 PM', 'On Hold',"Deactivated"
  ),
  StoreData(
      9,
      'El Motahadah\nPharmaceuticals',
      'Zikry',
      '2-2-2023 12:20 AM',
      'On Way',"Deactivated"
  ),
  StoreData(10, 'Pharmaceuticals  ', 'El Delta', '15-3-2014 8:20 AM', 'On Way',"Deactivated"
  ),
  StoreData(11, 'Pharmaceuticals  ', 'El Delta', '15-3-2014 8:20 AM', 'On Way',"Deactivated"
  ),
  StoreData(12, 'Pharmaceuticals  ', 'El Delta', '15-3-2014 8:20 AM', 'On Way',"Deactivated"
  ),
];
