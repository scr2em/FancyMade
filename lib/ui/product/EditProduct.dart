import 'dart:io';

import "package:finalproject/models/Product.dart";
import 'package:finalproject/sharedWidgets/CustomButton.dart';
import 'package:finalproject/sharedWidgets/CustomLightTextField.dart';
import "package:finalproject/ui/main/main_locale_provider.dart";
import 'package:finalproject/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProduct extends StatefulWidget {
  Product newProduct;
  String productId;

  EditProduct({this.newProduct, this.productId});

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  File image;
  final _picker = ImagePicker();
  final _productListingForm = GlobalKey<FormState>();

  // //product details
  String groupValue;

  // String arName;
  // String arDesc;
  // String enName;
  // String enDesc;
  // int price;
  // int discount;
  // int discountDuration;
  // String category;
  // int itemsAvailable;
  // List<String> tags;
  // int maxQuantityPerOrder;
  // String shipment;
  bool _checked = false;

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
    groupValue = widget.newProduct.shipment;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).editProduct,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff273147)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: _productListingForm,
            child: Column(children: [
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
                                Image.network(
                                  widget.newProduct.image,
                                  width: 300,
                                  height: 300,
                                  fit: BoxFit.fitHeight,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Icon(
                                    Icons.add_a_photo,
                                    color: Colors.red,
                                  ),
                                )
                              ]),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffEEEEEE),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(top: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(Icons.wysiwyg),
                        ),
                        Text(
                          AppLocalizations.of(context).details,
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context).details,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          AppLocalizations.of(context).byAr,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CustomLightTextFormField(
                        initialValue: widget.newProduct.arName,
                        hintText: AppLocalizations.of(context).productName,
                        validator: notEmpty,
                        onChanged: (val) {
                          setState(() {
                            widget.newProduct.arName = val;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CustomLightTextFormField(
                        initialValue: widget.newProduct.arDesc,
                        hintText:
                            AppLocalizations.of(context).productdescription,
                        maxLines: 5,
                        validator: notEmpty,
                        onChanged: (val) {
                          widget.newProduct.arDesc = val;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context).details,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            AppLocalizations.of(context).byEn,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CustomLightTextFormField(
                        initialValue: widget.newProduct.enName,
                        hintText: AppLocalizations.of(context).productName,
                        validator: notEmpty,
                        onChanged: (val) {
                          widget.newProduct.enName = val;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CustomLightTextFormField(
                        initialValue: widget.newProduct.enDesc,
                        hintText:
                            AppLocalizations.of(context).productdescription,
                        maxLines: 5,
                        validator: notEmpty,
                        onChanged: (val) {
                          widget.newProduct.enDesc = val;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffEEEEEE),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(top: 16, bottom: 10),
                child: Column(children: [
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                          ),
                          child: Icon(Icons.attach_money_rounded)),
                      Text(
                        AppLocalizations.of(context).specification,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: CustomLightTextFormField(
                              initialValue: "${widget.newProduct.price}",
                              hintText:
                                  AppLocalizations.of(context).sellingprice,
                              onChanged: (val) {
                                widget.newProduct.price = int.parse(val);
                              },
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: CustomLightTextFormField(
                              initialValue:
                                  widget.newProduct.discount.toString(),
                              hintText: AppLocalizations.of(context).discount,
                              onChanged: (val) {
                                widget.newProduct.discount = int.parse(val);
                              },
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomLightTextFormField(
                      initialValue:
                          widget.newProduct.maxQuantityPerOrder.toString(),
                      hintText: AppLocalizations.of(context).maxquan,
                      onChanged: (val) {
                        widget.newProduct.maxQuantityPerOrder = int.parse(val);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomLightTextFormField(
                      initialValue: widget.newProduct.itemsAvailable.toString(),
                      hintText: AppLocalizations.of(context).quan,
                      onChanged: (val) {
                        widget.newProduct.itemsAvailable = int.parse(val);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomLightTextFormField(
                      initialValue:
                          widget.newProduct.discountDuration.toString(),
                      hintText: AppLocalizations.of(context).discDur,
                      onChanged: (val) {
                        widget.newProduct.discountDuration = int.parse(val);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomLightTextFormField(
                      initialValue: widget.newProduct.category,
                      hintText: AppLocalizations.of(context).prodCat,
                      onChanged: (val) {
                        widget.newProduct.category = val;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomLightTextFormField(
                      initialValue: widget.newProduct.tags.join(","),
                      hintText: AppLocalizations.of(context).srchTags,
                      onChanged: (val) {
                        widget.newProduct.tags = val.split(",").toList();
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                  )
                ]),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffEEEEEE),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: const EdgeInsets.all(
                  10,
                ),
                margin: EdgeInsets.only(top: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.description_outlined),
                        Text(
                          AppLocalizations.of(context).misc,
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    Text(
                      AppLocalizations.of(context).channel,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        RadioButton(
                          description: '',
                          groupValue: groupValue,
                          onChanged: (value) => setState(() {
                            widget.newProduct.shipment = value;
                          }),
                          value: 'user',
                        ),
                        Text(
                          AppLocalizations.of(context).selfship,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        RadioButton(
                          description: '',
                          groupValue: groupValue,
                          onChanged: (value) => setState(() {
                            widget.newProduct.shipment = value;
                          }),
                          value: 'FancyMade',
                        ),
                        Text(
                          AppLocalizations.of(context).appship,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  child: CustomButton(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      primary: Color(0xff273147),
                      text: AppLocalizations.of(context).done,
                      onpress: () async {
                        if (_productListingForm.currentState.validate()) {
                          try {
                            await Provider.of<MainLocaleProvider>(context,
                                    listen: false)
                                .updateProduct(
                                    widget.newProduct, image, widget.productId);
                            Navigator.of(context).pushNamed('/productReview',
                                arguments: widget.newProduct);
                          } catch (err) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                  AppLocalizations.of(context).somthingWrong),
                            ));
                          }
                        }
                      }))
            ]),
          ),
        ),
      ),
    );
  }
}
