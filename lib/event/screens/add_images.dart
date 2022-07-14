import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/utils/utils.dart';
import 'package:stocio_app/common/widgets/s_icon_button.dart';
import 'package:stocio_app/event/screens/add_event.dart';

class AddImagesScreen extends StatefulWidget {
  final CameraDescription camera;

  const AddImagesScreen({Key? key, required this.camera}) : super(key: key);

  @override
  State<AddImagesScreen> createState() => _AddImagesScreenState();
}

class _AddImagesScreenState extends State<AddImagesScreen>
    with WidgetsBindingObserver {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    // to hide status bar
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.bottom]);

    // To display the current output from the Camera, create a CameraController.
    WidgetsBinding.instance.addObserver(this);
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.ultraHigh,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    //to reshow status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);

    // dispose camera controller when widget is disposed
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // App state changed before we got the chance to initialize.
    if (!_controller.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      _controller.dispose();
    } else if (state == AppLifecycleState.resumed) {
      setState(() {
        _controller = CameraController(
          widget.camera,
          ResolutionPreset.medium,
        );
        _initializeControllerFuture = _controller.initialize();
      });
    }
  }

  List<File> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () async {
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;
            final image = await _controller.takePicture();
            setState(() {
              images.add(File(image.path));
            });
          } catch (e) {
            // If an error occurs, log the error to the console.
            debugPrint(e.toString());
          }
        },
        child: Icon(
          Icons.circle_outlined,
          color: Utils.getColor(''),
          size: 60.sp,
        ),
      ),
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              double? scale;
              var camera = _controller.value;
              final size = MediaQuery.of(context).size;

              if (camera.isInitialized) {
                scale = size.aspectRatio * _controller.value.aspectRatio;
              }

              if (scale != null) {
                if (scale < 1) scale = (1 / scale);
              } else {
                scale = 1.0;
              }

              if (snapshot.connectionState == ConnectionState.done) {
                // If the Future is complete, display the preview.
                return Center(
                  child: Transform.scale(
                    scale: scale,
                    child: CameraPreview(_controller),
                  ),
                );
              } else {
                // Otherwise, display a loading indicator.
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            bottom: 10.h,
            left: 1.w,
            child: SizedBox(
              height: 16.h,
              width: double.maxFinite,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int i) {
                  return Container(
                    width: 15.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: FileImage(images[i])),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 1.w);
                },
                itemCount: images.length,
                shrinkWrap: true,
              ),
            ),
          ),
          Positioned(
              bottom: 20.h,
              right: 2.w,
              child: SIconButton(
                backgroundColor: Utils.getColor('PBB'),
                size: Size(15.w, 15.w),
                borderRadius: BorderRadius.circular(15.w),
                padding: Utils.contentPadding(horizontal: 1.w, vertical: 1.h),
                icon: Icon(Icons.navigate_next_rounded, size: 30.sp),
                onPressed: () {
                  Utils.navigatePushReplace(
                    context,
                    (p0, p1, p2) => AddEventScreen(images: images),
                  );
                },
              )),
        ],
      ),
    );
  }
}
