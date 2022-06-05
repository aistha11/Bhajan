
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAlert extends StatelessWidget {
  CustomAlert({Key? key, required this.last, required this.title})
      : super(key: key);
  final int last;
  final String title;

  final formKey = GlobalKey<FormState>();

  var id = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Select $title no."),
      content: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          controller: id,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            helperText: "Input number between 1 and $last",
          ),
          validator: (val){
            if(val == null || val.isEmpty){
              return "Required valid no*";
            }
            var res = int.tryParse(val);
            if(res == null){
              return "Invalid characters";
            }
            if(res<0 || res>last){
              return "Enter no within the range";
            }
            return null;
          },
          onFieldSubmitted: (val) {
            Get.back(result: val);
          },
        ),
      ),
    );
  }
}
