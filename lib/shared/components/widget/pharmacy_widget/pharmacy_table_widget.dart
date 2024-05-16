import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

import '../../../../models/pharmacy_data_table.dart';

class PharmacyTableWidget extends StatefulWidget {
  final void Function() openProfileScreen; // Function to open profile screen

  const PharmacyTableWidget({super.key, required this.openProfileScreen});

  @override
  State<PharmacyTableWidget> createState() => _PharmacyTableWidgetState();
}

class _PharmacyTableWidgetState extends State<PharmacyTableWidget> {
  int rowsPerPage = 10;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    int numberOfPages = (pharmacyDemoData.length / rowsPerPage).ceil();

    return Expanded(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: MediaQuery.of(context).size.width / 13,
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
              headingRowColor: const MaterialStatePropertyAll(Color(0xfffbfafb)),
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
                          icon: const Icon(Icons.sort_rounded, size: 22)),
                    ],
                  ),
                ),
                const DataColumn(
                  label: Row(
                    children: [
                      Text('Contact Number'),
                    ],
                  ),
                ),
                const DataColumn(
                  label: Row(
                    children: [
                      Text('Address'),
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
                  if (dataIndex >= pharmacyDemoData.length) {
                    return null;
                  }
                  return _dataRow(pharmacyDemoData[dataIndex]);
                },
              ).whereType<DataRow>().toList(),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Row(
              children: [
                Text(
                  'Showing ${currentPage * rowsPerPage + 1} to ${(currentPage + 1) * rowsPerPage} of ${pharmacyDemoData.length} entries',
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

  DataRow _dataRow(PharmacyData data) {
    Color? bColor;
    Color? fColor;
    switch (data.state) {
      case 'Activated':
        bColor = HexColor('#ecfdf3');
        fColor = HexColor('#009881');
        break; // Add break statement
      case 'Deactivated':
        bColor = HexColor('#fff2ea');
        fColor = HexColor('#f15046');
        break; // Add break statement
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
            data.photo,
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
            data.name,
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
            data.contactNumber,
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
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                data.address,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
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
