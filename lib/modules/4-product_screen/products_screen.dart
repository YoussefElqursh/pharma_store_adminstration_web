import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/shared/components/functions.dart';
import 'package:pharma_store_administration_web/shared/components/widget/screen_header.dart';
import 'package:pharma_store_administration_web/shared/components/widget/table_widget.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {


  bool filterVisibility = false;

  @override
  Widget build(BuildContext context) {



    return Column(
      children: [
        const ScreenHeader(screenName: 'Products'),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only( left: 40.0, right: 40, top: 30, bottom: 10),
                  child: Stack(
                    children:[
                      const Column(
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
                                    borderSide: BorderSide(color: HexColor(bWhite90)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: HexColor(primary)),
                                  ),
                                  contentPadding:
                                  const EdgeInsets.symmetric(vertical: 5)),
                            ),
                          ),
                          const SizedBox(width: 75),
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
                              borderSide: BorderSide(
                                  color: HexColor('#edf0fe')
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child:
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    setPhoto(kind: 1,path: 'assets/icons/filter.svg'),
                                    const SizedBox(width: 10),
                                    Text('Filter', style: TextStyle(
                                        color: HexColor(primary),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          MaterialButton(
                            onPressed: () {},
                            color: HexColor('#edf0fe'),
                            height: 48,
                            minWidth: 105,
                            elevation: 0,
                            hoverColor: Colors.transparent,
                            shape: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: HexColor('#edf0fe')
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child:
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    setPhoto(kind: 1,path: 'assets/icons/category.svg'),
                                    const SizedBox(width: 10),
                                    Text('Categories', style: TextStyle(
                                        color: HexColor(primary),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          MaterialButton(
                            onPressed: () {},
                            color: HexColor(primary),
                            height: 48,
                            minWidth: 105,
                            elevation: 0,
                            hoverColor: Colors.transparent,
                            shape: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: HexColor(primary)
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child:
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text('Add Product', style: TextStyle(
                                    color: HexColor(white),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16
                                ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0,right: 410),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Visibility(
                              visible: filterVisibility,
                              child: Container(
                                margin: const EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0)),
                                width: 280,
                                height: 227,
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 20.0, top: 20.0),
                                        child: Text(
                                          "Filter Options",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Poppins-SemiBold',
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 14.0),
                                        child: Divider(
                                          height: 1,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 20.0, left: 20.0),
                                        child: Text(
                                          "State:",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Poppins-Medium',
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                  ),
                ),

              ],
            ),
          ),
        ),

      ],
    );
  }

}