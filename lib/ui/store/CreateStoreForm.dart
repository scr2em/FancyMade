import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "../../sharedWidgets/CustomTextFormField.dart";
import "../../sharedWidgets/CustomButton.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../sharedWidgets/CustomBottomBar.dart';
import '../../utils/validators.dart';

class CreateStoreForm extends StatefulWidget {
  @override
  _CreateStoreFormState createState() => _CreateStoreFormState();
}

class _CreateStoreFormState extends State<CreateStoreForm> {
  bool checkedValue = false;
  final _formKey = GlobalKey<FormState>();

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
              key: _formKey,
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
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  CustomTextFormField(
                    hintText: AppLocalizations.of(context).address,
                    validator: notEmpty,
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  CustomTextFormField(
                    hintText: AppLocalizations.of(context).description,
                    maxLines: 6,
                    validator: notEmpty,
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
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  CustomTextFormField(
                    hintText: AppLocalizations.of(context).address,
                    validator: notEmpty,
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  CustomTextFormField(
                    hintText: AppLocalizations.of(context).description,
                    maxLines: 6,
                    validator: notEmpty,
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
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  CustomTextFormField(
                    hintText: AppLocalizations.of(context).facebookPageOptional,
                    validator: notEmpty,
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
                    onpress: () {
                      if (_formKey.currentState.validate()) {
                        print("ok");
                      }
                    },
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
