import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

/// The class that provides methods for formatting text input.
class TextInputFormatters {
  const TextInputFormatters._();

  /// The formatter for entering a phone number.
  static TextInputFormatter phonePasteFormatter() => TextInputFormatter.withFunction((_, newValue) {
        if (newValue.text.length > 1 && newValue.text.startsWith('8')) {
          return TextEditingValue(text: newValue.text.substring(1));
        }
        if (newValue.text.startsWith('+7 (')) {
          return TextEditingValue(text: newValue.text.substring(4));
        }
        if (newValue.text.startsWith('+7')) {
          return TextEditingValue(text: newValue.text.substring(2));
        }

        return newValue;
      });

  /// The formatting mask of the phone number.
  static MaskTextInputFormatter ruPhoneMaskFormatter({String? initialText}) => MaskTextInputFormatter(
        mask: '+7 ### ###-##-##',
        filter: {
          '#': RegExp('[0-9]'),
        },
        initialText: initialText,
      );

  /// The formatter for entering a name.
  static TextInputFormatter nameFormatter() => FilteringTextInputFormatter.allow(RegExp(r'[\sa-zA-Zа-яА-Я-]'));

  /// The formatter for entering a email.
  static TextInputFormatter emailFormatter() => FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\-\d@_.]+'));
}
