class PharmaciesCardModel {
  PharmaciesCardModel(
      this.pharmacyName, this.pharmacyUserName, this.pharmacyImage);

  final String pharmacyName;
  final String pharmacyUserName;
  final String pharmacyImage;
}

//------------------------------------------------------------------------------
//this list data of PharmaciesCard

List<PharmaciesCardModel> pharmaciesList = [
  PharmaciesCardModel('Roshdy', '23147_Roshdy', ''),
  PharmaciesCardModel('Misr', '36985_Misr', ''),
  PharmaciesCardModel('Fouda', '23976_Fouda', ''),
  PharmaciesCardModel('El Ezaby', '23145_El-Ezaby', ''),
  PharmaciesCardModel('El Delta', '23145_El-Delta', ''),
];
