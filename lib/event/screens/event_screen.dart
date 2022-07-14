import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:stocio_app/common/utils/utils.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/widgets/s_ios_back.dart';
import 'package:stocio_app/common/widgets/s_text_form_field.dart';
import 'package:stocio_app/event/components/event_card_medium.dart';
import 'package:stocio_app/event/models/event_type_card_model.dart';
import 'package:stocio_app/event/screens/add_images.dart';
import 'package:stocio_app/event/screens/event_type_card.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchNode = FocusNode();

  final List<EventTypeCardModel> list = [
    EventTypeCardModel(label: "Robotics", src: "https://bit.ly/3QaY8mr"),
    EventTypeCardModel(label: "Dance", src: "https://bit.ly/3HbwqBJ"),
    EventTypeCardModel(label: "Sing", src: "https://bit.ly/399TIeX"),
    EventTypeCardModel(label: "Drama", src: "https://bit.ly/3Ha6oyK"),
    EventTypeCardModel(label: "Hackathons", src: "https://bit.ly/3NH0Uho"),
  ];

  static const Duration _animationDuration = Duration(milliseconds: 800);
  bool _isCardVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Obtain a list of the available cameras on the device.
          late List<CameraDescription> cameras;
          try {
            cameras = await availableCameras();

          } on CameraException catch (e) {
            debugPrint(e.code + e.description.toString());
          }

          // Get a specific camera from the list of available cameras.
          final firstCamera = cameras.first;

          Utils.navigatePush(context, (p0, p1, p2) =>  AddImagesScreen(camera: firstCamera));
        },
        backgroundColor: Utils.getColor('PBB'),
        child: Icon(
          Icons.add_rounded,
          size: 28.sp,
          color: Utils.getColor(''),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: Utils.bgGradient(),
        child: WillPopScope(
          onWillPop: () async {
            if (_searchNode.hasFocus) {
              _searchNode.unfocus();
              return false;
            } else if (_isCardVisible == false) {
              setState(() {
                _isCardVisible = true;
              });
              return false;
            }
            return true;
          },
          child: GestureDetector(
            onTap: () {
              if (_searchNode.hasFocus) {
                _searchNode.unfocus();
              }
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SBack(
                    onPressed: () {
                      if (_searchNode.hasFocus) {
                        _searchNode.unfocus();
                      } else if (_isCardVisible == false) {
                        setState(() {
                          _isCardVisible = true;
                        });
                      } else {
                        Navigator.pop(context);
                      }
                    },
                  ),
                  Padding(
                    padding: Utils.contentPadding(horizontal: 10.w),
                    child: STextFormField(
                      label: '🔎 Discover . . .',
                      controller: _searchController,
                      validator: (String? value) => '',
                      focusNode: _searchNode,
                      padding: Utils.contentPadding(vertical: 2.h),
                      suffix: InkWell(
                        child: Icon(
                          Icons.search_rounded,
                          size: 24.sp,
                        ),
                        onTap: () {
                          debugPrint("Searching");
                        },
                      ),
                    ),
                  ),
                  AnimatedSwitcher(
                      duration: _animationDuration,
                      child: _isCardVisible
                          ? GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: Utils.contentPadding(),
                              mainAxisSpacing: 2.h,
                              crossAxisSpacing: 5.w,
                              children: list
                                  .map((eventCard) => EventTypeCard(
                                        label: eventCard.label,
                                        src: eventCard.src,
                                        onTap: () =>
                                            _handleCardOnTap(eventCard.label),
                                      ))
                                  .toList(),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              padding: Utils.contentPadding(),
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 2,
                              itemBuilder: (BuildContext context, int index) {
                                return const EventCardMedium();
                              },
                            ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _handleCardOnTap(String label) async {
    debugPrint(label.toLowerCase());
    setState(() {
      _isCardVisible = false;
    });
  }
}
