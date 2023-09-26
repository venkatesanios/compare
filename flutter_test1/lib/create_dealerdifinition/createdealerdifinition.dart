import 'package:flutter/material.dart';
import 'package:flutter_test1/create_dealerdifinition/createdealer_model.dart';
import 'package:flutter_test1/product/widgets/drop_down_button.dart';
import 'package:flutter_test1/sevices/http_services.dart';

class DealerDefinitionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dealer Definition'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: DealerDefinitionForm(),
      ),
    );
  }
}

class DealerDefinitionForm extends StatefulWidget {
  @override
  _DealerDefinitionFormState createState() => _DealerDefinitionFormState();
}

class _DealerDefinitionFormState extends State<DealerDefinitionForm> {
  final _formKey = GlobalKey<FormState>();
  final _dealerDefinition = DealerDefinition(
    category: '',
    parameter: '',
    parameterDetails: '',
    type: '',
    list: '',
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // DropdownButtonFormField<String>(
            //   value: _dealerDefinition.category,
            //   items: categoryOptions.map((category) {
            //     return DropdownMenuItem<String>(
            //       value: category,
            //       child: Text(category),
            //     );
            //   }).toList(),
            //   onChanged: (value) {
            //     setState(() {
            //       _dealerDefinition.category = value!;
            //     });
            //   },
            //   decoration: InputDecoration(labelText: 'Category'),
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please select a category';
            //     }
            //     return null;
            //   },
            // ),
            // MyDropDown(
            //   itemList: const [
            //     "Gentral",
            //     "fertilizer",
            //     "valve default",
            //     "momory Allocation"
            //   ],
            //   setValue: _dealerDefinition.category = value,
            // ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Category'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a category';
                }
                return null;
              },
              onSaved: (value) {
                _dealerDefinition.category = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Parameter'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a parameter';
                }
                return null;
              },
              onSaved: (value) {
                _dealerDefinition.parameter = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Parameter Details'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter parameter details';
                }
                return null;
              },
              onSaved: (value) {
                _dealerDefinition.parameterDetails = value!;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Type'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a type';
                }
                return null;
              },
              onSaved: (value) {
                _dealerDefinition.type = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Dropdown List values'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a list';
                }
                return null;
              },
              onSaved: (value) {
                _dealerDefinition.list = value!;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save(); // Save  data
                  // Send the _dealerDefinition object to your API or perform desired actions

                  print(_dealerDefinition.category.runtimeType);

                  Map<String, Object> body = {
                    "categoryId": _dealerDefinition.category,
                    "parameter": _dealerDefinition.parameter,
                    "description": _dealerDefinition.parameterDetails,
                    "type": _dealerDefinition.type,
                    "createUser": '1',
                    "dropdownValues": _dealerDefinition.list,
                  };
                  print(body);
                  final response = await HttpService()
                      .postRequest("createDealerDefinition", body);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Response'),
                          content: Text('$response'),
                        );
                      });

                  print('response $response');
                }
              },
              child: Text('Send'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                // Send the _dealerDefinition object to your API or perform desired actions

                print(_dealerDefinition.category.runtimeType);

                Map<String, Object> body = {
                  // "active": "0",
                };
                print(body);
                final response = await HttpService()
                    .postRequest("getDealerDefinition", body);
                print('response $response');
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Response'),
                        content: Text('$response'),
                      );
                    });
              },
              child: Text('get'),
            ),
          ],
        ),
      ),
    );
  }
}
