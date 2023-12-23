import 'package:flutter/material.dart';

class DeletingWidget extends StatelessWidget {
  const DeletingWidget({
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
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
          ),
          child: onPressed == null
              ? const CircularProgressIndicator()
              : const Text('Delete'),
        ),
      ),
    );
  }
}
