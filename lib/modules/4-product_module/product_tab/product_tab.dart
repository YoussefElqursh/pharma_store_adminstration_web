import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/modules/4-product_module/product_tab/products_screen_options/product/add_product_screen.dart';
import 'package:pharma_store_administration_web/modules/4-product_module/product_tab/products_screen_options/product_categories_module/product_categories_screen.dart';
import 'package:pharma_store_administration_web/shared/components/functions.dart';
import 'package:pharma_store_administration_web/shared/components/widget/table_widget.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

class ProductTab extends StatefulWidget {
  const ProductTab({super.key});

  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  bool filterVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30, top: 30, bottom: 10),
              child: Stack(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      TableWidget(),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 570,
                        height: 48,
                        child: TextFormField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: HexColor(white),
                              hintText: 'Search product by name',
                              hintStyle: const TextStyle(
                                color: Color(0xffb2bac6),
                                fontFamily: 'Poppins',
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: HexColor(bWhite90),
                                size: 21,
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  topLeft: Radius.circular(12),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor(bWhite90)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor(primary)),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 5)),
                        ),
                      ),
                      const Spacer(),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            filterVisibility = !filterVisibility;
                          });
                        },
                        color: HexColor('#edf0fe'),
                        height: 48,
                        minWidth: 105,
                        elevation: 0,
                        hoverColor: Colors.transparent,
                        shape: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor('#edf0fe')),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                setPhoto(
                                    kind: 1, path: 'assets/icons/filter.svg'),
                                const SizedBox(width: 10),
                                Text(
                                  'Filter',
                                  style: TextStyle(
                                      color: HexColor(primary),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      FadeTransition(
                                opacity: animation,
                                child: const ProductCategoryScreen(),
                              ),
                            ),
                          );
                        },
                        color: HexColor('#edf0fe'),
                        height: 48,
                        minWidth: 105,
                        elevation: 0,
                        hoverColor: Colors.transparent,
                        shape: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor('#edf0fe')),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                setPhoto(
                                    kind: 1, path: 'assets/icons/category.svg'),
                                const SizedBox(width: 10),
                                Text(
                                  'Categories',
                                  style: TextStyle(
                                      color: HexColor(primary),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      FadeTransition(
                                opacity: animation,
                                child: const AddProductScreen(),
                              ),
                            ),
                          );
                        },
                        color: HexColor(primary),
                        height: 48,
                        minWidth: 105,
                        elevation: 0,
                        hoverColor: Colors.transparent,
                        shape: OutlineInputBorder(
                          borderSide: BorderSide(color: HexColor(primary)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Add Product',
                              style: TextStyle(
                                  color: HexColor(white),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, right: 330),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Visibility(
                          visible: filterVisibility,
                          child: Column(
                            children: [
                              SizedBox(
                                width: 270,
                                height: 327,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 270,
                                        height: 327,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          shadows: const [
                                            BoxShadow(
                                              color: Color(0x19000000),
                                              blurRadius: 30,
                                              offset: Offset(0, 10),
                                              spreadRadius: 0,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      left: 20,
                                      top: 20,
                                      child: Text(
                                        'Filter Options',
                                        style: TextStyle(
                                          color: Color(0xFF23262A),
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 59,
                                      child: Container(
                                        width: 270,
                                        decoration: const ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              width: 1,
                                              strokeAlign:
                                                  BorderSide.strokeAlignCenter,
                                              color: Color(0xFFDDE1EB),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 143,
                                      top: 111,
                                      child: SizedBox(
                                        width: 107,
                                        height: 40,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Container(
                                                width: 107,
                                                height: 40,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    side: const BorderSide(
                                                      width: 1,
                                                      strokeAlign: BorderSide
                                                          .strokeAlignCenter,
                                                      color: Color(0xFFDDE1EB),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Positioned(
                                              left: 12,
                                              top: 20,
                                              child: Text(
                                                'To',
                                                style: TextStyle(
                                                  color: Color(0xFFB2BAC6),
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  height: 0.14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 20,
                                      top: 203,
                                      child: SizedBox(
                                        width: 230,
                                        height: 40,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Container(
                                                width: 230,
                                                height: 40,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    side: const BorderSide(
                                                      width: 1,
                                                      strokeAlign: BorderSide
                                                          .strokeAlignCenter,
                                                      color: Color(0xFFDDE1EB),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Positioned(
                                              left: 12.78,
                                              top: 20,
                                              child: SizedBox(
                                                width: 101.16,
                                                child: Text(
                                                  'Select category ',
                                                  style: TextStyle(
                                                    color: Color(0xFFB2BAC6),
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                    height: 0.14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      left: 20,
                                      top: 79,
                                      child: Text(
                                        'Public Price:',
                                        style: TextStyle(
                                          color: Color(0xFF23262A),
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          height: 0.10,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 20,
                                      top: 111,
                                      child: SizedBox(
                                        width: 107,
                                        height: 40,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Container(
                                                width: 107,
                                                height: 40,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    side: const BorderSide(
                                                      width: 1,
                                                      strokeAlign: BorderSide
                                                          .strokeAlignCenter,
                                                      color: Color(0xFFDDE1EB),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Positioned(
                                              left: 12,
                                              top: 20,
                                              child: Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'EGP',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF23262A),
                                                        fontSize: 12,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0.14,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: ' ',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFB2BAC6),
                                                        fontSize: 12,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0.14,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: '150.00',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF23262A),
                                                        fontSize: 12,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0.14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 190,
                                      top: 273,
                                      child: MaterialButton(
                                        onPressed: () {},
                                        child: Container(
                                          height: 40,
                                          padding: const EdgeInsets.all(12),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFF4A71FF),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                          ),
                                          child: const Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Apply ',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w600,
                                                  height: 0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 114,
                                      top: 273,
                                      child: MaterialButton(
                                        onPressed: () {},
                                        child: Container(
                                          height: 40,
                                          padding: const EdgeInsets.all(12),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFFF5F6FA),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                          ),
                                          child: const Text(
                                            'Reset',
                                            style: TextStyle(
                                              color: Color(0xFF60656E),
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      left: 20,
                                      top: 171,
                                      child: Text(
                                        'Category:',
                                        style: TextStyle(
                                          color: Color(0xFF23262A),
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          height: 0.10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
