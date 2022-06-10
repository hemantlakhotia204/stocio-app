import 'package:flutter/material.dart';
import 'package:stocio_app/common/utils/utils.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/widgets/s_ios_back.dart';
import 'package:stocio_app/common/widgets/s_text_form_field.dart';
import 'package:stocio_app/event/models/event_type_card_model.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: Utils.bgGradient(),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SBack(),
              Padding(
                padding: Utils.contentPadding(horizontal: 10.w),
                child: STextFormField(
                  controller: _searchController,
                  validator: (String? value) => '',
                  focusNode: _searchNode,
                  suffixIcon: Icon(
                    Icons.search_rounded,
                    size: 24.sp,
                  ),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: Utils.contentPadding(),
                mainAxisSpacing: 2.h,
                crossAxisSpacing: 5.w,
                children: list
                    .map((eventCard) => EventTypeCard(
                          label: eventCard.label,
                          src: eventCard.src,
                          onTap: () => _handleCardOnTap(eventCard.label),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _handleCardOnTap(String label) async {
    debugPrint(label.toLowerCase());
  }
}
