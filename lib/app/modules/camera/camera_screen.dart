import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPreviewScreen extends StatefulWidget {
  const CameraPreviewScreen({super.key});

  @override
  State<CameraPreviewScreen> createState() => _CameraPreviewScreenState();
}

class _CameraPreviewScreenState extends State<CameraPreviewScreen> {
  CameraController? cameraController;

  @override
  void initState() {
    super.initState();
    availableCameras().then((cameras) {
      final cameraDescription = cameras.first;
      cameraController = CameraController(
        cameraDescription,
        ResolutionPreset.high,
      );
      cameraController?.initialize().then((_) {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController != null) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cameraController!.value.isInitialized
            ? CameraPreview(cameraController!)
            : const SizedBox.shrink(),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
