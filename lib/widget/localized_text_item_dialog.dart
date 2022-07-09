import 'package:datamanager/data/localized_text.dart';
import 'package:datamanager/l10n/build_context_localizations.dart';
import 'package:datamanager/l10n/locales.dart';
import 'package:flutter/material.dart';

class LocalizedTextItemDialog extends StatefulWidget {
  final Locale? locale;
  final String? text;

  const LocalizedTextItemDialog({
    Key? key,
    this.locale,
    this.text,
  }) : super(key: key);

  @override
  State<LocalizedTextItemDialog> createState() => _LocalizedTextItemDialogState();
}

class _LocalizedTextItemDialogState extends State<LocalizedTextItemDialog> {
  final _formKey = GlobalKey<FormState>();
  final _locales = supportedLocales().map((e) => e.languageCode).toSet();

  Locale? locale;
  String? text;

  @override
  void initState() {
    super.initState();
    locale = widget.locale;
    text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    final texts = context.texts();

    return AlertDialog(
      title: Text(texts.localized_text_item_dialog_title),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Autocomplete(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return _locales.where((String option) {
                  return option.contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (selection) {
                debugPrint('You just selected $selection');
              },
              fieldViewBuilder: (
                context,
                textEditingController,
                focusNode,
                onFieldSubmitted,
              ) {
                return TextFormField(
                  controller: textEditingController,
                  focusNode: focusNode,
                  initialValue: locale?.languageCode,
                  decoration: InputDecoration(
                    labelText: texts.localized_text_item_dialog_locale,
                  ),
                  validator: (value) {
                    if (value == null) {
                      return texts.localized_text_item_dialog_locale_error;
                    }
                    try {
                      locale = fromLocaleName(value);
                    } catch (e) {
                      locale = null;
                      return texts.localized_text_item_dialog_locale_error;
                    }
                    return null;
                  },
                );
              },
            ),
            TextFormField(
              initialValue: text,
              decoration: InputDecoration(
                labelText: texts.localized_text_item_dialog_text,
              ),
              validator: (value) {
                text = value ?? "";
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          child: Text(texts.localized_text_item_dialog_action_cancel),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          child: Text(texts.localized_text_item_dialog_action_confirm),
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              Navigator.pop(context, LocalizedText({locale!: text!}));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    texts.localized_text_item_dialog_locale_error,
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
