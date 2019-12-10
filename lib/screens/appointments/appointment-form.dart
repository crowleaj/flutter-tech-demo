import 'package:flutter/material.dart';
import 'package:hello_flutter/validation.dart';

// Thanks https://flutter.dev/docs/cookbook/forms/validation
class AppointmentForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppointmentFormState();
  }

}

class AppointmentFormState extends State<AppointmentForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(validator: Validation.hasValue,)
        ],
      )
    );
  }

}