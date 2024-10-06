import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  InputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.topText,
    this.focusNode
  });
  final String? hintText;
  final String? topText;
  FocusNode? focusNode;

  final TextEditingController controller;
  bool obscureText;
  late bool obscureTextIcon = obscureText;
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        obscureText: widget.obscureText,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
        onChanged: (value) {
          print(value);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          suffixIcon: widget.obscureTextIcon
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      widget.obscureText = !widget.obscureText;
                    });
                  },
                  icon: Icon(
                    widget.obscureText
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                  ),
                )
              : null,
          hintText: widget.hintText,
          labelText: widget.topText,
          labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
        ),
      ),
    );
  }
}
