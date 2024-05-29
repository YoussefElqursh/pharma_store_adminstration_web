class OrderDataModel {
  OrderDataModel(this.id, this.dateAndTime, this.itemsQuantity, this.totalPrice,
      this.status);

  final int id;
  final String dateAndTime;
  final String itemsQuantity;
  final String totalPrice;
  final String status;
}

List<OrderDataModel> orderDemoData = [
  OrderDataModel(1, "20/1/2024 , 02:50 PM", '120 items', 'EGP 15550', 'On Way'),
  OrderDataModel(
      2, "b20/1/2024 , 02:50 ", '120 items', 'EGP 15550', 'Delivered'),
  OrderDataModel(
      3, "ta20/1/2024 , 02:50 ", '120 items', 'EGP 15550', 'Delivered'),
  OrderDataModel(
      4, "16/6/2023 , 01:00 PM", '120 items', 'EGP 15550', 'On Hold'),
  OrderDataModel(
      5, "16/6/2023 , 01:00 PM ", '120 items', 'EGP 15550', 'Canceled'),
  OrderDataModel(
      6, "16/6/2023 , 01:00 PM", '120 items', 'EGP 15550', 'Delivered'),
  OrderDataModel(
      7, "16/6/2023 , 01:00 PM", '120 items', 'EGP 15550', 'On Hold'),
  OrderDataModel(8, "16/6/2023 , 01:00 PM", '120 items', 'EGP 15550', 'On Way'),
  OrderDataModel(9, "16/6/2023 , 01:00 PM", '120 items', 'EGP 15550', 'On Way'),
  OrderDataModel(
      10, "16/6/2023 , 01:00 PM", '120 items', 'EGP 15550', 'Delivered'),
];
