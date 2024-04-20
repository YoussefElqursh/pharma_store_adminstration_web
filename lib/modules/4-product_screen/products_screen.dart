import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/models/data_table.dart';
import 'package:pharma_store_administration_web/shared/components/widget/screen_header.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ScreenHeader(screenName: 'Products'),
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 40.0, right: 40, top: 30, bottom: 10),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 360,
                      height: 40,
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
                    const SizedBox(width: 10),
                    MaterialButton(
                      onPressed: () {},
                      color: HexColor(primary),
                      elevation: 0,
                      height: 48,
                      minWidth: 48,
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor(primary)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.filter_list_rounded, color: Colors.white,),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: DataTable(
                  columnSpacing: 69,
                  dataRowMaxHeight: 65,
                  decoration: BoxDecoration(
                      border: Border.all(color: HexColor(bWhite90)),
                      borderRadius: BorderRadius.circular(16)),
                  border: TableBorder.all(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      color: HexColor(bWhite90),
                      style: BorderStyle.none),
                  headingTextStyle: const TextStyle(
                    color: Color(0xff42526d),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  headingRowColor: const MaterialStatePropertyAll(Color(0xffEAECF0)),
                  columns: [
                    const DataColumn(label: Text('ID')),
                    const DataColumn(label: Text('Photo')),
                    DataColumn(
                      label: Row(
                        children: [
                          const Text('Name'),
                          const SizedBox(width: 10),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.filter_alt_rounded)),
                        ],
                      ),
                    ),
                    DataColumn(
                      label: Row(
                        children: [
                          const Text('Quantity'),
                          const SizedBox(width: 10),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.filter_alt_rounded)),
                        ],
                      ),
                    ),
                    DataColumn(
                      label: Row(
                        children: [
                          const Text('Public Price'),
                          const SizedBox(width: 10),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.filter_alt_rounded)),
                        ],
                      ),
                    ),
                    DataColumn(
                      label: Row(
                        children: [
                          const Text('Monthly Sales'),
                          const SizedBox(width: 10),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.filter_alt_rounded)),
                        ],
                      ),
                    ),
                  ],
                  rows: List.generate(
                      demoData.length, (index) => _dataRow(demoData[index])),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  DataRow _dataRow(Data data) {
    Color? bColor;
    Color? fColor;
    switch( data.state){
      case 'Delivered':
        bColor = HexColor('#ECFDF3');
        fColor = HexColor('#009881');
      case 'On Hold':
        bColor = HexColor('#FFFADF');
        fColor = HexColor('#ECA600');
      case 'On Way':
        bColor = HexColor('#E9F3FF');
        fColor = HexColor('#4A72FF');
    }
    return DataRow(
      cells: [
        DataCell(Text('${data.id}')),
        DataCell(Text(data.from)),
        DataCell(Text(data.to)),
        DataCell(Text(data.dateTime)),
        DataCell(
          Container(
            width: 73,
            height: 26,
            decoration: BoxDecoration(
              color: bColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child:
            Center(
                child: Text(
                  data.state,
                  style: TextStyle(
                    color: fColor,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ),
          ),
        ),
        DataCell(
          Row(
            children: [
              const Spacer(),
              data.moreIcon,
            ],
          ),
        ),
      ],
    );
  }
}