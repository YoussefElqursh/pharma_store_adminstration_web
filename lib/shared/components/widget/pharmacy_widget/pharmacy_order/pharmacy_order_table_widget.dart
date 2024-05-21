import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pharma_store_administration_web/modules/5-order_module/order_screen_options/order_details.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';
import '../../../../../models/pharmacy_order_data_table.dart';

class PharmacyOrderTableWidget extends StatefulWidget {
  final List<PharmacyOrderDataModel> data; // List of PharmacyData

  const PharmacyOrderTableWidget({super.key, required this.data});

  @override
  State<PharmacyOrderTableWidget> createState() => _PharmacyOrderTableWidget();
}

class _PharmacyOrderTableWidget extends State<PharmacyOrderTableWidget> {
  int rowsPerPage = 10;
  int currentPage = 0;
  bool sortAscending = true;
  late List<PharmacyOrderDataModel> filterData;
  @override
  void initState() {
    super.initState();
    filterData = widget.data;
  }

  @override
  void didUpdateWidget(PharmacyOrderTableWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.data != oldWidget.data) {
      filterData = widget.data;
    }
  }
  void _openProfileScreen() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
          opacity: animation,
          child: const OrderDetails(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (filterData.isEmpty) {
      return const Center(
        child: Text('No data available'),
      );
    }
    int numberOfPages = (filterData.length / rowsPerPage).ceil();

    var pages = List.generate(
        numberOfPages,
        (index) => DataTable(

              columnSpacing: MediaQuery.of(context).size.width / 10,
              dataRowMaxHeight: 48,
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
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
              headingRowColor:
                  const MaterialStatePropertyAll(Color(0xfffbfafb)),
              columns: [
                const DataColumn(label: Text('ID')),
                const DataColumn(label: Text('From')),
                DataColumn(
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      sortAscending = !sortAscending;
                      if (sortAscending) {
                        filterData.sort((a, b) => a.to.compareTo(b.to));
                      } else {
                        filterData.sort((a, b) => b.to.compareTo(a.to));
                      }
                    });
                  },

                  label: const Row(
                    children: [
                      Text('To'),
                      SizedBox(width: 10),
                      Icon(Icons.sort)
                    ],
                  ),
                ),
                DataColumn(
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      sortAscending = !sortAscending;
                      if (sortAscending) {
                        filterData.sort((a, b) => a.to.compareTo(b.to));
                      } else {
                        filterData.sort((a, b) => b.to.compareTo(a.to));
                      }
                    });
                  },

                  label: const Row(
                    children: [
                      Text('Date'),
                      SizedBox(width: 10),
                      Icon(Icons.sort)
                    ],
                  ),
                ),
                 const DataColumn(


                  label: Row(
                    children: [
                      Text('State'),

                    ],
                  ),
                ),
                const DataColumn(label: Text('')),
              ],
          rows: List.generate(
            rowsPerPage,
                (index) {
              int dataIndex = currentPage * rowsPerPage + index;
              if (dataIndex >= filterData.length) {
                return null;
              }
              return _dataRow(filterData[dataIndex]);
            },
          ).whereType<DataRow>().toList(),
            ));

    return Expanded(
      child: Column(
        children: [
          pages[currentPage],
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Row(
              children: [
                 Text(
                  'Showing ${currentPage * rowsPerPage + 1} to ${(currentPage + 1) * rowsPerPage} of ${filterData.length} entries',
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
      ),
    );
  }

  DataRow _dataRow(PharmacyOrderDataModel data) {
    Color? bColor;
    Color? fColor;
    switch (data.status) {
      case 'Delivered':
        bColor = HexColor('#ECFDF3');
        fColor = HexColor('#009881');
      case 'On Hold':
        bColor = HexColor('#FFFADF');
        fColor = HexColor('#ECA600');
      case 'On Way':
        bColor = HexColor('#E9F3FF');
        fColor = HexColor('#4A72FF');
      case 'Canceled':
        bColor = HexColor('#fff2ea');
        fColor = HexColor('#f15046');
    }

    return DataRow(
      cells: [
        DataCell(
          Text(
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
        DataCell(
          Text(
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
        DataCell(
          Text(
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
        DataCell(
          Text(
            data.date,
            style: const TextStyle(
              color: Color(0xFF23262A),
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
        DataCell(
          Container(
            width: 73,
            height: 26,
            decoration: BoxDecoration(
              color: bColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                data.status,
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
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'View Profile',
                onTap: _openProfileScreen,
                child: const Text('View Profile'), // Call function here
              ),
            ],
          ),
        ),
      ],
    );
  }
}
