import 'package:flutter/material.dart';

class AppFormField extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  const AppFormField({super.key, this.onChanged, this.validator, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: Theme.of(context).textTheme.titleMedium,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey.shade400),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400
                      )
                    ),
                  ),
                  onChanged: onChanged,
                  validator: validator,
                );
  }
}