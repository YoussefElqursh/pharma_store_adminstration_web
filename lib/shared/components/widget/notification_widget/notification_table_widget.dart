import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

import '../../../../models/notification_data_table.dart';

class NotificationTableWidget extends StatefulWidget {
  final void Function() openProfileScreen; // Function to open profile screen
  final List<NotificationData> data; // List of PharmacyData

  const NotificationTableWidget(
      {super.key, required this.openProfileScreen, required this.data});

  @override
  State<NotificationTableWidget> createState() => _NotificationTableWidget();
}

class _NotificationTableWidget extends State<NotificationTableWidget> {
  late List<NotificationData> filterData;

  int rowsPerPage = 10;
  int currentPage = 0;
  bool sortAscending = true;

  @override
  void initState() {
    super.initState();
    filterData = widget.data;
  }

  @override
  void didUpdateWidget(NotificationTableWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.data != oldWidget.data) {
      filterData = widget.data;
    }
  }

  final List<int> _selectedRows = [];

  void _onRowSelect(bool? selected, int id) {
    setState(() {
      if (selected != null && selected) {
        _selectedRows.add(id);
      } else {
        _selectedRows.remove(id);
      }
    });
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
      (pageIndex) => DataTable(
        showCheckboxColumn: true,
        dataRowMaxHeight: 74,
        decoration: BoxDecoration(
          border: Border.all(color: HexColor(bWhite90)),
          borderRadius: BorderRadius.circular(16),
        ),
        border: TableBorder.all(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: HexColor(bWhite90),
          style: BorderStyle.none,
        ),
        headingTextStyle: const TextStyle(
          color: Color(0xff42526d),
          fontSize: 10,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        headingRowColor: const WidgetStatePropertyAll(Color(0xfffbfafb)),
        columns: const [
          DataColumn(label: Text('Select all')),
          DataColumn(label: Text('')),
          DataColumn(label: Text('')),
          DataColumn(label: Text('')),
          DataColumn(label: Text('')),
        ],
        rows: List.generate(
          rowsPerPage,
          (rowIndex) {
            int dataIndex = currentPage * rowsPerPage + rowIndex;
            if (dataIndex >= filterData.length) {
              return null;
            }
            return _dataRow(filterData[dataIndex]);
          },
        ).whereType<DataRow>().toList(),
      ),
    );

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

  DataRow _dataRow(NotificationData data) {
    Color? bColor;
    Color? fColor;
    switch (data.state) {
      case 'pharmacy':
        bColor = HexColor('#ecfdf3');
        fColor = HexColor('#009881');
        break;
      case 'store':
        bColor = HexColor('#FFFADF');
        fColor = HexColor('#ECA600');
        break;
      default:
        bColor = Colors.transparent;
        fColor = Colors.black;
    }

    return DataRow(
      onSelectChanged: (selected) => _onRowSelect(selected, data.id),
      selected: _selectedRows.contains(data.id),
      cells: [
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipOval(
                child: Container(
                  width: 36,
                  height: 36,
                  color: Colors.cyan,
                  child: data.photo.isNotEmpty
                      ? Image.network(data.photo, fit: BoxFit.cover)
                      : const Icon(Icons.image, color: Colors.white),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data.name,
                        style:
                            const TextStyle(overflow: TextOverflow.ellipsis)),
                    Text(data.address)
                  ],
                ),
              )
            ],
          ),
        ),
        DataCell(
          SizedBox(
            width: 280,
            child: Row(
              children: [
                ClipOval(
                  child: Container(
                    width: 8,
                    height: 8,
                    color: Colors.cyan,
                  ),
                ),
                const Spacer()
              ],
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
          Text(
            data.address, // Assuming this is the time field in your data
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
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'View Profile',
                onTap: widget.openProfileScreen,
                child: const Text('View Profile'), // Call function here
              ),
            ],
          ),
        ),
      ],
    );
  }
}
