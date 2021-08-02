import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_utility/controllers/textFieldController.dart';
import '../constants.dart';

class CustomPasswordTextField extends StatelessWidget {
  final TextEditingController textController;
  final IconData icon;
  final String hintText;
  final String labelText;
  CustomPasswordTextField({
    this.textController,
    this.icon,
    this.hintText,
    this.labelText,
  });

  final controller = Get.put(TextFieldController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.09,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        boxShadow: [
          BoxShadow(
            color: kBlackColour.withOpacity(0.2),
            // spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(2, 7),
          ),
        ],
      ),
      child: Obx(() {
        return TextField(
          // onEditingComplete: () {
          //   controller.changeFocusColour(Color(0xff131313));
          // },
          onTap: () {
            controller.changeFocusColour(Color(0xff131313));
          },
          controller: textController,
          keyboardType: TextInputType.emailAddress,
          // obscureText: isObscureText,
          obscureText: controller.isObscureText,
          obscuringCharacter: '*',
          style: GoogleFonts.cabin(
            fontSize: 15,
            // color: Color(0xFFD4145A),
            // color: _focusColour,
            color: controller.focusColour,
          ),
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                controller.changeObscurity(!controller.isObscureText);

                if (controller.isObscureText)
                  controller.changeEyeIcon(Icons.visibility_off);
                else
                  controller.changeEyeIcon(Icons.visibility);
              },
              child: Icon(
                controller.eyeIcon,
                color: controller.focusColour,
              ),
            ),

            labelText: labelText,
            labelStyle: GoogleFonts.cabin(
              fontSize: 17.5,
              // color: Color(0xFFD4145A),
              color: controller.focusColour,
            ),
            hintText: hintText,
            hintStyle: GoogleFonts.cabin(
              fontSize: 15,
              // color: Color(0xFFD4145A),
              color: controller.focusColour,
            ),
            // helperText: 'saskar@gmail.com',
            // errorText: 'error',
            // floatingLabelBehavior: FloatingLabelBehavior.auto,
            contentPadding: EdgeInsets.all(20.0),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 25.0),
              child: Icon(
                icon,
                // color: Color(0xFFD4145A),
                color: controller.focusColour,
              ),
            ),

            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                // color: Color(0xFFD4145A),
                color: controller.focusColour,
                // style: BorderStyle.none,
                width: 1.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                // color: Color(0xFFD4145A),
                color: controller.focusColour,
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
            ),
          ),
        );
      }),
    );
  }
}

class NewPasswordTextfield extends StatelessWidget {
  final TextEditingController textController;

  NewPasswordTextfield({
    key,
    this.textController,
  }) : super(key: key);

  // Color focuscolor = Color(0xffaaabac);
  final controller = Get.put(TextFieldController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.068,
      width: size.width * 0.9,
      child: Obx(() {
        return TextField(
          onTap: () {
            controller.changeFocusColour(Color(0xff085dcf));
          },
          controller: textController,
          keyboardType: TextInputType.emailAddress,
          obscureText: controller.isObscureText,
          style: TextStyle(color: Colors.grey),
          cursorColor: Color(0xffaaabac),
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                controller.changeObscurity(!controller.isObscureText);

                if (controller.isObscureText)
                  controller.changeEyeIcon(Icons.visibility_off);
                else
                  controller.changeEyeIcon(Icons.visibility);
              },
              child: Icon(
                controller.eyeIcon,
                color: controller.focusColour,
              ),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 20),
              child: Icon(
                EvaIcons.lockOutline,
                color: controller.focusColour,
              ),
            ),
            hintText: 'Enter your password',
            hintStyle: TextStyle(color: Color(0xffaaabac), fontSize: 14),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: controller.focusColour, width: 1.5),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            filled: true,
            fillColor: Color(0xff101010),
            labelText: 'Enter Password'.toUpperCase(),
            labelStyle: TextStyle(color: controller.focusColour, fontSize: 14),
          ),
        );
      }),
    );
  }
}
