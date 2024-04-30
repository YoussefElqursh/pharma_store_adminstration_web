import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';
import '../../layouts/home_layout.dart';
import '../../models/data_card_model.dart';
import '../../models/pharmacy_data-table_model.dart';
import '../../models/pharmacy_source_data.dart';
import '../../shared/components/constants.dart';
import '../../shared/components/functions.dart';
import '../../shared/components/widget/back_screen_header.dart';

class PharmacyProfilesScreen extends StatefulWidget {
  static const String routeName = 'PharmacyProfilesScreenRoute';

  const PharmacyProfilesScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const PharmacyProfilesScreen(),
    );
  }

  @override
  State<PharmacyProfilesScreen> createState() => _PharmacyProfilesScreenState();
}
List<PharmacyDataModel> pharmacyDemoData = [
  PharmacyDataModel(1, "", 'Dr. Osama El Tayeby', '01255', 'Alex', 'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyDataModel(2, "", 'Ali', '355555', 'Suez', 'Deactivated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyDataModel(0, "", 'Hassan', '98888', 'Giza', 'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyDataModel(4, "", 'Ibrahim', '86122', 'Cairo', 'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyDataModel(5, "", 'Karim', '86122', 'Cairo', 'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyDataModel(6, "", 'Mosad', '86122', 'Cairo', 'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyDataModel(7, "", 'Shosha', '86122', 'Cairo', 'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyDataModel(8, "", 'Momen Num 1', '86122', 'Cairo', 'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyDataModel(9, "", 'Shikho', '86122', 'Cairo', 'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
  PharmacyDataModel(10, "", 'Adallah Alsaid', '86122', 'Cairo', 'Activated',
      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))),
];


class _PharmacyProfilesScreenState extends State<PharmacyProfilesScreen> {
  List<PharmacyDataModel>? filterData;

  bool activatedIsChecked = false;
  bool deactivatedIsChecked = false;
  bool filterVisiblity = false;
  bool sort = true;
  late TextEditingController controllerOfFilter;

  onSortColumnName(int columnIndex, bool ascending) {
    if (columnIndex == 2) {
      if (ascending) {
        filterData?.sort((a, b) => a.name.compareTo(b.name));
      } else {
        filterData?.sort((a, b) => b.name.compareTo(a.name));
      }
    }
  }
  @override
  void initState() {
    super.initState();
    filterData = pharmacyDemoData;
    controllerOfFilter = TextEditingController(); // Initialize here
  }
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;



  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 75),
          child: BackScreenHeader(
            goBack: () => Navigator.push(context, HomeScreen.route()),
            backScreenName: 'Pharmacies',
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const SizedBox(
                  height: 44,
                  child: TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    tabs: [
                      Tab(
                        text: "Profile",
                      ),
                      Tab(text: "Orders"),
                      Tab(text: "Statistics"),
                    ],
                  ),
                ),
                const SizedBox(height: 30.7),
                SafeArea(
                  child: SizedBox(
                    height: MediaQuery.of(context)
                        .size
                        .height, // Adjust height as needed
                    child: TabBarView(
                      children: [
                        // Replace these placeholders with actual content widgets for each tab
                        Expanded(
                          child:
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Expanded(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height -558,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      border: Border.all(
                                        color: const Color(0xFFDDE1EB), // Border color #dde1eb
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(30.0),
                                      child: Row(
                                        children: [
                                          ClipOval(
                                            child: Container(
                                              width: 80,
                                              height: 80,
                                              color: Colors.cyan,
                                            ),
                                          ),
                                          const SizedBox(width: 20), // Add space between the oval container and the column
                                          SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Elezaby', // Example text, replace with your content
                                                  style: TextStyle(
                                                    color: HexColor("#23262a"),
                                                    fontSize: 18,
                                                    fontFamily: "Poppins-SemiBold",
                                                  ),
                                                  overflow: TextOverflow.fade,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 8.0),
                                                  child: Text(
                                                    'Elezaby123124', // Example text, replace with your content
                                                    style: TextStyle(
                                                      fontFamily: "Poppins-Regular",
                                                      fontSize: 16,
                                                      color: HexColor("#60656e"),
                                                    ),
                                                    overflow: TextOverflow.fade,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 84,
                                                      height: 25,
                                                      decoration: BoxDecoration(
                                                        color: HexColor('#ecfdf3'),
                                                        borderRadius: BorderRadius.circular(14),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "Activated",
                                                          style: TextStyle(
                                                            color: HexColor('#009881'),
                                                            fontSize: 14,
                                                            fontFamily: 'Poppins',
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 30),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: Container(
                                                        width: 57,
                                                        height: 23,
                                                        decoration: BoxDecoration(
                                                          color: const Color.fromRGBO(74, 114, 255, 0.05),
                                                          borderRadius: BorderRadius.circular(14),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              "Edit",
                                                              style: TextStyle(
                                                                color: HexColor(primary),
                                                                fontSize: 14,
                                                                fontFamily: 'Poppins',
                                                                fontWeight: FontWeight.w500,
                                                              ),
                                                            ),
                                                            const Icon(Icons.edit, size: 13, color: Colors.blueAccent),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 31.0),
                                        child: Container(

                                          decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(8)),
                                              border: Border.fromBorderSide(
                                                  BorderSide(
                                                      color: HexColor("#dde1eb")))),

                                          width: MediaQuery.of(context).size.width -
                                              858.3,

                                          child: SingleChildScrollView(
                                            child: Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 32.0,
                                                        left: 30.0,
                                                        bottom: 27),
                                                    child: Text(
                                                      "Pharmacy Details",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontFamily:
                                                              "Poppins-SemiBold",
                                                          color: HexColor("#23262a")),
                                                    ),
                                                  ),
                                                   Divider(
                                                    height: 1,
                                                    color: HexColor("#dde1eb"),
                                                  ),
                                                   Padding(
                                                    padding: const EdgeInsets.only(left: 30.0,top: 30.0,bottom: 31.0),
                                                    child: Expanded(
                                                      child: SingleChildScrollView(
                                                        scrollDirection: Axis.horizontal,
                                                        child: Row(children: [
                                                           const Column(

                                                            crossAxisAlignment:CrossAxisAlignment.start,
                                                              children: [
                                                            Padding(
                                                              padding: EdgeInsets.only(bottom: 33.0,top: 5),
                                                              child: Text("Email:"),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(bottom: 81.0),
                                                              child: Text("Contact Number:"),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(bottom: 33.0),
                                                              child: Text("Country:"),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(bottom: 33.0),
                                                              child: Text("Governorate:"),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(bottom: 32.0),
                                                              child: Text("Region:"),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(bottom: 31.0),
                                                              child: Text("Address:"),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(bottom: 32.0),
                                                              child: Text("License Number:"),
                                                            ),
                                                            Text("Commercial Register:"),

                                                                                                                   ]),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left:21.0),
                                                            child: Column(
                                                                crossAxisAlignment:CrossAxisAlignment.start,
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  const Padding(
                                                                    padding: EdgeInsets.only(bottom: 35.0,top: 8),
                                                                    child: Text("elezaby123456@gmail.com"),
                                                                  ),
                                                                  const Padding(
                                                                    padding: EdgeInsets.only(bottom: 40.0),
                                                                    child: Column(
                                                                      children: [
                                                                        Text("01202617505"),
                                                                        Text("01202617505"),
                                                                        Text("01202617505"),

                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const Padding(
                                                                    padding: EdgeInsets.only(bottom: 35.0),
                                                                    child: Text("Egypt"),
                                                                  ),
                                                                  const Padding(
                                                                    padding: EdgeInsets.only(bottom: 35.0),
                                                                    child: Text("Alexandria"),
                                                                  ),
                                                                  const Padding(
                                                                    padding: EdgeInsets.only(bottom: 35.0),
                                                                    child: Text("El montaza"),
                                                                  ),
                                                                  const Padding(
                                                                    padding: EdgeInsets.only(bottom: 25.0),
                                                                    child: Text("8587 Frida Ports"),
                                                                  ),
                                                                  const Padding(
                                                                    padding: EdgeInsets.only(bottom: 30.0),
                                                                    child: Text("5180682"),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      const Text("commercial_register.pdf"),
                                                                      const SizedBox(width:30),
                                                                      InkWell(
                                                                        onTap: () {},
                                                                        child: Container(
                                                                          width: 60,
                                                                          height: 23,
                                                                          decoration: BoxDecoration(
                                                                            color: const Color.fromRGBO(74, 114, 255, 0.05),
                                                                            borderRadius: BorderRadius.circular(14),
                                                                          ),
                                                                          child: Row(
                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                "Show",
                                                                                style: TextStyle(
                                                                                  color: HexColor(primary),
                                                                                  fontSize: 14,
                                                                                  fontFamily: 'Poppins',
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                              ),
                                                                              const SizedBox(width:6),
                                                                              const Icon(Icons.file_present_outlined, size: 13, color: Colors.blueAccent),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  ),

                                                                ]),
                                                          ),

                                                        ],),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 31.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(8)),
                                              border: Border.fromBorderSide(
                                                  BorderSide(
                                                      color: HexColor("#dde1eb")))),

                                          width: MediaQuery.of(context).size.width -
                                              858.3,

                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 32.0,
                                                    left: 30.0,
                                                    bottom: 27),
                                                child: Text(
                                                  "Pharmacist Details ",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily:
                                                      "Poppins-SemiBold",
                                                      color: HexColor("#23262a")),
                                                ),
                                              ),
                                              Divider(
                                                height: 1,
                                                color: HexColor("#dde1eb"),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.only(left: 30.0,top: 30.0,bottom: 31.0),
                                                child: SingleChildScrollView(
                                                  scrollDirection: Axis.horizontal,
                                                  child: Row(children: [
                                                    Column(

                                                        crossAxisAlignment:CrossAxisAlignment.start,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets.only(bottom: 33.0,top: 5),
                                                            child: Text("First Name:"),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets.only(bottom: 33.0),
                                                            child: Text("Last Name:"),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets.only(bottom: 33.0),
                                                            child: Text("Email:"),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets.only(bottom: 33.0),
                                                            child: Text("Phone Number:"),
                                                          ),
                                                          Text("License Number:"),


                                                        ]),
                                                    Padding(
                                                      padding: EdgeInsets.only(left:21.0),
                                                      child: Column(
                                                          crossAxisAlignment:CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.only(bottom: 35),
                                                              child: Text("Ahmed"),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(bottom: 30.0),
                                                              child: Column(
                                                                children: [
                                                                  Text("Mohammed"),


                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(bottom: 40.0),
                                                              child: Text("ahmedmo1463@gmail.com"),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(bottom: 35.0),
                                                              child: Text("01503632147"),
                                                            ),
                                                            Text("126565"),


                                                          ]),
                                                    ),

                                                  ],),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Stack(
                            children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only( top: 80.0),
                              child: SingleChildScrollView(
                                child: PaginatedDataTable(
                                  showEmptyRows: false,
                                  primary: true,
                                  sortAscending: sort,
                                  sortColumnIndex: 2,

                                  columnSpacing:(MediaQuery.of(context).size.width - 130)/7,

                                  dataRowMaxHeight: 72,
                                  headingRowColor:
                                  const MaterialStatePropertyAll(Color(0xffEAECF0)),
                                  columns: [
                                    const DataColumn(label: Text('ID')),
                                    const DataColumn(label: Text('Photo')),
                                    DataColumn(
                                      onSort: (columnIndex, ascending) {
                                        if (columnIndex == 2) {
                                          setState(() {
                                            sort = ascending;
                                            if (ascending) {
                                              filterData
                                                  ?.sort((a, b) => a.name.compareTo(b.name));
                                            } else {
                                              filterData
                                                  ?.sort((a, b) => b.name.compareTo(a.name));
                                            }
                                          });
                                        }
                                      },
                                      label: const Row(
                                        children: [
                                          Text('Name'),
                                          SizedBox(
                                            width: 113,
                                          )
                                        ],
                                      ),
                                    ),
                                    const DataColumn(
                                      label:
                                      SizedBox(width: 159, child: Text('Contact Number')),
                                    ),
                                    const DataColumn(
                                      label: Text('Address'),
                                    ),
                                    const DataColumn(
                                      label: Text('State'),
                                    ),
                                    const DataColumn(label: Text("")),
                                  ],
                                  source: DTS(pharmacyDemoData),
                                  rowsPerPage: _rowPerPage,
                                  onRowsPerPageChanged: (r) => setState(() {
                                    _rowPerPage = r!;
                                  }),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                   top: 30, bottom: 10),
                              child: Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width - 130,
                                          height: 40,
                                          child: TextFormField(
                                            controller: controllerOfFilter,
                                            onChanged: (value) {
                                              setState(() {
                                                pharmacyDemoData = filterData!
                                                    .where(
                                                        (element) => element.name.contains(value))
                                                    .toList();
                                              });
                                            },
                                            decoration: InputDecoration(
                                                filled: true,
                                                fillColor: HexColor(white),
                                                hintText: 'Search order by date,  or store',
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
                                                  borderSide:
                                                  BorderSide(color: HexColor(bWhite90)),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: HexColor(primary)),
                                                ),
                                                contentPadding:
                                                const EdgeInsets.symmetric(vertical: 5)),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        MaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              filterVisiblity = !filterVisiblity;
                                            });
                                          },
                                          color: HexColor(primary),
                                          elevation: 0,
                                          height: 48,
                                          minWidth: 48,
                                          shape: OutlineInputBorder(
                                            borderSide: BorderSide(color: HexColor(primary)),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: const Icon(
                                            Icons.filter_list_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Visibility(
                                      visible: filterVisiblity,
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(8.0)),
                                        width: 280,
                                        height: 227,
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 20.0),
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(left: 20.0, top: 20.0),
                                                  child: Text(
                                                    "Filter Options",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Poppins-SemiBold',
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 14.0),
                                                  child: Divider(
                                                    height: 1,
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 20.0, left: 20.0),
                                                  child: Text(
                                                    "State:",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Poppins-Medium',
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(
                                                            left: 13.0, top: 14.0),
                                                        child: Checkbox(
                                                          overlayColor:
                                                          const MaterialStatePropertyAll(
                                                              Colors.transparent),

                                                          side: BorderSide(
                                                              color: HexColor(white70),
                                                              width: 1.3),

                                                          activeColor: HexColor(primary),
                                                          value:
                                                          activatedIsChecked, // Adjust initial value as needed
                                                          onChanged: (value) {
                                                            setState(() {
                                                              activatedIsChecked = value!;
                                                            });
                                                          }, // Pass the function reference
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(
                                                            left: 2.5, top: 14.0),
                                                        child: Container(
                                                          width: 78,
                                                          height: 26,
                                                          decoration: BoxDecoration(
                                                            color: HexColor('#ecfdf3'),
                                                            borderRadius:
                                                            BorderRadius.circular(14),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "Activated",
                                                              style: TextStyle(
                                                                color: HexColor('#009881'),
                                                                fontSize: 12,
                                                                fontFamily: 'Poppins',
                                                                fontWeight: FontWeight.w500,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(
                                                            left: 15.0, top: 14.0),
                                                        child: Checkbox(
                                                          overlayColor:
                                                          const MaterialStatePropertyAll(
                                                              Colors.transparent),
                                                          focusColor: Colors.black,
                                                          side: BorderSide(
                                                              color: HexColor(white70),
                                                              width: 1.3),
                                                          activeColor: HexColor(primary),
                                                          value:
                                                          deactivatedIsChecked, // Adjust initial value as needed
                                                          onChanged: (value) {
                                                            setState(() {
                                                              deactivatedIsChecked = value!;
                                                            });
                                                          }, // Pass the function reference
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(
                                                            left: 2.5, top: 14.0),
                                                        child: Container(
                                                          padding: const EdgeInsets.symmetric(
                                                              horizontal: 2.5),
                                                          width: 85,
                                                          height: 26,
                                                          decoration: BoxDecoration(
                                                            color: HexColor('#fff2ea'),
                                                            borderRadius:
                                                            BorderRadius.circular(14),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "Deactivated",
                                                              style: TextStyle(
                                                                color: HexColor('#f15046'),
                                                                fontSize: 12,
                                                                fontFamily: 'Poppins',
                                                                fontWeight: FontWeight.w500,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                Row(
                                                  children: [
                                                    const Spacer(),
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          bottom: 18, top: 34),
                                                      child: MaterialButton(
                                                          minWidth: 58,
                                                          height: 34,
                                                          elevation: 0.0,
                                                          color: HexColor("#f5f6fa"),
                                                          onPressed: () {
                                                            setState(() {
                                                              deactivatedIsChecked = false;
                                                              activatedIsChecked = false;
                                                              pharmacyDemoData = filterData!;
                                                            });
                                                          },
                                                          child: Text(
                                                            "Reset",
                                                            style: TextStyle(
                                                                fontFamily: "Poppins-SemiBold",
                                                                fontSize: 12,
                                                                color: HexColor("#60656e")),
                                                          )),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          left: 8.0, bottom: 18, top: 34),
                                                      child: MaterialButton(
                                                          minWidth: 58,
                                                          height: 34,
                                                          elevation: 0.0,
                                                          color: HexColor(primary),
                                                          onPressed: () {
                                                            setState(() {
                                                              if (deactivatedIsChecked == true &&
                                                                  activatedIsChecked == true) {
                                                                pharmacyDemoData = filterData!;
                                                              } else if (activatedIsChecked ==
                                                                  true) {
                                                                pharmacyDemoData = filterData!
                                                                    .where((element) => element
                                                                    .state
                                                                    .contains("Activated"))
                                                                    .toList();
                                                              } else if (deactivatedIsChecked ==
                                                                  true) {
                                                                pharmacyDemoData = filterData!
                                                                    .where((element) => element
                                                                    .state
                                                                    .contains("Deactivated"))
                                                                    .toList();
                                                              } else {
                                                                pharmacyDemoData = filterData!;
                                                              }
                                                            });
                                                          },
                                                          child: Text(
                                                            "Apply",
                                                            style: TextStyle(
                                                                fontFamily: "Poppins-SemiBold",
                                                                fontSize: 12,
                                                                color: HexColor("#ffffff")),
                                                          )),
                                                    )
                                                  ],
                                                )
                                              ]),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                        Wrap(
                          children:[ SizedBox(
                            height: 180,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    buildDataCard(dataList[index], index),
                                itemCount: dataList.length),
                          )],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildDataCard(DataCardModel dataCardModel,int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 20),
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: HexColor(bWhite90),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dataCardModel.cardTitle,
                    style: TextStyle(
                      color: HexColor(black),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    dataCardModel.cardNumber,
                    style: TextStyle(
                      color: HexColor(black),
                      fontSize: 28,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'This Week',
                        style: TextStyle(
                          fontSize: 14,
                          color: HexColor(bWhite90),
                        ),
                      ),
                      items: itemList
                          .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                            color: HexColor(white70),
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ))
                          .toList(),
                      value: selectedItem,
                      iconStyleData:
                      IconStyleData(iconEnabledColor: HexColor(white70)),
                      onChanged: (String? value) {
                        setState(() {
                          selectedItem = value;
                        });
                      },
                      buttonStyleData: const ButtonStyleData(
                        height: 40,
                        width: 125,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          HexColor(dataCardModel.color),
                          Colors.white,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(dataCardModel.cardIcon,color: HexColor(dataCardModel.color),)),
                  ),
                  const Spacer(),
                  Container(
                    height: 25,
                    width: 65,
                    decoration: BoxDecoration(
                      color: dataCardModel.cardState
                          ? HexColor(warning).withOpacity(0.20999999344348907)
                          : HexColor('#ecfdf3'),
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Row(children: [
                      const SizedBox(width: 10),
                      setPhoto(
                          kind: 1,
                          path: dataCardModel.cardImage,
                          width: 15,
                          height: 9),
                      const SizedBox(width: 10),
                      Text(
                        dataCardModel.cardPercentage,
                        style: TextStyle(
                          color: dataCardModel.cardState
                              ? const Color(0xfff15046)
                              : HexColor('#009881'),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}
