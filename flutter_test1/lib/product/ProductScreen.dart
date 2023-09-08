import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test1/drop_down_button.dart';
import 'package:flutter_test1/inputHeading.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final productViewModel = Provider.of<ProductViewModel>(context);

    final dateFormat = DateFormat("yyyy-MM-dd");

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputHeading(heading: 'Model'),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: MyDropDown(initialValue: 'Model', itemList: [
                        'Model',
                        'Model 1',
                        'Model 2',
                        'Model 3',
                      ]),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputHeading(heading: 'category'),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: MyDropDown(initialValue: 'category', itemList: [
                        'category',
                        'category 1',
                        'category 2',
                        'category 3',
                      ]),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputHeading(heading: 'Product Status'),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: MyDropDown(initialValue: 'Admin', itemList: [
                        'Admin',
                        'Stand BY',
                      ]),
                    )
                  ],
                ),
                TextFormField(
                  initialValue: 'OP767654432',
                  onChanged: (newValue) {
                    // productViewModel.updateProductDeviceId(newValue);
                  },
                  decoration: InputDecoration(labelText: 'Device ID'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Device ID is required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: 'Oro pump',
                  onChanged: (newValue) {
                    //  productViewModel.updateProductDescription(newValue);
                  },
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description is required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: '10',
                  onChanged: (newValue) {
                    // productViewModel.updateProductWarranty(newValue);
                  },
                  decoration: InputDecoration(labelText: 'Warranty'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Warranty is required';
                    }
                    return null;
                  },
                ),
                DateTimeField(
                  format: dateFormat,
                  initialValue: DateTime.now(),
                  onChanged: (newValue) {
                    // productViewModel.updateProductCurrentDate(newValue!);
                  },
                  decoration: InputDecoration(labelText: 'Manufacturing Date'),
                  onShowPicker: (context, currentValue) async {
                    final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2023),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) {
                      return date;
                    } else {
                      return currentValue;
                    }
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Current Date is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (Form.of(context).validate()) {
                          //   productViewModel.saveProduct();
                        }
                      },
                      child: Text('ADD'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
