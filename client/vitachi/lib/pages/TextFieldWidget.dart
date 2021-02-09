import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {

  final String hintText;
  final IconData prefixIconData;
  final bool obscureText;
  final Color color = Color(0xff3f8ee9);

  TextFieldWidget({
      this.hintText,
      this.prefixIconData,
      this.obscureText,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/12,
      width: MediaQuery.of(context).size.width/1.2,

      child: TextFormField(
        style: TextStyle(
            color: color,
            fontSize: 18
        ),
        cursorColor: color,
        obscureText: obscureText,
        decoration: InputDecoration(
          errorStyle: TextStyle(height: 0),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red)
          ),
          prefixIcon: Icon(
            prefixIconData,
            size: MediaQuery.of(context).size.height/35,
            color: color,
          ),
          filled: true,
          labelText: hintText,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: color)
          ),
          labelStyle: TextStyle(color: color),
          focusColor: color,

        ),
        validator: (value) {
          if (value.isEmpty) {
            return '';
          }
          return null;
        },
      ),
    );
  }
}
