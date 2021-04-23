import 'dart:io';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
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
  File image;
  final _picker = ImagePicker();
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

  _imgFromCamera() async {
    PickedFile img =
    await _picker.getImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      image = File(img.path);
    });
  }

  _imgFromGallery() async {
    PickedFile img =
    await _picker.getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      image = File(img.path);
    });
  }
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title:
                      new Text(AppLocalizations.of(context).photoLibrary),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text(AppLocalizations.of(context).camera),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

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
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        _showPicker(context);
                      },
                      child: Container(
                        child: image != null
                            ? ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.file(
                            image,
                            width: 300,
                            height: 300,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                            : Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffC4C4C4),
                                      borderRadius: BorderRadius.circular(6)),
                                  width: 280,
                                  height: 305,
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)
                                            .addStoreImage,
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Icon(Icons.add_a_photo),
                              )
                            ]),
                      ),
                    ),
                  ),
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
                            if (_CreateStoreformKey.currentState.validate() &&
                                image != null) {
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
                                    .createStore(store, image);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text(
                                      "${AppLocalizations.of(context).store} '$enName' ${AppLocalizations.of(context).createdsuccessfully}."),
                                ));
                                Navigator.of(context)
                                    .pushNamed('/store-dashboard');
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
