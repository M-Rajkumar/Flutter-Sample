import 'package:flutter/material.dart';

class InputFormContainer extends StatelessWidget {
  const InputFormContainer({
    Key key,
    this.fieldTitle,
    this.passwordType = false,
    this.hintTitle,
    this.fieldTitleStyle,
    this.textFormStyle,
    this.hintTextStyle,
    this.errorTitle,
    this.initialValue,
    this.textSaved,
    this.textChanged,
    this.textInputType,
    this.inputDecoration,
    this.hasInputError = false,
    this.minLines,
    this.bottomSpace,
    this.maxLines,
    this.textValidator,
    this.edgeInsetsGeometry,
    this.contentPadding,
    @required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final String fieldTitle;
  final TextStyle fieldTitleStyle;
  final bool passwordType;
  final String hintTitle;
  final String errorTitle;
  final String initialValue;
  final TextStyle textFormStyle;
  final TextStyle hintTextStyle;
  final Function textValidator;
  final Function textSaved;
  final Function textChanged;
  final bool hasInputError;
  final InputDecoration inputDecoration;
  final TextInputType textInputType;
  final int minLines;
  final int maxLines;
  final double bottomSpace;
  final EdgeInsetsGeometry edgeInsetsGeometry;
  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: edgeInsetsGeometry ?? EdgeInsets.only(bottom: 8.0),
          child: Text(
            fieldTitle,
            textAlign: TextAlign.start,
            style: fieldTitleStyle ?? TextStyle(fontSize: 14.0),
          ),
        ),
        TextFormField(
          controller: _controller,
          cursorColor: Theme.of(context).primaryColor,
          obscureText: passwordType,
          initialValue: initialValue ?? '',
          style: textFormStyle ?? TextStyle(fontSize: 16.0),
          validator: textValidator,
          keyboardType: textInputType,
          onChanged: textChanged,
          onSaved: textSaved,
          maxLines: passwordType ? 1 : maxLines ?? null,
          minLines: minLines ?? null,
          decoration: inputDecoration ??
              InputDecoration(
                isDense: true,
                hintText: hintTitle ?? '',
                errorText: hasInputError ? errorTitle ?? null : null,
                hintStyle: hintTextStyle ?? TextStyle(fontSize: 14.0),
                contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                border: new OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
        ),
        SizedBox(
          height: bottomSpace ?? 10.0,
        ),
      ],
    );
  }
}
