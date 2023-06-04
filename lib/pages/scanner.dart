import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ScannerPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const ScannerPage({Key? key, required this.cameras}) : super(key: key);

  @override
  State<ScannerPage> createState() => _ScannerPageState();
  
}

// void sendDataToAPI() async {
//   try {
//     final url = Uri.parse('#');
    
//     final response = await http.post(
//       url,
//       body: {
//         'data': 'Some data',
//       },
//     );

//     if (response.statusCode == 200) {
//       print(response.body);
//     } else {
//       print('Request failed with status: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Exception: $e');
//   }
// }


class _ScannerPageState extends State<ScannerPage> {
  late Future<void> cameraValue;

  late CameraController cameraController;

  @override
  void initState() {
    startCamera();
    super.initState();
  }

  void startCamera() async {

    cameraController = CameraController(widget.cameras[0], ResolutionPreset.ultraHigh,
        enableAudio: false);

    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  List<String> list = <String>['Royce', 'Yvan', 'DJ Falcon'];

  List<String> datata = [];

  @override
  Widget build(BuildContext context) {
    showAlertDialog(BuildContext context) {
      AlertDialog alert = AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.only(top: 10.0),
        title: Text(
          'Results',
          style: GoogleFonts.poppins(),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel"),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, foregroundColor: Colors.white),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Save"),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue[900]),
          ),
        ],
        content: SizedBox(
          height: 350,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) => null,
                    value: list.first,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [Text('English: 17')],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [Text('Mathematics: 15')],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [Text('Science: 13')],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [Text('Aptitude: 10')],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Status: Submitted',
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Recommendations: BS Information technology',
                    style: GoogleFonts.poppins(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }

    if (cameraController.value.isInitialized) {
      return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Center(
                child: SizedBox(
                  height: 650,
                  width: 420,
                  child: CameraPreview(cameraController),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  showAlertDialog(context);
                },
                child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Icon(
                      Icons.camera_alt,
                      size: 30,
                      color: Colors.black,
                    )),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  shadowColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
