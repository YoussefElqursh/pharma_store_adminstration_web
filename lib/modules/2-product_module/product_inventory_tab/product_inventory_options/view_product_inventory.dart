import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/shared/components/functions.dart';
import 'package:pharma_store_administration_web/shared/components/widget/back_screen_header.dart';
import 'package:pharma_store_administration_web/shared/components/widget/table_widget/product_table/product_inventory_tab/summarize_product_table.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

import '../../../../models/data_table.dart';

class ViewProductInventory extends StatefulWidget {
  const ViewProductInventory({super.key});

  @override
  State<ViewProductInventory> createState() => _ViewProductInventoryState();
}

class _ViewProductInventoryState extends State<ViewProductInventory> {
  List<Data>? filteredData;
  bool filterVisibility = false;
  late TextEditingController controllerOfSearch;

  @override
  void initState() {
    super.initState();
    filteredData = demoData;
    controllerOfSearch = TextEditingController(); // Initialize here
  }

  void _filterSearchResults(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredData = demoData;
      } else {
        filteredData = demoData
            .where((element) =>
                element.to.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BackScreenHeader(
          backScreenName: 'Products',
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30, top: 30, bottom: 10),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          SummarizeProductTable(
                            data: filteredData!,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 570,
                            height: 48,
                            child: TextFormField(
                              controller: controllerOfSearch,
                              onChanged: _filterSearchResults,
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
                              borderSide:
                                  BorderSide(color: HexColor('#edf0fe')),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    setPhoto(
                                        kind: 1,
                                        path: 'assets/icons/filter.svg'),
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
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
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
                                height: 235,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20.0,
                                              top: 20.0,
                                              right: 20.0),
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
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 14.0),
                                      child: Divider(
                                        height: 1,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              top: 20.0,
                                              left: 20.0,
                                              right: 20.0),
                                          child: Text(
                                            'Offer:',
                                            style: TextStyle(
                                              color: Color(0xFF23262A),
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 12.0, left: 20.0),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.08,
                                                height: 40,
                                                child: TextField(
                                                  style: const TextStyle(
                                                      fontSize: 12),
                                                  decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor:
                                                          HexColor(white),
                                                      hintText: '10 %',
                                                      hintStyle:
                                                          const TextStyle(
                                                        color:
                                                            Color(0xFF23262A),
                                                        fontSize: 12,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      border:
                                                          const OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  12),
                                                          topLeft:
                                                              Radius.circular(
                                                                  12),
                                                        ),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: HexColor(
                                                                bWhite90)),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: HexColor(
                                                                primary)),
                                                      ),
                                                      contentPadding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              bottom: 10,
                                                              left: 10,
                                                              right: 30)),
                                                ),
                                              ),
                                              const SizedBox(
                                                  width: 15,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2.0),
                                                    child: Divider(
                                                      height: 1.5,
                                                    ),
                                                  )),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.08,
                                                height: 40,
                                                child: TextField(
                                                  style: const TextStyle(
                                                      fontSize: 12),
                                                  decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor:
                                                          HexColor(white),
                                                      hintText: 'To',
                                                      hintStyle: TextStyle(
                                                        fontSize: 11.5,
                                                        color:
                                                            HexColor("#42526d"),
                                                        fontFamily: 'Poppins',
                                                      ),
                                                      border:
                                                          const OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  12),
                                                          topLeft:
                                                              Radius.circular(
                                                                  12),
                                                        ),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: HexColor(
                                                                bWhite90)),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: HexColor(
                                                                primary)),
                                                      ),
                                                      contentPadding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              bottom: 10,
                                                              left: 10,
                                                              right: 30)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 20.0),
                                          child: Row(
                                            children: [
                                              const Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 18, top: 34),
                                                child: MaterialButton(
                                                  minWidth: 58,
                                                  height: 34,
                                                  elevation: 0.0,
                                                  color: HexColor("#f5f6fa"),
                                                  onPressed: () {
                                                    setState(
                                                      () {},
                                                    );
                                                  },
                                                  child: Text(
                                                    "Reset",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Poppins-SemiBold",
                                                        fontSize: 12,
                                                        color: HexColor(
                                                            "#60656e")),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0,
                                                    bottom: 18,
                                                    top: 34),
                                                child: MaterialButton(
                                                  minWidth: 58,
                                                  height: 34,
                                                  elevation: 0.0,
                                                  color: HexColor(primary),
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Apply",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Poppins-SemiBold",
                                                      fontSize: 12,
                                                      color:
                                                          HexColor("#ffffff"),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
        ),
      ],
    );
  }
}
