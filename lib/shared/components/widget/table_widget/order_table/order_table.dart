import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pharma_store_administration_web/models/order_data_table_model.dart';
import 'package:pharma_store_administration_web/modules/5-order_module/order_screen_options/order_details.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

class OrderTable extends StatefulWidget {
  final List<OrderDataModel> data; // List of PharmacyData

  const OrderTable({super.key,  required this.data});

  @override
  State<OrderTable> createState() => _OrderTableState();
}

class _OrderTableState extends State<OrderTable> {
  late List<OrderDataModel> filterData;

  int rowsPerPage = 10;
  int currentPage = 0;
  bool sortAscending = true;

  @override
  void initState() {
    super.initState();
    filterData = widget.data;
  }

  @override
  void didUpdateWidget(OrderTable oldWidget) {
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
             DataColumn(
                onSort: (columnIndex, ascending) {
                  setState(() {
                    sortAscending = !sortAscending;
                    if (sortAscending) {
                      filterData.sort((a, b) => a.id.compareTo(b.id));
                    } else {
                      filterData.sort((a, b) => b.id.compareTo(a.id));
                    }
                  });
                },

                label: const Row(
                  children: [
                    Text('ID'),
                    SizedBox(width: 10),
                    Icon(Icons.sort)
                  ],
                )
            ),
             DataColumn(
                onSort: (columnIndex, ascending) {
                  setState(() {
                    sortAscending = !sortAscending;
                    if (sortAscending) {
                      filterData.sort((a, b) => a.dateAndTime.compareTo(b.dateAndTime));
                    } else {
                      filterData.sort((a, b) => b.dateAndTime.compareTo(a.dateAndTime));
                    }
                  });
                },

                label: const Row(

              children: [
                Text('Data & Time'),
                SizedBox(width: 10),
                Icon(Icons.sort)
              ],
            )
            ),
            DataColumn(
              onSort: (columnIndex, ascending) {
                setState(() {
                  sortAscending = !sortAscending;
                  if (sortAscending) {
                    filterData.sort((a, b) => a.itemsQuantity.compareTo(b.itemsQuantity));
                  } else {
                    filterData.sort((a, b) => b.itemsQuantity.compareTo(a.itemsQuantity));
                  }
                });
              },

              label: const Row(
                children: [
                  Text('items Quantity'),
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
                     filterData.sort((a, b) => a.totalPrice.compareTo(b.totalPrice));
                   } else {
                     filterData.sort((a, b) => b.totalPrice.compareTo(a.totalPrice));
                   }
                 });
               },

              label: const Row(
                children: [
                  Text('Total Price'),
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
                    filterData.sort((a, b) => a.status.compareTo(b.status));
                  } else {
                    filterData.sort((a, b) => b.status.compareTo(a.status));
                  }
                });
              },

              label:  const Row(
                children: [
                  Text('Status'),
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
              if (dataIndex >= filterData.length) {
                return null;
              }
              return _dataRow(filterData[dataIndex]);
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
    );
  }

  DataRow _dataRow(OrderDataModel data) {
    Color? bColor;
    Color? fColor;
    switch (data.status) {
      case 'Delivered':
        bColor = HexColor('#ecfdf3');
        fColor = HexColor('#009881');
      case 'Canceled':
        bColor = HexColor('#fff2ea');
        fColor = HexColor('#f15046');
      case 'On Way':
        bColor = HexColor('#e9f3ff');
        fColor = HexColor('#4a72ff');
      case 'On Hold':
        bColor = HexColor('#fffadf');
        fColor = HexColor('#eca600');
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
            width: MediaQuery.of(context).size.width * 0.15,
            child: Text(
              data.dateAndTime,
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
            width: MediaQuery.of(context).size.width * 0.12,
            child: Text(
              data.itemsQuantity,
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
            width: MediaQuery.of(context).size.width * 0.12,
            child: Text(
              data.totalPrice,
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
          Container(
            width: 80,
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
