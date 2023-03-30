import 'package:flutter/material.dart';
import 'package:toeic/utils/constant.dart';

class CommonTextBox extends StatelessWidget {
  const CommonTextBox({
    Key? key,
    this.onSaved,
    this.labelText,
    this.initialValue,
  }) : super(key: key);
  final void Function(String?)? onSaved;
  final String? labelText, initialValue;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(minWidth: double.infinity),
        child: Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
            child: TextFormField(
                onSaved: onSaved,
                initialValue: initialValue ?? "",
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    fillColor: Colors.white,
                    labelText: labelText ?? "",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide:
                            const BorderSide(color: kColorFimary, width: 2.0)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )))));
  }
}
