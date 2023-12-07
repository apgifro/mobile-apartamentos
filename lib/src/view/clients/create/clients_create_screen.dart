import 'package:flutter/material.dart';

import 'package:apartamentos/src/view/clients/create/widgets/forms.dart';

class ClientsCreateScreen extends StatelessWidget {
  ClientsCreateScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody()
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text('Novo contrato'),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: _buildForm(),
        ),
      ),
    );
  }

  _buildForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
        child: Column(
          children: [
            CustomFormPlace(),
            const SizedBox(height: 30),

            CustomFormName(),
            const SizedBox(height: 15),

            CustomFormMarital(),
            const SizedBox(height: 15),

            CustomFormWork(),
            const SizedBox(height: 30),

            CustomFormIdentity(),
            const SizedBox(height: 15),

            CustomFormCPF(),
            const SizedBox(height: 30),

            CustomFormNumber(),
            const SizedBox(height: 15),

            CustomFormValue(),
            const SizedBox(height: 30),

            CustomFormPhone(),
            const SizedBox(height: 30),

            CustomFormDate(),

            CustomInsertClientButton(formKey: _formKey,)
          ],
        ),
      ),
    );
  }
}
