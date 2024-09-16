import 'package:contact_app/utils/helper_functions.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class NewContactPage extends StatefulWidget {
  static const String routeName = '/new';

  const NewContactPage({super.key});

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _websiteController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  DateTime? _selecteDate;
  String? _group;
  String?
  _gender;
  String? _imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Contact'),
        actions: [
          IconButton(
            onPressed: _save,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 8.0,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Contact Name',
                    prefixIcon: Icon(Icons.person)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Provide a contact name';
                  }
                  if (value.length > 20) {
                    return 'Name should not exceed beyond 20 characters';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: _mobileController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Mobile Number',
                    prefixIcon: Icon(Icons.call)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Provide a contact name';
                  }
                  if (value.length > 14) {
                    return 'Number should not exceed 14 digit';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email Address',
                    prefixIcon: Icon(Icons.email)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Provide an email address';
                  }
                  if (!EmailValidator.validate(value)) {
                    return 'Invalid email address';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Street Address (optional)',
                    prefixIcon: Icon(Icons.streetview)),
                validator: (value) {
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: TextFormField(
                controller: _websiteController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'WebSite (optional)',
                    prefixIcon: Icon(Icons.web)),
                validator: (value) {
                  return null;
                },
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: _selectDateOfBirth,
                      child: const Text('Select Date of Birth'),
                    ),
                    Text(_selecteDate == null ? 'No date chosen' : getFormattedDate(_selecteDate))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _save() {
    if (_formkey.currentState!.validate()) {}
  }

  Future<void> _selectDateOfBirth() async {
    final dt = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if(dt != null){
      setState(() {
        _selecteDate = dt;
      });
    }
  }
}
