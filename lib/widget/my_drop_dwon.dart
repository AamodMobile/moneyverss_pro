import 'package:fiinzy_pro/constants/constants.dart';

class CustomDropdownButton extends StatelessWidget {
  final String hintText;
  final String hintText2;
  final List<Map<String, dynamic>> items;
  final String selectedValue;
  final Function(String?) onChanged;

  const CustomDropdownButton({super.key,
    required this.hintText,
    required this.items,
    required this.selectedValue,
    required this.onChanged, required this.hintText2,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child:
      DropdownButtonFormField<String?>(
          icon: const ImageIcon(
            AssetImage(dropDownArrow),
            size: 20,
          ),
          dropdownColor: Colors.white,
          iconDisabledColor: primaryCl,
          iconEnabledColor: primaryCl,
          menuMaxHeight: 400,
          validator: (v) {
            if (v == "") {
              return hintText2;
            }
            return null;
          },
          decoration:  InputDecoration(
            counterText: "",
            filled: true,
            contentPadding: const EdgeInsets.all(10),
            hintText: hintText,
            hintStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xFFB4B4B4),
                fontFamily: regular,
                fontSize: 14),
            errorStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              color: redCl,
              fontFamily: regular,
              fontSize: 12,
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide:
                BorderSide(color: primaryCl,  ),
                borderRadius:
                BorderRadius.all( Radius.circular(10))),
            enabledBorder: const OutlineInputBorder(
                borderSide:
                BorderSide(color: primaryCl,  ),
                borderRadius:
                BorderRadius.all( Radius.circular(10))),
            errorBorder: const OutlineInputBorder(
                borderSide:
                BorderSide(color: primaryCl,  ),
                borderRadius:
                BorderRadius.all( Radius.circular(10))),
            disabledBorder: const OutlineInputBorder(
                borderSide:
                BorderSide(color: primaryCl,  ),
                borderRadius:
                BorderRadius.all( Radius.circular(10))),
            fillColor: Colors.white,
            border: const OutlineInputBorder(
                borderSide:
                BorderSide(color: primaryCl,  ),
                borderRadius:
                BorderRadius.all( Radius.circular(10))),
            focusedErrorBorder: const OutlineInputBorder(
                borderSide:
                BorderSide(color: primaryCl,  ),
                borderRadius:
                BorderRadius.all( Radius.circular(10))),
          ),
          isDense: true,
          hint:  Text(hintText2,
              style: const TextStyle(
                  fontFamily: regular,
                  color: textLightGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
          value: selectedValue,
          isExpanded: true,
          items: items.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, dynamic> item = entry.value;
            return DropdownMenuItem<String>(
              value: item['value'],
              key: ValueKey<String>('${item['value']}_$index'), // Unique key with index
              child: Text(
                item['title'],
                style: const TextStyle(
                  fontFamily: regular,
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged
      )
    );
  }
}