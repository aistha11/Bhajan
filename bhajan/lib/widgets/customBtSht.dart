import 'package:bhajan/widgets/myText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBtSht extends StatefulWidget {
  const CustomBtSht({
    Key? key,
    required this.showChord,
    required this.toggleShowChord,
    required this.showEng,
    required this.toggleShowEng,
  }) : super(key: key);
  final bool showChord;
  final Function toggleShowChord;
  final bool showEng;
  final Function toggleShowEng;

  @override
  State<CustomBtSht> createState() => _CustomBtShtState();
}

class _CustomBtShtState extends State<CustomBtSht> {
  bool showChord = false;
  bool showEng = false;
  @override
  void initState() {
    super.initState();
    showChord = widget.showChord;
    showEng = widget.showEng;
  }

  void toggleShowChord(bool val) {
    setState(() {
      showChord = val;
    });
  }
  void toggleShowEng(bool val) {
    setState(() {
      showEng = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: Get.height * 0.30,
      decoration: BoxDecoration(
        color: Colors.blue.shade300,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(19),
          topRight: Radius.circular(19),
        ),
      ),
      child: Column(children: [
        Row(
          children: [
            Center(
                child: MyText(
              text: !showChord ? "Show Chord" : "Hide Chord",
            )),
            Checkbox(
                value: showChord,
                onChanged: (val) {
                  widget.toggleShowChord(val);
                  toggleShowChord(val!);
                }),
          ],
        ),
        Row(
          children: [
            Center(
                child: MyText(
              text: !showEng ? "Show English" : "Hide English",
            )),
            Checkbox(
                value: showEng,
                onChanged: (val) {
                  widget.toggleShowEng(val);
                  toggleShowEng(val!);
                }),
          ],
        ),
      ]),
    );
  }
}
