import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "../../sharedWidgets/CustomTextFormField.dart";
import "../../sharedWidgets/CustomButton.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../sharedWidgets/CustomBottomBar.dart';
import '../../utils/validators.dart';
import 'package:finalproject/models/Store.dart';
import "package:finalproject/ui/main/main_locale_provider.dart";

class CreateStoreForm extends StatefulWidget {
  @override
  _CreateStoreFormState createState() => _CreateStoreFormState();
}

class _CreateStoreFormState extends State<CreateStoreForm> {
  bool checkedValue = false;
  String arName;
  String arAddress;
  String arDescription;
  String enName;
  String enAddress;
  String enDescription;
  String productsAddress;
  String facebookPage;
  final _CreateStoreformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).createStore,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _CreateStoreformKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(AppLocalizations.of(context).arabicDetails,
                      style: Theme.of(context).textTheme.headline6),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    hintText: AppLocalizations.of(context).storeName,
                    validator: notEmpty,
                    onChanged: (val) {
                      setState(() {
                        arName = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  CustomTextFormField(
                    hintText: AppLocalizations.of(context).address,
                    validator: notEmpty,
                    onChanged: (val) {
                      setState(() {
                        arAddress = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  CustomTextFormField(
                    hintText: AppLocalizations.of(context).description,
                    maxLines: 6,
                    validator: notEmpty,
                    onChanged: (val) {
                      setState(() {
                        arDescription = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  Text(AppLocalizations.of(context).englishDetails,
                      style: Theme.of(context).textTheme.headline6),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    hintText: AppLocalizations.of(context).storeName,
                    validator: notEmpty,
                    onChanged: (val) {
                      setState(() {
                        enName = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  CustomTextFormField(
                    hintText: AppLocalizations.of(context).address,
                    validator: notEmpty,
                    onChanged: (val) {
                      setState(() {
                        enAddress = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  CustomTextFormField(
                    hintText: AppLocalizations.of(context).description,
                    maxLines: 6,
                    validator: notEmpty,
                    onChanged: (val) {
                      setState(() {
                        enDescription = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  Divider(
                    color: Theme.of(context).accentColor,
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  CustomTextFormField(
                    hintText: AppLocalizations.of(context).productsAddress,
                    validator: notEmpty,
                    onChanged: (val) {
                      setState(() {
                        productsAddress = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  CustomTextFormField(
                    hintText: AppLocalizations.of(context).facebookPageOptional,
                    onChanged: (val) {
                      setState(() {
                        facebookPage = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  ListTileTheme(
                    contentPadding: EdgeInsets.all(0),
                    child: CheckboxListTile(
                      title:
                          Text(AppLocalizations.of(context).iAgreeToTheTerms),
                      value: checkedValue,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValue = newValue;
                        });
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  CustomButton(
                    onpress: checkedValue
                        ? () async {
                            setState(() {
                              checkedValue = false;
                            });
                            if (_CreateStoreformKey.currentState.validate()) {
                              try {
                                Store store = Store.fromJson({
                                  "arName": arName?.trim(),
                                  "arAddress": arAddress?.trim(),
                                  "arDesc": arDescription?.trim(),
                                  "enName": enName?.trim(),
                                  "enAddress": enAddress?.trim(),
                                  "enDesc": enDescription?.trim(),
                                  "productsAddress": productsAddress?.trim(),
                                  "social": {"facebook": facebookPage?.trim()}
                                });
                                await Provider.of<MainLocaleProvider>(context,
                                        listen: false)
                                    .createStore(store);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text(
                                      "Store '$enName' created successfully."),
                                ));
                                Navigator.of(context).pushNamed('/store-dashboard');
                              } catch (err) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text('$err'),
                                ));
                                setState(() {
                                  checkedValue = true;
                                });
                              }
                            }
                          }
                        : null,
                    height: 50,
                    text: AppLocalizations.of(context).done,
                    primary: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    height: 29,
                  ),
                ],
              ),
            ),
          )),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
