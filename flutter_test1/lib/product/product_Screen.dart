import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test1/product/widgets/drop_down_button.dart';
import 'package:flutter_test1/product/widgets/inputHeading.dart';
import 'package:flutter_test1/product/product_ViewModel.dart';
import 'package:flutter_test1/product/state_management/add_product_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();

  String selectedModel = '--/--';
  String? Modelvalue;

  String selectedCategory = '--/--';
  String selectedProductStatus = '--/--';

  final dateFormat = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    var addProductPvd = Provider.of<AddProductProvider>(context, listen: true);
    var productViewModel = Provider.of<ProductViewModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const InputHeading(heading: 'Model'),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: MyDropDown(
                        initialValue: addProductPvd.initialModel,
                        itemList: const [
                          '--/--',
                          'Model 1',
                          'Model 2',
                          'Model 3',
                        ],
                        purpose: 'addProduct/model',
                      ),
                    ),
                    if (addProductPvd.initialModel == '--/--')
                      const Text(
                        'Please select a Model',
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const InputHeading(heading: 'Category'),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: MyDropDown(
                        initialValue: addProductPvd.initialcategory,
                        itemList: const [
                          '--/--',
                          'Category 1',
                          'Category 2',
                          'Category 3',
                        ],
                        purpose: 'addProduct/category',
                      ),
                    ),
                    if (addProductPvd.initialcategory == '--/--')
                      const Text(
                        'Please select a category',
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const InputHeading(heading: 'Product Status'),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: MyDropDown(
                        initialValue: addProductPvd.initialProductstatus,
                        itemList: const [
                          '--/--',
                          'Admin',
                          'Stand BY',
                        ],
                        purpose: 'addProduct/Status',
                      ),
                    ),
                    if (addProductPvd.initialProductstatus == '--/--')
                      const Text(
                        'Please select a product status',
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
                TextFormField(
                  initialValue: productViewModel.deviceId,
                  decoration: const InputDecoration(labelText: 'Device ID'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Device ID is required';
                    } else {
                      productViewModel.updateProductDeviceId(value);
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: productViewModel.description,
                  decoration: const InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description is required';
                    } else {
                      productViewModel.updateProductDescription(value);
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: productViewModel.warranty,
                  decoration: const InputDecoration(labelText: 'Warranty'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Warranty is required';
                    } else {
                      productViewModel.updateProductWarranty(value);
                    }
                    return null;
                  },
                ),
                DateTimeField(
                  format: dateFormat,
                  initialValue: DateTime.now(),
                  onChanged: (newValue) {
                    productViewModel.updateProductCurrentDate(newValue!);
                  },
                  decoration:
                      const InputDecoration(labelText: 'Manufacturing Date'),
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
                      return 'Manufacturing Date is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          productViewModel.updateProductCategory(
                              addProductPvd.initialcategory);
                          productViewModel.updateProductModelType(
                              addProductPvd.initialModel);
                          productViewModel.updateProductStatus(
                              addProductPvd.initialProductstatus);
                          productViewModel.saveProduct();
                        }
                      },
                      child: const Text('ADD'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle Cancel button
                      },
                      child: const Text('Cancel'),
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
