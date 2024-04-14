class ProductsCardModel{

  ProductsCardModel(this.productName, this.productUserName, this.productImage);
  final String productName;
  final String productUserName;
  final String productImage;
}

//------------------------------------------------------------------------------
//this list data of ProductsCard

List<ProductsCardModel> productsList = [
  ProductsCardModel('Aciclovir (Zovirax)', 'Ibnsina', ''),
  ProductsCardModel('Buprenorphine', 'Emeto  Winner', ''),
  ProductsCardModel('Colchicine', 'Pharmaceuticals', ''),
  ProductsCardModel('Ezetimibe', 'Ibnsina', ''),
  ProductsCardModel('Ibuprofen for children', 'Pharmaceuticals', ''),
];