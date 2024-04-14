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
                padding: const EdgeInsets.only(left: 40.0, right: 40, top: 30, bottom: 10),
                child: Row(
                  children: [
                    SizedBox(
                     width: MediaQuery.of(context).size.width-393,
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
                            contentPadding: const EdgeInsets.symmetric(vertical: 5)
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: (){},
                      color: HexColor(bWhite90),
                      elevation: 0,
                      height: 48,
                      child: Row(
                        children: [
                          const Icon(Icons.filter_list),
                          const SizedBox(width: 8),
                          Text('Filter',
                            style: TextStyle(
                              color: HexColor(black),
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: DataTable(
                  columnSpacing: 115,
                  dataRowMaxHeight: 65,
                  decoration: BoxDecoration(
                      border: Border.all(color: HexColor(bWhite90)),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  border: TableBorder.all(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                      color: HexColor(bWhite90),
                      style: BorderStyle.none
                  ),
                  headingTextStyle: const TextStyle(
                    color: Color(0xff42526d),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  headingRowColor: const MaterialStatePropertyAll(Color(0xffeaecf0)),
                  columns: const [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('From')),
                    DataColumn(label: Text('To')),
                    DataColumn(label: Text('Date & Time')),
                    DataColumn(label: Text('State')),
                    DataColumn(label: Text('')),
                  ],
                  rows: List.generate(demoData.length,
                          (index) => _dataRow(demoData[index])),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }

  DataRow _dataRow(Data data) {
    return DataRow(cells: [
      DataCell(Text('${data.id}')),
      DataCell(Text(data.from)),
      DataCell(Text(data.to)),
      DataCell(Text(data.dateTime)),
      DataCell(Text(data.state)),
      DataCell(data.moreIcon),
    ]);
  }

}
