import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:smartcheck/backend/backendpy.dart';
import 'package:uuid/uuid.dart';

class ScannerPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  final dynamic id;
  final String batchId;

  const ScannerPage(
      {Key? key,
      required this.batchId,
      required this.cameras,
      required this.id})
      : super(key: key);

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  late Future<void> cameraValue;
  late CameraController cameraController;

  @override
  void initState() {
    startCamera();
    super.initState();
  }

  void startCamera() async {
    cameraController = CameraController(
      widget.cameras[0],
      ResolutionPreset.max,
      enableAudio: false,
    );
    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      cameraController.setFocusMode(FocusMode.auto);
      cameraController.setExposureMode(ExposureMode.auto);
      setState(() {});
    }).catchError((e) {});
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  void showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      contentPadding: const EdgeInsets.only(top: 10.0),
      title: Text(
        'Students',
        style: GoogleFonts.poppins(),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            saveData();
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue[900],
          ),
          child: const Text("Save"),
        ),
      ],
      content: SizedBox(
        height: 100,
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
                  onChanged: (value) {},
                  value: list.first,
                  isExpanded: true,
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
      },
    );
  }

  Future<XFile?> _captureImage(BuildContext context) async {
    if (!cameraController.value.isInitialized) {
      return null;
    }

    // Show the loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return _LoadingDialog();
      },
    );

    try {
      // Capture the image
      final XFile imageFile = await cameraController.takePicture();

      // Upload the image
      var response =
          await BackEndPy.uploadImage(imageFile, widget.batchId, widget.id);

      // Save the image locally
      final File? savedImage = await _saveImage(imageFile);

      // Dismiss the loading dialog
      Navigator.pop(context);

      if (response['status'] == "fail") {
        Fluttertoast.showToast(
          msg: 'Please try again!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      } else {
        Fluttertoast.showToast(
          msg: 'Successful!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      }

      if (savedImage != null) {}

      return imageFile;
    } catch (e) {
      // Handle errors
      Navigator.pop(context); // Dismiss the loading dialog in case of an error
      return null;
    }
  }

  Future<File?> _saveImage(XFile imageFile) async {
    try {
      final directory = await getExternalStorageDirectory();

      var uuid = const Uuid();
      var uniqueId = uuid.v4();

      final String imagePath = '${directory!.path}/$uniqueId.jpg';

      final List<int> imageBytes = await imageFile.readAsBytes();
      await File(imagePath).writeAsBytes(imageBytes);

      return File(imagePath);
    } catch (e) {
      return null;
    }
  }

  void processShapes(List<Rect> shapes) {
    for (var shape in shapes) {
      // You can also perform other tasks based on the shape, such as drawing on an image or performing calculations.
      // Add your custom logic here.
    }
  }

  List<Rect> detectShapes() {
    List<Rect> shapes = [
      const Rect.fromLTWH(17, 120, 378, 475),
    ];

    return shapes;
  }

  Future<void> saveData() async {
    // TODO: Implement the logic to save data
  }

  List<String> list = <String>['', '', ''];

  @override
  Widget build(BuildContext context) {
    List<Rect> detectedShapes = detectShapes();
    processShapes(detectedShapes);
    if (cameraController.value.isInitialized) {
      return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Center(
                    child: AspectRatio(
                      aspectRatio: 9 / 16, // Set aspect ratio for portrait mode
                      child: CameraPreview(cameraController),
                    ),
                  ),
                  Positioned(
                    top: 40.0,
                    left: 16.0,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Handle back button press
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  for (var shape in detectedShapes)
                    Positioned(
                      left:
                          (MediaQuery.of(context).size.width - shape.width) / 2,
                      top: (MediaQuery.of(context).size.height - shape.height) /
                          3,
                      width: shape.width,
                      height: shape.height,
                      child: _buildSquare(
                        Colors.white10,
                        Colors.transparent,
                        Colors.white10,
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await _captureImage(context);
                      //return to page
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      shadowColor: Colors.black,
                      backgroundColor: Colors.white,
                    ),
                    child: const SizedBox(
                      height: 60,
                      width: 60,
                      child: Icon(
                        Icons.camera_alt,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  Widget _buildSquare(Color color1, Color color2, Color color3) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1, color2, color3],
            stops: const [0, 0.5, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: Border.all(
            color: Colors.black,
            width: 2.5,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}

class _LoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Processing...'),
          ],
        ),
      ),
    );
  }
}
