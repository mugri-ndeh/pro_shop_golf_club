import 'dart:io';

import 'package:flutter/material.dart';

import 'package:pro_shop_golf_club/home/ui/widgets/widgets.dart';
import 'package:pro_shop_golf_club/util/helper/helper.dart';

class AddProductsPage extends StatefulWidget {
  const AddProductsPage({Key? key}) : super(key: key);

  @override
  State<AddProductsPage> createState() => _AddProductsPageState();
}

class _AddProductsPageState extends State<AddProductsPage> {
  int? selectedId;
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _qtyController = TextEditingController();
  String imageUrl = 'null actually';
  String? selectedValue;

  File? _image;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        titleTextStyle: Theme.of(context).textTheme.headline6,
        title: Text(
          'Add a Product',
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                TextFormField(
                  controller: _nameController,
                  validator: (value) =>
                      value!.isEmpty ? 'Please add a name' : null,
                  decoration: getInputDecoration(
                      hint: 'Product name',
                      darkMode: Theme.of(context).brightness == Brightness.dark,
                      errorColor: Colors.red),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Please add a price' : null,
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: getInputDecoration(
                      hint: 'Price',
                      darkMode: Theme.of(context).brightness == Brightness.dark,
                      errorColor: Colors.red),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Please fill quantity' : null,
                  controller: _qtyController,
                  keyboardType: TextInputType.number,
                  decoration: getInputDecoration(
                      hint: 'Quantity',
                      darkMode: Theme.of(context).brightness == Brightness.dark,
                      errorColor: Colors.red),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                Text(
                  'Add an image',
                  style: Theme.of(context).textTheme.headline4,
                ),
                _image == null
                    ? GestureDetector(
                        onTap: () async {
                          _image = await chooseImage();
                          setState(() {});
                        },
                        child:
                            imgplace(context: context, height: 100, width: 100))
                    : Image.file(_image!),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    child: Text('Add Product'),
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        if (selectedId == null) {
                          showSnackBar(context, 'Select category');
                        } else if (_image == null) {
                          showSnackBar(context, 'Please select an image');
                        } else {
                          showProgress(
                              context, 'Adding product please wait', true);

                          showAlertDialog(
                              context, 'Success', 'Item added successfully');
                        }
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
