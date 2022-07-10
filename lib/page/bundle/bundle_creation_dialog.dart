import 'package:datamanager/bloc/bundle/bundle_bloc.dart';
import 'package:datamanager/l10n/build_context_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BundleCreationDialog extends StatefulWidget {
  const BundleCreationDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<BundleCreationDialog> createState() => _BundleCreationDialogState();
}

class _BundleCreationDialogState extends State<BundleCreationDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final texts = context.texts();
    final navigator = Navigator.of(context);

    return AlertDialog(
      title: Text(texts.bundle_page_new_name_title),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _nameTextController,
          decoration: InputDecoration(
            labelText: texts.bundle_creation_dialog_name_label,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return texts.bundle_page_new_name_error_empty;
            }
            if (context.read<BundleBloc>().nameInUse(value)) {
              return texts.bundle_page_new_name_error_used;
            }
            return null;
          },
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => navigator.pop(),
          child: Text(texts.bundle_page_new_name_action_cancel),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              navigator.pop(_nameTextController.text);
            }
          },
          child: Text(texts.bundle_page_new_name_action_continue),
        ),
      ],
    );
  }
}
