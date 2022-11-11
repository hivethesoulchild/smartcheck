import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ScannerPage extends StatefulWidget {
  const ScannerPage({Key? key}) : super(key: key);

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  @override
  void initState() {
    startCamera();
    super.initState();
  }

  void startCamera() async {
    cameras = await availableCameras();

    cameraController = CameraController(cameras[0], ResolutionPreset.ultraHigh,
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

  @override
  Widget build(BuildContext context) {
    showAlertDialog(BuildContext context) {
      AlertDialog alert = AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        contentPadding: EdgeInsets.only(top: 10.0),
        title: Text(
          'Results',
          style: GoogleFonts.poppins(),
        ),
        content: SizedBox(
          height: 300,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
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
