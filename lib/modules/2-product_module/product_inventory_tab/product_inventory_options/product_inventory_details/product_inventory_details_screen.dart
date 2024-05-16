import 'package:flutter/material.dart';
import 'package:pharma_store_administration_web/modules/2-product_module/products_module.dart';
import 'package:pharma_store_administration_web/shared/components/functions.dart';
import 'package:pharma_store_administration_web/shared/components/widget/back_screen_header.dart';

class ProductInventoryDetailsScreen extends StatefulWidget {
  const ProductInventoryDetailsScreen({super.key});

  @override
  State<ProductInventoryDetailsScreen> createState() =>
      _ProductInventoryDetailsScreenState();
}

class _ProductInventoryDetailsScreenState
    extends State<ProductInventoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackScreenHeader(
          backScreenName: 'Products',
          goBack: () {
            Navigator.push(context, ProductsScreen.route());
          },
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFDDE1EB),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.only(left: 30.0, top: 25.0, bottom: 25.0),
                      child: Text(
                        'Product Details',
                        style: TextStyle(
                          color: Color(0xFF23262A),
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: Color(0xFFDDE1EB),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Wrap(
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 30.0),
                                        child: Text(
                                          'Basic Details:',
                                          style: TextStyle(
                                            color: Color(0xFF23262A),
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 90),
                                        child: Text(
                                          'Product Image:',
                                          style: TextStyle(
                                            color: Color(0xFF60656E),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 30),
                                        child: Text(
                                          'Product Name:',
                                          style: TextStyle(
                                            color: Color(0xFF60656E),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 30),
                                        child: Text(
                                          'Category:',
                                          style: TextStyle(
                                            color: Color(0xFF60656E),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 30),
                                        child: Text(
                                          'Quantity Per Package:',
                                          style: TextStyle(
                                            color: Color(0xFF60656E),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 30),
                                        child: Text(
                                          'Public Price:',
                                          style: TextStyle(
                                            color: Color(0xFF60656E),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 30),
                                        child: Text(
                                          'Manufacturer Company:',
                                          style: TextStyle(
                                            color: Color(0xFF60656E),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 30),
                                        child: Text(
                                          'Drug Class:',
                                          style: TextStyle(
                                            color: Color(0xFF60656E),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 30),
                                        child: Text(
                                          'Active Ingredients:',
                                          style: TextStyle(
                                            color: Color(0xFF60656E),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 145),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 40, top: 35),
                                        child: Container(
                                          width: 80,
                                          height: 80,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                          ),
                                          child: setPhoto(
                                              kind: 0,
                                              path: 'assets/images/drug.png',
                                              width: 60,
                                              height: 60),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 30),
                                        child: Text(
                                          'Colchicine',
                                          style: TextStyle(
                                            color: Color(0xFF23262A),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 30),
                                        child: Text(
                                          'Tablet',
                                          style: TextStyle(
                                            color: Color(0xFF23262A),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 30),
                                        child: Text(
                                          '30 Tab',
                                          style: TextStyle(
                                            color: Color(0xFF23262A),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 30),
                                        child: Text(
                                          'EGP 19.99',
                                          style: TextStyle(
                                            color: Color(0xFF23262A),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 30),
                                        child: Text(
                                          'Pharco',
                                          style: TextStyle(
                                            color: Color(0xFF23262A),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 30),
                                        child: Text(
                                          'Analgesics',
                                          style: TextStyle(
                                            color: Color(0xFF23262A),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 30),
                                        child: Text(
                                          'Ibuprofen',
                                          style: TextStyle(
                                            color: Color(0xFF23262A),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(width: 200),
                          Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 30.0),
                                        child: Text(
                                          'Store Details:',
                                          style: TextStyle(
                                            color: Color(0xFF23262A),
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 35),
                                        child: Text(
                                          'Store Name:',
                                          style: TextStyle(
                                            color: Color(0xFF60656E),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 35),
                                        child: Text(
                                          'Quantity:',
                                          style: TextStyle(
                                            color: Color(0xFF60656E),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 35),
                                        child: Text(
                                          'Offer:',
                                          style: TextStyle(
                                            color: Color(0xFF60656E),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 35),
                                        child: Text(
                                          'Offer Price:',
                                          style: TextStyle(
                                            color: Color(0xFF60656E),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 145),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 30, top: 55),
                                        child: Text(
                                          'Ibsina',
                                          style: TextStyle(
                                            color: Color(0xFF23262A),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 30),
                                        child: Text(
                                          '500',
                                          style: TextStyle(
                                            color: Color(0xFF23262A),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 30),
                                          child: Container(
                                            width: 33,
                                            height: 26,
                                            decoration: ShapeDecoration(
                                              color: const Color(0xFFECFDF3),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                            ),
                                            child: const Text(
                                              '12%',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF009781),
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            ),
                                          )),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 30),
                                        child: Text(
                                          'EGP 15.99',
                                          style: TextStyle(
                                            color: Color(0xFF23262A),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
