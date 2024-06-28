

import 'package:fiinzy_pro/constants/constants.dart';

import '../constants/get_device_type.dart';

class MyTextFormField extends StatefulWidget {
  final Function(String)? onChanged;
  final Function()? onTab;
  final FocusNode? focusNode;
  final String hint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final int? maxLines;
  final int? maxLength;
  final Color? fillColor;
  final Color border;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? counterText;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;

  const MyTextFormField(
      {Key? key,
      required this.hint,
      this.suffixIcon,
      required this.obscureText,
      this.maxLines,
      this.fillColor,
      this.controller,
      this.validator,
      this.maxLength,
      this.keyboardType,
      this.prefixIcon,
      this.counterText,
      this.onChanged,
      this.focusNode,
      required this.readOnly,
        this.inputFormatters,
      this.onTab, required this.border})
      : super(key: key);

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      inputFormatters: widget.inputFormatters,
      focusNode: widget.focusNode,
      textAlign: TextAlign.start,
      onTap: widget.onTab,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      validator: widget.validator,
      controller: widget.controller,
      maxLines: widget.maxLines,
      obscureText: widget.obscureText,
      style: const TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.black,
          fontFamily: regular,
          fontSize: 14),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        counterText: widget.counterText,
        filled: true,
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
        hintText: widget.hint,
        hintStyle: TextStyle(
            fontWeight: FontWeight.w300,
            color: Color(0xFF8F8F8F),
            fontFamily: regular,
            fontSize: GetDeviceType().getDeviceType(context)? 16 : 12),
        focusedBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: widget.border),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:  BorderSide(color:widget.border),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: widget.border),
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: widget.border),
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: widget.fillColor,
        border: OutlineInputBorder(
          borderSide:  BorderSide(color: widget.border),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: widget.border),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
