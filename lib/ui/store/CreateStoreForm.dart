import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "../../sharedWidgets/CustomTextFormField.dart";
import "../../sharedWidgets/CustomButton.dart";
class CreateStoreForm extends StatefulWidget {
  @override
  _CreateStoreFormState createState() => _CreateStoreFormState();
}

class _CreateStoreFormState extends State<CreateStoreForm> {
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Store",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10,),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Text('Arabic Details',
                  style: Theme.of(context).textTheme.headline6),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: "Store name",
              ),
              SizedBox(
                height: 29,
              ),
              CustomTextFormField(
                hintText: "Address",
              ),
              SizedBox(
                height: 29,
              ),
              CustomTextFormField(
                hintText: "Description",
                  maxLines:6

              ),
              SizedBox(
                height: 29,
              ),
              Text('English Details',
                  style: Theme.of(context).textTheme.headline6),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: "Store name",
              ),
              SizedBox(
                height: 29,
              ),
              CustomTextFormField(
                hintText: "Address",
              ),
              SizedBox(
                height: 29,
              ),
              CustomTextFormField(
                hintText: "Description",
                  maxLines:6
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
                hintText: "Products Address",
              ),
              SizedBox(
                height: 29,
              ),
              CustomTextFormField(
                hintText: "Facebook Page (optional)",
              ),
              SizedBox(
                height: 29,
              ),
              ListTileTheme(
                contentPadding: EdgeInsets.all(0),
                
                child: CheckboxListTile(
                  title: Text("I agree to the terms of  service and privacy policies. "),
                  value: checkedValue,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValue = newValue;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
              ),
              SizedBox(
                height: 29,
              ),
              CustomButton(
                height: 50,
                text: 'Done',
                primary: Theme.of(context).primaryColor,
              ),
            ],
          )),
    );
  }
}
