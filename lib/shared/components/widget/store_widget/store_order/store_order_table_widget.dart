import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';
import '../../../../../models/store_order_data_table_model.dart';
import '../../../../../modules/6-store_module/store_screen_option/store_screen_option.dart';


class StoreOrderTableWidget extends StatefulWidget {
  const StoreOrderTableWidget({super.key});

  @override
  State<StoreOrderTableWidget> createState() => _StoreOrderTableWidget();
}

class _StoreOrderTableWidget extends State<StoreOrderTableWidget> {
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
                  label: Row(
                    children: [
                      const Text('To'),
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
                      const Text('Date'),
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
                      const Text('State'),
                      const SizedBox(width: 10),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.sort_rounded)),
                    ],
                  ),
                ),
                const DataColumn(label: Text('')),
              ],
              rows: List.generate(storeOrderDemoData.length,
                  (index) => _dataRow(storeOrderDemoData[index])),
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
