import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pharma_store_administration_web/models/store_order_data_table_model.dart';
import 'package:pharma_store_administration_web/modules/5-order_module/order_screen_options/order_details.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

class StoreOrderTableWidget extends StatefulWidget {
  final List<StoreOrderData> data; // List of PharmacyData

  const StoreOrderTableWidget({super.key, required this.data});

  @override
  State<StoreOrderTableWidget> createState() => _StoreOrderTableWidget();
}

class _StoreOrderTableWidget extends State<StoreOrderTableWidget> {
  late List<StoreOrderData> filterData;

  int rowsPerPage = 10;
  int currentPage = 0;
  bool sortAscending = true;

  @override
  void initState() {
    super.initState();
    filterData = widget.data;
  }

  @override
  void didUpdateWidget(StoreOrderTableWidget oldWidget) {
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
        (index) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
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
                    const WidgetStatePropertyAll(Color(0xfffbfafb)),
                columns: [
                  const DataColumn(label: Text('ID')),
                  DataColumn(
                      onSort: (columnIndex, ascending) {
                        setState(() {
                          sortAscending = !sortAscending;
                          if (sortAscending) {
                            filterData.sort((a, b) => a.from.compareTo(b.from));
                          } else {
                            filterData.sort((a, b) => b.from.compareTo(a.from));
                          }
                        });
                      },
                      label: const Row(
                        children: [
                          Text('From'),
                          SizedBox(width: 10),
                          Icon(Icons.sort)
                        ],
                      )),
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
                          filterData.sort((a, b) => a.date.compareTo(b.date));
                        } else {
                          filterData.sort((a, b) => b.date.compareTo(a.date));
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
              ),
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

  DataRow _dataRow(StoreOrderData data) {
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
            width: 76,
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
