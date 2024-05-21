
class PharmacyOrderDataModel {
  PharmacyOrderDataModel(this.id, this.from, this.to, this.date, this.status);

  final int id;
  final String from;
  final String to;
  final String date;
  final String status;
}
List<PharmacyOrderDataModel> pharmacyOrderDemoData = [
  PharmacyOrderDataModel(1, "sina", 'alex', '22/7', 'On Way'),
  PharmacyOrderDataModel(2, "banha", 'amria', '25/6', 'Delivered'),
  PharmacyOrderDataModel(3, "tanta", 'cairo', '1/5', 'Delivered'),
  PharmacyOrderDataModel(4, "zifta", 'bhira', '8/1', 'On Hold'),
  PharmacyOrderDataModel(5, "bort said", 'asfra', '8/2', 'Canceled'),
  PharmacyOrderDataModel(6, "cairo", 'safa', '9/7', 'Delivered'),
  PharmacyOrderDataModel(7, "fayoum", 'sina', '2/7', 'On Hold'),
  PharmacyOrderDataModel(8, "sadat", 'tanta', '9/4', 'On Way'),
  PharmacyOrderDataModel(9, "smoha", 'zifta', '8/7', 'On Way'),
  PharmacyOrderDataModel(10, "asfra", 'matrouh', '4/7', 'Delivered'),
];
