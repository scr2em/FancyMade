import 'package:animate_do/animate_do.dart';
import "package:flutter/material.dart";
import "../../../../sharedWidgets/CustomTextFormField.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../sharedWidgets/CustomBottomBar.dart';
import "package:finalproject/ui/main/main_locale_provider.dart";
import "package:provider/provider.dart";
import "package:finalproject/services/database.dart";
import "package:finalproject/models/CustomUser.dart";
import "package:finalproject/ui/main/main_locale_provider.dart";

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  var _isShippingInputEnabled = false;
  var _isPaymentInputEnabled = false;
  String shippingAddress = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back_ios),

        title: Text(
          AppLocalizations.of(context).info,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            FadeInDown(
              duration: Duration(microseconds: 500),
              child: EditInputField(
                  label: AppLocalizations.of(context).name,
                  text: Provider.of<MainLocaleProvider>(context).user.name,
                  hintText: AppLocalizations.of(context).enterYourName,
                  obscure: false,
                  onPress: (newValue) async {
                    await Provider.of<MainLocaleProvider>(context,
                            listen: false)
                        .updateAsingleProperty(
                            property: "name", newValue: newValue);
                  }),
            ),
            FadeInDownBig(
              duration: Duration(microseconds: 500),
              child: EditInputField(
                label: AppLocalizations.of(context).email,
                text: Provider.of<MainLocaleProvider>(context).user.email,
                hintText: AppLocalizations.of(context).enterYourEmail,
                obscure: false,
              ),
            ),
            FadeInDown(
              duration: Duration(microseconds: 500),
              child: EditInputField(
                  label: AppLocalizations.of(context).phoneNumber,
                  text:
                      Provider.of<MainLocaleProvider>(context).user.phoneNumber,
                  hintText: AppLocalizations.of(context).enterAvalidPhoneNumber,
                  obscure: false,
                  onPress: (newValue) async {
                    await Provider.of<MainLocaleProvider>(context,
                            listen: false)
                        .updateAsingleProperty(
                            property: "phoneNumber", newValue: newValue);
                  }),
            ),
            EditInputField(
              label: AppLocalizations.of(context).password,
              text: "0123456789",
              hintText: "*********",
              obscure: true,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context).shipping,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      _isShippingInputEnabled
                          ? IconButton(
                              icon: Icon(
                                Icons.check_outlined,
                                color: Theme.of(context).accentColor,
                              ),
                              onPressed: () async {
                                await Provider.of<MainLocaleProvider>(context,
                                        listen: false)
                                    .updateAsingleProperty(
                                        property: "shippingAddress",
                                        newValue: shippingAddress);

                                setState(() {
                                  _isShippingInputEnabled = false;
                                });
                              },
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: Theme.of(context).accentColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isShippingInputEnabled = true;
                                });
                              })
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomTextFormField(
                    initialValue: Provider.of<MainLocaleProvider>(context)
                        .user
                        .shippingAddress,
                    maxLines: 6,
                    enabled: _isShippingInputEnabled,
                    onChanged: (val) {
                      setState(() {
                        shippingAddress = val;
                      });
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}

class EditInputField extends StatefulWidget {
  bool boolValue = false;
  String text;
  String label;
  String hintText;
  bool obscure;
  String newText;
  Function onPress;

  EditInputField(
      {this.label, this.text, this.hintText, this.obscure, this.onPress});

  @override
  _EditInputFieldState createState() => _EditInputFieldState();
}

class _EditInputFieldState extends State<EditInputField> {
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.text;

    return ListTile(
      trailing: widget.boolValue
          ? IconButton(
              icon: Icon(
                Icons.check_outlined,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () async {
                widget.onPress(widget.newText);

                setState(() {
                  widget.boolValue = false;
                });
              },
            )
          : IconButton(
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                setState(() {
                  widget.boolValue = true;
                });
              }),
      title: TextField(
          obscureText: widget.obscure,
          enabled: widget.boolValue,
          controller: _controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            labelText: widget.label,
            labelStyle: TextStyle(color: Theme.of(context).accentColor),
            suffixIcon: widget.boolValue
                ? IconButton(
                    onPressed: _controller.clear,
                    icon: Icon(Icons.clear),
                  )
                : null,
            // labelText: "Name:",
            focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).accentColor, width: 2.0),
            ),
          ),
          onChanged: (val) {
            widget.newText = val;
          }),
    );
  }
}
