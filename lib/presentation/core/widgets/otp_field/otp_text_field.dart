import 'package:flutter/material.dart';
import 'package:hankofiles/constants/colors.dart';

import 'otp_box_style.dart';
import 'otp_field_style.dart';

class OTPTextField extends StatefulWidget {
  final OtpFieldController? controller;

  final int length;

  final double width;

  final double fieldHeight;

  final double fieldWidth;

  final EdgeInsetsGeometry margin;

  final TextInputType keyboardType;

  final TextStyle style;

  final double outlineBorderRadius;

  final MainAxisAlignment textFieldAlignment;

  final bool obscureText;

  final OtpFieldStyle? otpFieldStyle;

  final FieldStyle fieldStyle;

  final ValueChanged<String>? onChanged;

  final ValueChanged<String>? onCompleted;

  const OTPTextField(
      {Key? key,
      this.length = 6,
      this.width = 10,
      this.controller,
      this.fieldWidth = 30,
      this.fieldHeight = 34,
      this.margin = const EdgeInsets.symmetric(horizontal: 3),
      this.otpFieldStyle,
      this.keyboardType = TextInputType.number,
      this.style = const TextStyle(),
      this.outlineBorderRadius = 4,
      this.textFieldAlignment = MainAxisAlignment.spaceBetween,
      this.obscureText = false,
      this.fieldStyle = FieldStyle.underline,
      this.onChanged,
      this.onCompleted})
      : assert(length > 1);

  @override
  _OTPTextFieldState createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  late OtpFieldStyle _otpFieldStyle;
  late List<FocusNode?> _focusNodes;
  late List<TextEditingController?> _textControllers;

  late List<Widget> _textFields;
  late List<String> _pin;

  @override
  void initState() {
    if (widget.controller != null) {
      widget.controller!.setOtpTextFieldState(this);
    }

    if (widget.otpFieldStyle == null) {
      _otpFieldStyle = OtpFieldStyle();
    } else {
      _otpFieldStyle = widget.otpFieldStyle!;
    }

    super.initState();

    _focusNodes = List<FocusNode?>.filled(widget.length, null, growable: false);
    _textControllers = List<TextEditingController?>.filled(widget.length, null,
        growable: false);

    _pin = List.generate(widget.length, (int i) {
      return '';
    });
    _textFields = List.generate(widget.length, (int i) {
      return buildTextField(context, i);
    });
  }

  @override
  void dispose() {
    for (var controller in _textControllers) {
      controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Row(
        mainAxisAlignment: widget.textFieldAlignment,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _textFields,
      ),
    );
  }

  Widget buildTextField(BuildContext context, int i) {
    if (_focusNodes[i] == null) _focusNodes[i] = FocusNode();

    if (_textControllers[i] == null) {
      _textControllers[i] = TextEditingController();
    }

    return Container(
            width: widget.fieldWidth,
            height: widget.fieldHeight,
            margin: widget.margin,
            decoration: BoxDecoration(
                color: _otpFieldStyle.backgroundColor,
                borderRadius:
                    BorderRadius.circular(widget.outlineBorderRadius)),
            child: TextField(
              controller: _textControllers[i],
              keyboardType: widget.keyboardType,
              textAlign: TextAlign.center,
              style: widget.style,
              focusNode: _focusNodes[i],
              obscureText: widget.obscureText,
              decoration: InputDecoration(
                  counterText: "",
                  border: inputBorder,
                  focusedBorder: inputBorder,
                  enabledBorder: inputBorder,
                  disabledBorder: inputBorder,
                  contentPadding: EdgeInsets.symmetric(vertical: widget.fieldHeight * 0.2),
                  errorBorder: inputBorder),
              onChanged: (String str) {
                if (str.length > 1) {
                  _handlePaste(str);
                  return;
                }

                if (str.isEmpty) {
                  if (i == 0) return;
                  _focusNodes[i]!.unfocus();
                  _focusNodes[i - 1]!.requestFocus();
                }

                setState(() {
                  _pin[i] = str;
                });

                if (str.isNotEmpty) _focusNodes[i]!.unfocus();
                if (i + 1 != widget.length && str.isNotEmpty) {
                  FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
                }

                String currentPin = _getCurrentPin();

                if (!_pin.contains(null) &&
                    !_pin.contains('') &&
                    currentPin.length == widget.length) {
                  widget.onCompleted!(currentPin);
                }
                if(widget.onChanged != null){
                  widget.onChanged!(currentPin);
                }
              },
            ),
          );
  }

  String _getCurrentPin() {
    String currentPin = "";
    for (var value in _pin) {
      currentPin += value;
    }
    return currentPin;
  }

  void _handlePaste(String str) {
    if (str.length > widget.length) {
      str = str.substring(0, widget.length);
    }

    for (int i = 0; i < str.length; i++) {
      String digit = str.substring(i, i + 1);
      _textControllers[i]!.text = digit;
      _pin[i] = digit;
    }

    FocusScope.of(context).requestFocus(_focusNodes[widget.length - 1]);

    String currentPin = _getCurrentPin();

    if (!_pin.contains(null) &&
        !_pin.contains('') &&
        currentPin.length == widget.length) {
      widget.onCompleted!(currentPin);
    }

    widget.onChanged!(currentPin);
  }
}

class OtpFieldController {
  late _OTPTextFieldState _otpTextFieldState;

  void setOtpTextFieldState(_OTPTextFieldState state) {
    _otpTextFieldState = state;
  }

  void clear() {
    final textFieldLength = _otpTextFieldState.widget.length;
    _otpTextFieldState._pin = List.generate(textFieldLength, (int i) {
      return '';
    });

    final textControllers = _otpTextFieldState._textControllers;
    for (var textController in textControllers) {
      if (textController != null) {
        textController.text = '';
      }
    }

    final firstFocusNode = _otpTextFieldState._focusNodes[0];
    if (firstFocusNode != null) {
      firstFocusNode.requestFocus();
    }
  }

  void set(List<String> pin) {
    final textFieldLength = _otpTextFieldState.widget.length;
    if (pin.length < textFieldLength) {
      throw Exception(
          "Pin length must be same as field length. Expected: $textFieldLength, Found ${pin.length}");
    }

    _otpTextFieldState._pin = pin;
    String newPin = '';

    final textControllers = _otpTextFieldState._textControllers;
    for (int i = 0; i < textControllers.length; i++) {
      final textController = textControllers[i];
      final pinValue = pin[i];
      newPin += pinValue;

      if (textController != null) {
        textController.text = pinValue;
      }
    }

    final widget = _otpTextFieldState.widget;
    if (widget.onChanged != null) {
      widget.onChanged!(newPin);
    }
    if (widget.onCompleted != null) {
      widget.onCompleted!(newPin);
    }
  }

  void setValue(String value, int position) {
    final maxIndex = _otpTextFieldState.widget.length - 1;
    if (position > maxIndex) {
      throw Exception(
          "Provided position is out of bounds for the OtpTextField");
    }

    final textControllers = _otpTextFieldState._textControllers;
    final textController = textControllers[position];
    final currentPin = _otpTextFieldState._pin;

    if (textController != null) {
      textController.text = value;
      currentPin[position] = value;
    }

    String newPin = "";
    for (var item in currentPin) {
      newPin += item;
    }

    final widget = _otpTextFieldState.widget;
    if (widget.onChanged != null) {
      widget.onChanged!(newPin);
    }
  }

  void setFocus(int position) {
    final maxIndex = _otpTextFieldState.widget.length - 1;
    if (position > maxIndex) {
      throw Exception(
          "Provided position is out of bounds for the OtpTextField");
    }

    final focusNodes = _otpTextFieldState._focusNodes;
    final focusNode = focusNodes[position];

    if (focusNode != null) {
      focusNode.requestFocus();
    }
  }
}
