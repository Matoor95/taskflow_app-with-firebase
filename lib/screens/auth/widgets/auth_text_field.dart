import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final TextEditingController controller ;
  final String label;
  final String hint;
  final IconData prefixIcon;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?) ? validator;

  
  const AuthTextField({ 
    super.key, required this.controller, required this.hint, 
    required this.isPassword, 
    required this.keyboardType, 
    required this.label, required this.prefixIcon, required this.validator,
  });

  @override
  _AuthTextFieldState createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _obscure=true;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && _obscure,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        prefixIcon: Icon(widget.prefixIcon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Theme.of(context).colorScheme.onSurfaceVariant.withGreen(2)

        // suffixIcon: widget.isPassword ? IconButton(
        //   _obscure
        // )

      ),

    );
  }
}