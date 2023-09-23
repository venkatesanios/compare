import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test1/product/widgets/drop_down_button.dart';
import 'package:flutter_test1/product/widgets/inputHeading.dart';
import 'package:flutter_test1/product/product_viewmodel.dart';
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

  ///function call

  setsalectvalue(String? value) {
    print('setsalectvalue: $value');
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<ProductViewModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
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
                    InputHeading(heading: 'Model'),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: MyDropDown(
                        initialValue: viewModel.modelType,
                        itemList: const [
                          '--/--',
                          'Model 1',
                          'Model 2',
                          'Model 3',
                        ],
                        purpose: 'addProduct/model',
                        setValue: viewModel.updateProductModelType,
                      ),
                    ),
                    if (viewModel.modelType == '--/--')
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
                    InputHeading(heading: 'Category'),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: MyDropDown(
                        initialValue: viewModel.category,
                        itemList: const [
                          '--/--',
                          'Category 1',
                          'Category 2',
                          'Category 3',
                        ],
                        purpose: 'addProduct/category',
                        setValue: setsalectvalue,
                      ),
                    ),
                    if (viewModel.category == '--/--')
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
                    InputHeading(heading: 'Product Status'),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: MyDropDown(
                        initialValue: viewModel.productStatus,
                        itemList: const [
                          '--/--',
                          'Admin',
                          'Stand BY',
                        ],
                        purpose: 'addProduct/Status',
                        setValue: setsalectvalue,
                      ),
                    ),
                    if (viewModel.productStatus == '--/--')
                      const Text(
                        'Please select a product status',
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
                Container(
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    //   onEditingComplete: ()=> FocusScope.of(context).requestFocus(widget.needTofocus),
                    onChanged: (value) {
                      setState(() {
                        // _value = value;
                        // createAccPvd.listenValueLength(widget.listeningHeading, value);
                      });
                    },
                    onSaved: (newValue) {},
                    validator: (value) {
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Device ID ',
                      hintStyle: TextStyle(fontSize: 12),
                      filled: true,
                      fillColor: Colors.lightBlue,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      counterText: '',
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
                // TextFormField(
                //   initialValue: viewModel.deviceId,
                //   decoration: InputDecoration(labelText: 'Device ID'),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Device ID is required';
                //     } else {
                //       viewModel.updateProductDeviceId(value);
                //     }
                //     return null;
                //   },
                // ),
                TextFormField(
                  initialValue: viewModel.description,
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description is required';
                    } else {
                      viewModel.updateProductDescription(value);
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: viewModel.warranty,
                  decoration: InputDecoration(labelText: 'Warranty'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Warranty is required';
                    } else {
                      viewModel.updateProductWarranty(value);
                    }
                    return null;
                  },
                ),
                DateTimeField(
                  format: dateFormat,
                  initialValue: DateTime.now(),
                  onChanged: (newValue) {
                    viewModel.updateProductCurrentDate(newValue!);
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
                      return 'Manufacturing Date is required';
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
                        if (_formKey.currentState!.validate()) {
                          viewModel.updateProductCategory(viewModel.category);
                          viewModel.updateProductModelType(viewModel.modelType);
                          viewModel
                              .updateProductStatus(viewModel.productStatus);
                          viewModel.saveProduct();
                        }
                      },
                      child: Text('ADD'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle Cancel button
                      },
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
