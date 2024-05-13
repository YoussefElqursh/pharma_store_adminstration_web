import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';
import '../../../../models/store-data_table.dart';
import '../../../../modules/6-store_module/store_screen_option/store_screen_option.dart';

class StoreTableWidget extends StatefulWidget {
  final void Function() openProfileScreen; // Function to open profile screen

  const StoreTableWidget({super.key, required this.openProfileScreen});

  @override
  State<StoreTableWidget> createState() => _StoreTableWidget();
}

class _StoreTableWidget extends State<StoreTableWidget> {
  int numberOfPages = 10;
  int currentPage = 0;

  void _openProfileScreen() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
          opacity: animation,
          child: const StoreScreenOption(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var pages = List.generate(
        numberOfPages,
        (index) => DataTable(
              columnSpacing: MediaQuery.of(context).size.width / 11,
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
                const DataColumn(label: Text('Photo')),
                DataColumn(
                  label: Row(
                    children: [
                      const Text('Name'),
                      const SizedBox(width: 10),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.sort_rounded)),
                    ],
                  ),
                ),
                DataColumn(
                  label: Row(
                    children: [
                      const Text('Contact Number'),
                      const SizedBox(width: 10),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.sort_rounded)),
                    ],
                  ),
                ),
                DataColumn(
                  label: Row(
                    children: [
                      const Text('Address'),
                      const SizedBox(width: 10),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.sort_rounded)),
                    ],
                  ),
                ),
                const DataColumn(label: Text('')),
              ],
              rows: List.generate(storeDemoData.length,
                  (index) => _dataRow(storeDemoData[index])),
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

  DataRow _dataRow(StoreData data) {
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
