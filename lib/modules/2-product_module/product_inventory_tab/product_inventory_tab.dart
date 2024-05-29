import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/shared/components/functions.dart';
import 'package:pharma_store_administration_web/shared/components/widget/table_widget/product_table/product_inventory_tab/product_inventory_tab_table.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

import '../../../models/data_table.dart';

class ProductInventoryTab extends StatefulWidget {
  const ProductInventoryTab({super.key});

  @override
  State<ProductInventoryTab> createState() => _ProductInventoryTabState();
}

class _ProductInventoryTabState extends State<ProductInventoryTab> {
  bool filterVisibility = false;
  List<Data>? filteredData;
  late TextEditingController controllerOfSearch;

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

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  List<String> selectedItems = [];

  @override
  void initState() {
    super.initState();
    filteredData = demoData;
    controllerOfSearch = TextEditingController();
  }

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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      ProductInventoryTabTable(
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
                            height: 335,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 20.0, top: 20.0, right: 20.0),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 20.0, left: 20.0, right: 20.0),
                                      child: Text(
                                        'Public Price:',
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
                                              style:
                                                  const TextStyle(fontSize: 12),
                                              decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: HexColor(white),
                                                  hintText: 'EGP 150.000',
                                                  hintStyle: const TextStyle(
                                                    color: Color(0xFF23262A),
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  border:
                                                      const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(12),
                                                      topLeft:
                                                          Radius.circular(12),
                                                    ),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            HexColor(bWhite90)),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            HexColor(primary)),
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
                                                padding: EdgeInsets.symmetric(
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
                                              style:
                                                  const TextStyle(fontSize: 12),
                                              decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: HexColor(white),
                                                  hintText: 'To',
                                                  hintStyle: TextStyle(
                                                    fontSize: 11.5,
                                                    color: HexColor("#42526d"),
                                                    fontFamily: 'Poppins',
                                                  ),
                                                  border:
                                                      const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(12),
                                                      topLeft:
                                                          Radius.circular(12),
                                                    ),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            HexColor(bWhite90)),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            HexColor(primary)),
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
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 20,
                                          top: 20,
                                          right: 20,
                                          bottom: 12),
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
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          top: 20,
                                          right: 20,
                                          bottom: 12),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton2<String>(
                                          isExpanded: true,
                                          hint: Text(
                                            'Select category',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          items: items.map(
                                            (item) {
                                              return DropdownMenuItem(
                                                value: item,
                                                enabled: false,
                                                child: StatefulBuilder(
                                                  builder:
                                                      (context, menuSetState) {
                                                    final isSelected =
                                                        selectedItems
                                                            .contains(item);
                                                    return InkWell(
                                                      onTap: () {
                                                        isSelected
                                                            ? selectedItems
                                                                .remove(item)
                                                            : selectedItems
                                                                .add(item);
                                                        //This rebuilds the StatefulWidget to update the button's text
                                                        setState(() {});
                                                        //This rebuilds the dropdownMenu Widget to update the check mark
                                                        menuSetState(() {});
                                                      },
                                                      child: Container(
                                                        height: double.infinity,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    16.0),
                                                        child: Row(
                                                          children: [
                                                            if (isSelected)
                                                              Icon(
                                                                Icons
                                                                    .check_box_outlined,
                                                                color: HexColor(
                                                                    primary),
                                                              )
                                                            else
                                                              Icon(
                                                                  Icons
                                                                      .check_box_outline_blank,
                                                                  color: HexColor(
                                                                      primary)),
                                                            const SizedBox(
                                                                width: 16),
                                                            Expanded(
                                                              child: Text(
                                                                item,
                                                                style:
                                                                    const TextStyle(
                                                                  color: Color(
                                                                      0xFF4A71FF),
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  height: 0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ).toList(),
                                          value: selectedItems.isEmpty
                                              ? null
                                              : selectedItems.last,
                                          onChanged: (value) {},
                                          selectedItemBuilder: (context) {
                                            return items.map(
                                              (item) {
                                                return Container(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .center,
                                                  child: Container(
                                                    height: 40,
                                                    width: 230,
                                                    decoration: ShapeDecoration(
                                                      color: const Color(
                                                          0x0C4A71FF),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          3)),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        selectedItems.join(' '),
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xFF4A71FF),
                                                          fontSize: 12,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        maxLines: 1,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).toList();
                                          },
                                          buttonStyleData:
                                              const ButtonStyleData(
                                            padding: EdgeInsets.only(
                                                left: 16, right: 8),
                                            height: 40,
                                            width: 230,
                                          ),
                                          iconStyleData: const IconStyleData(
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: Color(0xFFB2BAC6),
                                            ),
                                          ),
                                          menuItemStyleData:
                                              const MenuItemStyleData(
                                            height: 40,
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 20.0),
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
                                                    color: HexColor("#60656e")),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, bottom: 18, top: 34),
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
                                                  color: HexColor("#ffffff"),
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
    );
  }
}
