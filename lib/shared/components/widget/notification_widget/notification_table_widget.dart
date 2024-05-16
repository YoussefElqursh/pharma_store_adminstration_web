import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

import '../../../../models/notification_data_table.dart';

class NotificationTableWidget extends StatefulWidget {
  final void Function() openProfileScreen; // Function to open profile screen

  const NotificationTableWidget({super.key, required this.openProfileScreen});

  @override
  State<NotificationTableWidget> createState() => _NotificationTableWidget();
}

class _NotificationTableWidget extends State<NotificationTableWidget> {
  int numberOfPages = 10;
  int currentPage = 0;
  final List<int> _selectedRows = [];

  void _onRowSelect(bool? selected, int index) {
    setState(() {
      if (selected != null && selected) {
        _selectedRows.add(index);
      } else {
        _selectedRows.remove(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var pages = List.generate(
        numberOfPages,
            (index) => DataTable(
          showCheckboxColumn: true,
          dataRowMaxHeight: 74,
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
          columns: const [
            DataColumn(label: Text('Select all')),
            DataColumn(label: Text('')),
            DataColumn(label: Text('')),

            DataColumn(
              label: Row(
                children: [
                  Text(''),

                ],
              ),
            ),
            DataColumn(label: Text('')),
          ],
          rows: List.generate(notificationDemoData.length,
                  (index) => _dataRow(notificationDemoData[index], index)),
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
                const Text(
                  'Showing 1 to 5 of 10 categories',
                  style: TextStyle(
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

  DataRow _dataRow(NotificationData data, int index) {
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
    }

    return DataRow(
      onSelectChanged: (selected) => _onRowSelect(selected, index),
      selected: _selectedRows.contains(index),
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
                ),
              ),
              const SizedBox(width: 12),
              const SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: [
                  Text(" Name Of Store and Pharmacy",style: TextStyle(overflow: TextOverflow.ellipsis)),
                  Text("Message")
                    ]),
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
        const DataCell(
          Text(
            "Time of message",
            style: TextStyle(
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
