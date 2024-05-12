class StoresCardModel {
  StoresCardModel(this.storeName, this.storeUserName, this.storeImage);

  final String storeName;
  final String storeUserName;
  final String storeImage;
}

//------------------------------------------------------------------------------
//this list data of StoresCard

List<StoresCardModel> storesList = [
  StoresCardModel('Ibnsina', '23147_Ibnsina', ''),
  StoresCardModel('El Motahadah', '36985_El-Motahadah', ''),
  StoresCardModel('Avano Pharma', '23976_AvanoPharma', ''),
  StoresCardModel('El Manar Pharm', '23145_ElManarPharm', ''),
  StoresCardModel('Graviola Egypt', '23145_GraviolaEgypt', ''),
];
