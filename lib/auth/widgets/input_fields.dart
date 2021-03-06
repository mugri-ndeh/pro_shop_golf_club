import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';

class InputField extends StatefulWidget {
  InputField({
    Key? key,
    this.icon,
    required this.hint,
    this.prefixIcon,
    this.password,
    this.controller,
    this.validator,
  }) : super(key: key);
  final Icon? icon;
  final String hint;
  final Icon? prefixIcon;
  final bool? password;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 1),
              color: Colors.grey.shade200,
              blurRadius: 18),
        ],
      ),
      child: SizedBox(
        height: 45,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                textCapitalization: widget.password ?? false
                    ? TextCapitalization.none
                    : TextCapitalization.words,
                validator: widget.validator,
                controller: widget.controller,
                obscureText: widget.password == true ? !visible : false,
                decoration: InputDecoration(
                  prefixIcon: widget.icon,
                  hintText: widget.hint,
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              ),
            ),
            widget.prefixIcon == null
                ? const SizedBox.shrink()
                : GestureDetector(
                    child: visible
                        ? widget.prefixIcon!
                        : const Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                    onTap: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                  )
          ],
        ),
      ),
    );
  }
}

class PhoneInput extends StatefulWidget {
  const PhoneInput({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  String number = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.white,
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 1),
              color: Colors.grey.shade200,
              blurRadius: 18),
        ],
      ),
      child: Center(
        child: IntlPhoneField(
          controller: widget.controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          dropdownIconPosition: IconPosition.leading,
          initialCountryCode: 'CM',
          pickerDialogStyle: PickerDialogStyle(),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.white)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Palette.white)),
              hintText: 'Phone Number',
              border: OutlineInputBorder()),
          onChanged: (phone) {
            print(phone.completeNumber);
            setState(() {
              number = phone.completeNumber;
            });
          },
          onCountryChanged: (country) {
            print('Country changed to: ' + country.name);
          },
        ),
      ),
    );
    ;
  }
}

// class CustomDate extends StatefulWidget {
//   CustomDate({
//     Key? key,
//     required this.hint,
//     required this.prefixIcon,
//     this.controller,
//   }) : super(key: key);
//   final String hint;
//   final Icon prefixIcon;
//   final TextEditingController? controller;

//   @override
//   State<CustomDate> createState() => CustomDateState();
// }

// class CustomDateState extends State<CustomDate> {
//   String pickedDate = '';
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         DatePicker.showDatePicker(context,
//             theme: const DatePickerTheme(
//               containerHeight: 210.0,
//             ),
//             showTitleActions: true,
//             minTime: DateTime(1950, 1, 1),
//             maxTime: DateTime.now(), onConfirm: (date) async {
//           // ignore: avoid_print
//           print('confirm $date');
//           setState(() {
//             widget.controller!.text = '${date.day}/${date.month}/${date.year}';
//           });
//         },
//             currentTime: DateTime.now().subtract(const Duration(days: 20)),
//             locale: LocaleType.en);
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: Palette.white,
//           boxShadow: [
//             BoxShadow(
//                 offset: const Offset(0, 1),
//                 color: Colors.grey.shade200,
//                 blurRadius: 18),
//           ],
//         ),
//         alignment: Alignment.center,
//         height: 50.0,
//         child: TextFormField(
//           controller: widget.controller,
//           enabled: false,
//           decoration: InputDecoration(
//             prefixIcon: widget.prefixIcon,
//             hintText: widget.hint,
//             hintStyle: const TextStyle(color: Colors.grey),
//             enabledBorder: InputBorder.none,
//             focusedBorder: InputBorder.none,
//             errorBorder: InputBorder.none,
//             disabledBorder: InputBorder.none,
//             focusedErrorBorder: InputBorder.none,
//           ),
//         ),
//       ),
//     );
//   }
// }

class PaymentMethodPopup extends StatefulWidget {
  PaymentMethodPopup({Key? key}) : super(key: key);

  @override
  State<PaymentMethodPopup> createState() => _PaymentMethodPopupState();
}

class _PaymentMethodPopupState extends State<PaymentMethodPopup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: elevatedDecoration,
    );
  }
}

var elevatedDecoration = BoxDecoration(
  color: Palette.white,
  boxShadow: [
    BoxShadow(
        offset: const Offset(0, 1),
        color: Colors.grey.shade200,
        blurRadius: 18),
  ],
);
