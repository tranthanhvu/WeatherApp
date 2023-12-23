import 'package:flutter/material.dart';

class AddingWidget extends StatelessWidget {
  const AddingWidget({
    super.key,
    required this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: SafeArea(
        child: ElevatedButton(
          onPressed: onPressed,
          child: onPressed == null
              ? const CircularProgressIndicator()
              : const Text('Add'),
        ),
      ),
    );
  }
}
