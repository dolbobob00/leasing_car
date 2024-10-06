import 'package:flutter/material.dart';

class ButtonText extends StatefulWidget {
  const ButtonText(
      {super.key,
      required this.title,
      required this.hadDecoration,
      required this.onTap,
      required this.icon});
  final String? title;
  final bool hadDecoration;
  final VoidCallback onTap;
  final Widget? icon;
  @override
  State<ButtonText> createState() => _ButtonTextState();
}

class _ButtonTextState extends State<ButtonText> {
  bool _isTapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTapped = !_isTapped;
        });
        widget.onTap();
        Future.delayed(
          const Duration(milliseconds: 290),
          () {
            setState(() {
              _isTapped = !_isTapped;
            });
          },
        );
      },
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 300,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        width: double.infinity,
        height: widget.hadDecoration
            ? null
            : MediaQuery.of(context).size.height * 0.05,
        decoration: widget.hadDecoration
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25,
                ),
                color: _isTapped
                    ? Theme.of(context).colorScheme.primary // Цвет при нажатии
                    : Theme.of(context).colorScheme.secondary,
              )
            : const BoxDecoration(),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: Center(
          child: Row(
            children: [
              widget.icon != null ? widget.icon! : Container(),
              Text(
                '${widget.title}',
                style: widget.hadDecoration
                    ? Theme.of(context).textTheme.bodyMedium
                    : Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
