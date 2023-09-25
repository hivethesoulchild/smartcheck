import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

class AptitudeAnalysis extends StatefulWidget {
  const AptitudeAnalysis({Key? key}) : super(key: key);

  static final List<BatchChart> itemdummy = [
    BatchChart('1', 100, HexColor('35408F')),
    BatchChart('2', 200, HexColor('35408F')),
    BatchChart('3', 300, HexColor('35408F')),
    BatchChart('4', 250, HexColor('35408F')),
    BatchChart('5', 150, HexColor('35408F')),
    BatchChart('6', 400, HexColor('35408F')),
    BatchChart('7', 100, HexColor('35408F')),
    BatchChart('8', 360, HexColor('35408F')),
    BatchChart('9', 240, HexColor('35408F')),
    BatchChart('10', 210, HexColor('35408F')),
    BatchChart('11', 200, HexColor('35408F')),
    BatchChart('12', 310, HexColor('35408F')),
    BatchChart('13', 50, HexColor('35408F')),
    BatchChart('14', 270, HexColor('35408F')),
    BatchChart('15', 310, HexColor('35408F')),
  ];



  @override
  State<AptitudeAnalysis> createState() => _AptitudeAnalysisState();
}

class _AptitudeAnalysisState extends State<AptitudeAnalysis> {

  List<String> datee = ['2020','2021', '2022', '2023', '2024', '2025', '2026', '2027', '2028','2029', '2030', '2031', '2032', '2033', '2034'];
  var selectedValue = '2022';
  @override
  Widget build(BuildContext context) {
    List<charts.Series<BatchChart, String>> series = [
      charts.Series(
        data: AptitudeAnalysis.itemdummy,
        id: "Correct Answer",
        domainFn: (BatchChart cluster, _) => cluster.batch,
        measureFn: (BatchChart cluster, _) => cluster.applicants,
        colorFn: (BatchChart cluster, _) =>
            charts.ColorUtil.fromDartColor(cluster.barColor),
      ),
    ];
    return DefaultTabController(
      length: 1,
      child: StatefulBuilder(
        builder: (context, setStateSB) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: HexColor('#35408f')),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: HexColor('#ffffff'),
              title: Text(
                'Charts',
                style: GoogleFonts.poppins(color: HexColor('#35408f')),
              ),
              actions: [
                PopupMenuButton(
                  icon: const Icon(
                    Icons.sort,
                    color: Colors.grey,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: const Text("Sort by date"),
                      onTap: () {},
                    ),
                    PopupMenuItem(
                      child: const Text("Sort by school"),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
              bottom: TabBar(
                physics: const BouncingScrollPhysics(),
                labelColor: HexColor('#35408f'),
                indicatorColor: HexColor('#35408f'),
                labelStyle: GoogleFonts.poppins(fontSize: 17,),
                unselectedLabelStyle: GoogleFonts.poppins(fontSize: 17,),
                tabs: const [
                  Tab(
                    text: "1-15",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(
                            width: 70,
                            child: Row(
                              children: [
                                DropdownButton(
                                    value: selectedValue,
                                    items: datee
                                        .map<DropdownMenuItem<String>>(
                                            (String value) =>
                                                DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                ))
                                        .toList(),
                                    onChanged: (String? value) {
                                      setStateSB(() {
                                        selectedValue = value!;
                                      });
                                    }),
                              ],
                            ),
                          ),
                        const SizedBox(height: 20,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: charts.BarChart(
                            series,
                            behaviors: [charts.SeriesLegend()],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}

class BatchChart {
  final String batch;
  final int applicants;
  final Color barColor;

  BatchChart(this.batch, this.applicants, this.barColor);
}

// TODO: API Integration
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter/widgets.dart';

// class AptitudeAnalysis extends StatefulWidget {
//   const AptitudeAnalysis({Key? key}) : super(key: key);

//   @override
//   State<AptitudeAnalysis> createState() => _AptitudeAnalysisState();
// }

// class _AptitudeAnalysisState extends State<AptitudeAnalysis> {
//   List<String> datee = ['2020','2021', '2022', '2023', '2024', '2025', '2026', '2027', '2028','2029', '2030', '2031', '2032', '2033', '2034'];
//   var selectedValue = '2022';

//   List<BatchChart> itemdummy = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData(); // Fetch data from API or initialize it here
//   }

//   Future<void> fetchData() async {
//     // Fetch data from your API or initialize the data list here
//     // Example:
//     // final response = await http.get('your_api_url');
//     // final data = jsonDecode(response.body);
//     // itemdummy = parseData(data);
//     // setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<charts.Series<BatchChart, String>> series = [
//       charts.Series(
//         data: itemdummy,
//         id: "Correct Answer",
//         domainFn: (BatchChart cluster, _) => cluster.batch,
//         measureFn: (BatchChart cluster, _) => cluster.applicants,
//         colorFn: (BatchChart cluster, _) =>
//             charts.ColorUtil.fromDartColor(cluster.barColor),
//       ),
//     ];

//     return DefaultTabController(
//       length: 1,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back, color: HexColor('#35408f')),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//           backgroundColor: HexColor('#ffffff'),
//           title: Text(
//             'Charts',
//             style: GoogleFonts.poppins(color: HexColor('#35408f')),
//           ),
//           actions: [
//             PopupMenuButton(
//               icon: Icon(
//                 Icons.sort,
//                 color: Colors.grey,
//               ),
//               itemBuilder: (context) => [
//                 PopupMenuItem(
//                   child: Text("Sort by date"),
//                   onTap: () {},
//                 ),
//                 PopupMenuItem(
//                   child: Text("Sort by school"),
//                   onTap: () {},
//                 ),
//               ],
//             ),
//           ],
//           bottom: TabBar(
//             physics: BouncingScrollPhysics(),
//             labelColor: HexColor('#35408f'),
//             indicatorColor: HexColor('#35408f'),
//             labelStyle: GoogleFonts.poppins(fontSize: 17,),
//             unselectedLabelStyle: GoogleFonts.poppins(fontSize: 17,),
//             tabs: [
//               Tab(
//                 text: "1-15",
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             Center(
//               child: Padding(
//                 padding: EdgeInsets.all(10),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       width: 70,
//                       child: Row(
//                         children: [
//                           DropdownButton(
//                             value: selectedValue,
//                             items: datee.map<DropdownMenuItem<String>>(
//                               (String value) => DropdownMenuItem<String>(
//                                 child: Text(value),
//                                 value: value,
//                               ),
//                             ).toList(),
//                             onChanged: (String? value) {
//                               setState(() {
//                                 selectedValue = value!;
//                               });
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 20,),
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height / 2,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: charts.BarChart(
//                         series,
//                         behaviors: [new charts.SeriesLegend()],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BatchChart {
//   final String batch;
//   final int applicants;
//   final Color barColor;

//   BatchChart(this.batch, this.applicants, this.barColor);
// }
