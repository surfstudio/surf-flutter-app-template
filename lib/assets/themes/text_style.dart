import 'package:flutter/painting.dart';

//ignore_for_file: public_member_api_docs

/// Styles of texts.

const TextStyle _text = TextStyle(
  fontStyle: FontStyle.normal,
);

//Light
TextStyle textLight = _text.copyWith(fontWeight: FontWeight.w300);

//Regular
TextStyle textRegular = _text.copyWith(fontWeight: FontWeight.normal);
TextStyle textRegular16 = textRegular.copyWith(fontSize: 16.0);
TextStyle textRegular16Secondary = textRegular16;
TextStyle textRegular16Grey = textRegular16;

//Medium
TextStyle textMedium = _text.copyWith(fontWeight: FontWeight.w500);
TextStyle textMedium20 = textMedium.copyWith(fontSize: 20.0);

//Bold
TextStyle textBold = _text.copyWith(fontWeight: FontWeight.bold);
