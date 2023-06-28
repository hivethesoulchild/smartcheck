import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:io';
import 'dart:ui';
import 'package:path/path.dart' as path;
import 'package:smartcheck/backend/backendpy.dart';

class ScannerPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  final dynamic id; 

  const ScannerPage({Key? key, required this.cameras, required this.id}) : super(key: key);

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
    }).catchError((e) {
      print(e);
    });
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
                  onChanged: (value) => null,
                  value: list.first,
                  isExpanded: true,
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Column(
              //     children: [Text('English: 17')],
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Column(
              //     children: [Text('Mathematics: 15')],
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Column(
              //     children: [Text('Science: 13')],
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Column(
              //     children: [Text('Aptitude: 10')],
              //   ),
              // ),
              // Container(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     'Status: Submitted',
              //     style: GoogleFonts.poppins(),
              //   ),
              // ),
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
      print('Camera is not initialized.');
      return null;
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return _LoadingDialog();
      },
    );

    final XFile imageFile = await cameraController.takePicture();
    print('Image captured: ${imageFile.path}');

    BackEndPy.uploadImage(imageFile);

    final File? savedImage = await _saveImage(imageFile);
    Navigator.pop(context); // Dismiss the loading dialog

    if (savedImage != null) {
      print('Image saved at: ${savedImage.path}');
    }

    return imageFile;
  }

  Future<File?> _saveImage(XFile imageFile) async {
    try {
      final directory = await getExternalStorageDirectory();
      final String imagePath = '${directory!.path}/cardCapturedSakura.jpg';

      final List<int> imageBytes = await imageFile.readAsBytes();
      await File(imagePath).writeAsBytes(imageBytes);

      return File(imagePath);
    } catch (e) {
      print('Failed to save image: $e');
      return null;
    }
  }

  // Function to process the shapes detected by the backend
  void processShapes(List<Rect> shapes) {
    for (var shape in shapes) {
      // Perform your desired operations with each detected shape
      // For example, you can print the coordinates of each shape
      print(
          'Shape detected at (${shape.left}, ${shape.top}) with width ${shape.width} and height ${shape.height}');

      // You can also perform other tasks based on the shape, such as drawing on an image or performing calculations.
      // Add your custom logic here.
    }
  }

  // Dummy function to simulate shape detection in the backend
  List<Rect> detectShapes() {
    // Simulate shape detection by returning a list of rectangles (Rect)
    // Replace this logic with your actual shape detection algorithm

    // Creating a list of dummy shapes (rectangles)
    List<Rect> shapes = [
      Rect.fromLTWH(17, 120, 378, 475),
    ];

    return shapes;
  }

  Future<void> saveData() async {
    // TODO: Implement the logic to save data
  }

  List<String> list = <String>['Royce', 'Yvan', 'DJ Falcon'];

  @override
  Widget build(BuildContext context) {
    List<Rect> detectedShapes = detectShapes();
    processShapes(detectedShapes);
    if (cameraController.value.isInitialized) {
      return Scaffold(
        body: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Center(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.width < 360
                                  ? 600
                                  : 700,
                              width: double.infinity,
                              child: CameraPreview(cameraController),
                            ),
                          ),
                        ),
                        for (var shape in detectedShapes)
                          Positioned(
                            top: shape.top,
                            left: MediaQuery.of(context).size.width < 360
                                ? shape.left
                                : 22,
                            child: SizedBox(
                              width: shape.width,
                              height: shape.height,
                              child: _buildSquare(
                                Colors.white10,
                                Colors.transparent,
                                Colors.white10,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Spacer(),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                      await _captureImage(context);
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
                  const Spacer(),
                  const Spacer(),
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
            stops: [0, 0.5, 1],
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
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Saving image...'),
          ],
        ),
      ),
    );
  }
}
