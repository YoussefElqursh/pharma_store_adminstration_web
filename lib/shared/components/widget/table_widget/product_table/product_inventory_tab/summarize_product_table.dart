import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pharma_store_administration_web/models/data_table.dart';
import 'package:pharma_store_administration_web/modules/2-product_module/product_inventory_tab/product_inventory_options/product_inventory_details/product_inventory_details_screen.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';


class SummarizeProductTable extends StatefulWidget {
  final List<Data> data; // List of PharmacyData

  const SummarizeProductTable({super.key, required this.data});

  @override
  State<SummarizeProductTable> createState() => _SummarizeProductTableState();
}

class _SummarizeProductTableState extends State<SummarizeProductTable> {

 late List<Data>? filterData;
  int currentPage = 0;
  int rowsPerPage = 10;
  bool sortAscending = true;
  @override
  void initState() {
    super.initState();
    filterData = widget.data;
  }

  @override
  void didUpdateWidget(SummarizeProductTable oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.data != oldWidget.data) {
      filterData = widget.data;
    }
  }
  void _openProductInventoryScreen() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
          opacity: animation,
          child: const ProductInventoryDetailsScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (filterData!.isEmpty) {
      return const Center(
        child: Text('No data available'),
      );
    }

    int numberOfPages = (filterData!.length / rowsPerPage).ceil();

    var pages = List.generate(
      rowsPerPage,
      (index) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowHeight: 44,
          dataRowMaxHeight: 72,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFFAFBFB)),
              borderRadius: BorderRadius.circular(16)),
          border: TableBorder.all(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              color: const Color(0xFFFAFBFB),
              style: BorderStyle.none),
          headingTextStyle: const TextStyle(
            color: Color(0xff42526d),
            fontSize: 10,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
          headingRowColor: const MaterialStatePropertyAll(Color(0xfffbfafb)),
          columns: [
            const DataColumn(label: Text('ID')),
            const DataColumn(label: Text('Photo')),
             DataColumn(
              onSort: (columnIndex, ascending) {
                setState(() {
                  sortAscending = !sortAscending;
                  if (sortAscending) {
                    filterData?.sort((a, b) => a.to.compareTo(b.to));
                  } else {
                    filterData?.sort((a, b) => b.to.compareTo(a.to));
                  }
                });
              },

              label: const Row(
                children: [
                  Text('Name'),
                  SizedBox(width: 10),
                  Icon(Icons.sort)
                ],
              ),
            ),
            const DataColumn(
              label: Text('Quantity Per Package'),
            ),
            const DataColumn(
              label: Text('Category'),
            ),
            const DataColumn(
              label: Text('Store'),
            ),
            const DataColumn(
              label: Text('Quantity'),
            ),
             DataColumn(
               onSort: (columnIndex, ascending) {
                 setState(() {
                   sortAscending = !sortAscending;
                   if (sortAscending) {
                     filterData?.sort((a, b) => a.to.compareTo(b.to));
                   } else {
                     filterData?.sort((a, b) => b.to.compareTo(a.to));
                   }
                 });
               },

               label: const Row(
                children: [
                  Text('Public Price'),
                  SizedBox(width: 10),
                  Icon(Icons.sort)
                ],
              ),
            ),
            const DataColumn(
              label: Text(''),
            ),
          ],
          rows: List.generate(
            rowsPerPage,
                (index) {
              int dataIndex = currentPage * rowsPerPage + index;
              if (dataIndex >= filterData!.length) {
                return null;
              }
              return _dataRow(filterData![dataIndex]);
            },
          ).whereType<DataRow>().toList(),
        ),
      ),
    );

    return Column(
      children: [
        pages[currentPage],
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Row(
            children: [
               Text(
                'Showing ${currentPage * rowsPerPage + 1} to ${(currentPage + 1) * rowsPerPage} of ${filterData!.length} entries',
                style: const TextStyle(
                  color: Color(0xFF6B788E),
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0.10,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 500,
                child: NumberPaginator(
                  config: NumberPaginatorUIConfig(
                    buttonShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    buttonSelectedBackgroundColor: HexColor(primary),
                  ),
                  numberPages: numberOfPages,
                  onPageChange: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
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
    switch (data.state) {
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
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.015,
            child: Text(
              '${data.id}',
              style: const TextStyle(
                color: Color(0xFF23262A),
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
        ),
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.075,
            child: Text(
              data.from,
              style: const TextStyle(
                color: Color(0xFF23262A),
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
        ),
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.075,
            child: Text(
              data.to,
              style: const TextStyle(
                color: Color(0xFF23262A),
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
        ),
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.075,
            child: Text(
              data.dateTime,
              style: const TextStyle(
                color: Color(0xFF23262A),
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
        ),
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.075,
            child: Text(
              data.dateTime,
              style: const TextStyle(
                color: Color(0xFF23262A),
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
        ),
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.075,
            child: Text(
              data.dateTime,
              style: const TextStyle(
                color: Color(0xFF23262A),
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
        ),
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.075,
            child: Container(
              width: 73,
              height: 26,
              decoration: BoxDecoration(
                color: bColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
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
        ),
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.075,
            child: Container(
              width: 73,
              height: 26,
              decoration: BoxDecoration(
                color: bColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
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
        ),
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.075,
            child: Row(
              children: [
                const Spacer(),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem<String>(
                      value: 'View',
                      onTap: _openProductInventoryScreen,
                      child: const Text('View'), // Call function here
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
