import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gtk_flutter/source/features/common/extensions/column_extension.dart';
import 'package:gtk_flutter/source/features/common/widgets/drawer.dart';
import 'package:gtk_flutter/source/features/user/domain/user.dart';
import 'package:gtk_flutter/source/features/user/data/user_repository.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UserDetalheScreen extends ConsumerWidget {
  UserDetalheScreen({super.key, required this.userId, required this.user});

  final int userId;
  final User? user;
  final _formKey = GlobalKey<FormBuilderState>();
  final _nomeFieldKey = GlobalKey<FormBuilderFieldState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
  final _foneFieldKey = GlobalKey<FormBuilderFieldState>();
  final _ruaFieldKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // if (user != null) {}
    // final userData = ref.watch(userDataProvider.future);
    return Scaffold(
        appBar: AppBar(
          title: const Text('User'),
          actions: <Widget>[
            PopupMenuButton<int>(
              onSelected: (item) => handleClick(item, ref),
              itemBuilder: (context) => [
                PopupMenuItem<int>(value: 0, child: Text('Logout')),
                PopupMenuItem<int>(value: 1, child: Text('Ajustes')),
              ],
            ),
          ],
        ),
        // drawer: MainDrawer(),
        body: FormBuilder(
          key: _formKey,
          child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FormBuilderTextField(
                  name: 'nome',
                  initialValue: user!.name,
                  key: _nomeFieldKey,
                  decoration: InputDecoration(labelText: 'nome'),
                  validator: FormBuilderValidators.required(),
                ),
                FormBuilderTextField(
                  name: 'fone',
                  initialValue: user!.phone,
                  key: _foneFieldKey,
                  validator: FormBuilderValidators.phoneNumber(),
                  decoration: InputDecoration(labelText: 'Telefone'),
                  autovalidateMode: AutovalidateMode.always,
                ),
                FormBuilderTextField(
                  key: _emailFieldKey,
                  initialValue: user!.email,
                  name: 'email',
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                FormBuilderTextField(
                  key: _ruaFieldKey,
                  initialValue: user!.address!.street,
                  name: 'endereço',
                  decoration: const InputDecoration(labelText: 'Endereço'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                OverflowBar(
                  spacing: 8,
                  overflowAlignment: OverflowBarAlignment.end,
                  overflowSpacing: 4,
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                        child: const Text('Cancelar'), onPressed: () {}),
                    ElevatedButton(
                        child: const Text('OK'),
                        onPressed: () {
                          _formKey.currentState?.saveAndValidate();
                          debugPrint(_formKey.currentState?.value.toString());
                        }),
                  ],
                ),
              ]).wrap(margin: 2.0),
        ));
  }

  void handleClick(int item, WidgetRef ref) {
    switch (item) {
      case 0:
        break;
      case 1:
        break;
    }
  }
}
