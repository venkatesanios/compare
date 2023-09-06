import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'ProductViewModel.dart';

class ProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productViewModel = Provider.of<ProductViewModel>(context);

    final dateFormat = DateFormat("yyyy-MM-dd");

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              DropdownButtonFormField<String>(
                value: productViewModel.category,
                onChanged: (newValue) {
                  productViewModel.updateProductCategory(newValue);
                },
                items: ['Category A', 'Category B', 'Category C']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Category'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Category is required';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: productViewModel.modelType,
                onChanged: (newValue) {
                  productViewModel.updateProductModelType(newValue);
                },
                items: ['Model A', 'Model B', 'Model C'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Model Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Model Type is required';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: productViewModel.productStatus,
                onChanged: (newValue) {
                  productViewModel.updateProductStatus(newValue);
                },
                items: ['Active', 'Inactive'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Product Status'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Product Status is required';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: productViewModel.deviceId,
                onChanged: (newValue) {
                  productViewModel.updateProductDeviceId(newValue);
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
                initialValue: productViewModel.description,
                onChanged: (newValue) {
                  productViewModel.updateProductDescription(newValue);
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
                initialValue: productViewModel.warranty,
                onChanged: (newValue) {
                  productViewModel.updateProductWarranty(newValue);
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
                initialValue: productViewModel.currentDate ?? DateTime.now(),
                onChanged: (newValue) {
                  productViewModel.updateProductCurrentDate(newValue!);
                },
                decoration: InputDecoration(labelText: 'Current Date'),
                onShowPicker: (context, currentValue) async {
                  final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2101),
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
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (Form.of(context).validate()) {
                        productViewModel.saveProduct();
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
