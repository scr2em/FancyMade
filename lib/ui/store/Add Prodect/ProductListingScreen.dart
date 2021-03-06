import 'dart:io';

import "package:finalproject/models/Product.dart";
import 'package:finalproject/sharedWidgets/CustomLightTextField.dart';
import "package:finalproject/ui/main/main_locale_provider.dart";
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_tagging/flutter_tagging.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../sharedWidgets/CustomButton.dart';
import '../../../utils/validators.dart';
import "package:finalproject/models/Product.dart";
import "package:finalproject/ui/main/main_locale_provider.dart";
import 'package:flutter_tagging/flutter_tagging.dart';
import 'package:textfield_tags/textfield_tags.dart';

class ProductListing extends StatefulWidget {
  @override
  _ProductListingState createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListing> {
  File image;
  final _picker = ImagePicker();
  final _productListingForm = GlobalKey<FormState>();

  //product details
  String groupValue;
  String arName;
  String arDesc;
  String enName;
  String enDesc;
  int price;
  int discount;
  int discountDuration;
  String category;
  int itemsAvailable;
  int maxQuantityPerOrder;
  String shipment;

  List<String> tags = ['Painting', 'Jewelry', 'Dolls', 'Accrssiries'];

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
          AppLocalizations.of(context).productlisting,
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
          physics: BouncingScrollPhysics(),
          child: Form(
            key: _productListingForm,
            child: Column(children: [
              Text(
                AppLocalizations.of(context).detailsbelow,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
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
                              fit: BoxFit.cover,
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
                                              .addProductImg,
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
                        hintText: AppLocalizations.of(context).productName,
                        validator: notEmpty,
                        onChanged: (val) {
                          arName = val;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CustomLightTextFormField(
                        hintText:
                            AppLocalizations.of(context).productdescription,
                        maxLines: 5,
                        validator: notEmpty,
                        onChanged: (val) {
                          arDesc = val;
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
                        hintText: AppLocalizations.of(context).productName,
                        validator: notEmpty,
                        onChanged: (val) {
                          enName = val;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CustomLightTextFormField(
                        hintText:
                            AppLocalizations.of(context).productdescription,
                        maxLines: 5,
                        validator: notEmpty,
                        onChanged: (val) {
                          enDesc = val;
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
                              hintText:
                                  AppLocalizations.of(context).sellingprice,
                              onChanged: (val) {
                                price = int.parse(val);
                              },
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: CustomLightTextFormField(
                              hintText: AppLocalizations.of(context).discount,
                              onChanged: (val) {
                                discount = int.parse(val);
                              },
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Wrap(
                      children: [
                        Text(
                          AppLocalizations.of(context).specSub1,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              height: .9),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            AppLocalizations.of(context).view,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).accentColor,
                                height: .9),
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context).specSub2,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              height: .9),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomLightTextFormField(
                      hintText: AppLocalizations.of(context).maxquan,
                      onChanged: (val) {
                        maxQuantityPerOrder = int.parse(val);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomLightTextFormField(
                      hintText: AppLocalizations.of(context).quan,
                      onChanged: (val) {
                        itemsAvailable = int.parse(val);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomLightTextFormField(
                      hintText: AppLocalizations.of(context).discDur,
                      onChanged: (val) {
                        discountDuration = int.parse(val);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomLightTextFormField(
                      hintText: AppLocalizations.of(context).prodCat,
                      onChanged: (val) {
                        category = val;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomLightTextFormField(
                      hintText: AppLocalizations.of(context).srchTags,
                      onChanged: (val) {
                        tags = val.split(",").toList();
                      },
                    ),
                  ),

                  // TextFieldTags(
                  //     initialTags: tags,
                  //     tagsStyler: TagsStyler(
                  //         tagTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  //         tagDecoration: BoxDecoration(
                  //           color: Color(0xffE9A06B),
                  //           borderRadius: BorderRadius.circular(8.0),
                  //         ),
                  //         tagCancelIcon: Icon(Icons.cancel,
                  //             size: 18.0, color: Theme.of(context).accentColor),
                  //         tagPadding: const EdgeInsets.all(6.0)),
                  //     textFieldStyler: TextFieldStyler(),
                  //     onTag: (tag) {
                  //       // tags.add(tag);
                  //     },
                  //     onDelete: (tag) {})

                  // TextFieldTags(
                  //     initialTags: tags,
                  //     tagsStyler: TagsStyler(
                  //       tagTextStyle: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.white),
                  //       tagDecoration: BoxDecoration(
                  //         color: Color(0xffE9A06B),
                  //         borderRadius: BorderRadius.circular(8.0),
                  //       ),
                  //       tagCancelIcon: Icon(Icons.cancel,
                  //           size: 16.0,
                  //           color: Color.fromARGB(255, 235, 214, 214)),
                  //       tagPadding: const EdgeInsets.all(10.0),
                  //     ),
                  //     textFieldStyler: TextFieldStyler(
                  //       hintText: AppLocalizations.of(context).srchTags,
                  //       textFieldFilledColor:
                  //           Theme.of(context).backgroundColor,
                  //       helperText: '',
                  //       // textFieldBorder: OutlineInputBorder(borderSide: )
                  //     ),
                  //     onTag: (tag) {
                  //       // tags.add(tag);
                  //       print(tag);
                  //       print(tags);
                  //     },
                  //     onDelete: (tag) {})

                  // TextFieldTags(
                  //     initialTags:tags,
                  //     tagsStyler: TagsStyler(
                  //         tagTextStyle:
                  //             TextStyle(fontWeight: FontWeight.bold),
                  //         tagDecoration: BoxDecoration(
                  //           color: Color(0xffFCCDAB),
                  //           borderRadius: BorderRadius.circular(8.0),
                  //         ),
                  //         tagCancelIcon: Icon(Icons.cancel,
                  //             size: 18.0,
                  //             color: Theme.of(context).accentColor),
                  //         tagPadding: const EdgeInsets.all(6.0)),
                  //     textFieldStyler: TextFieldStyler(),
                  //     onTag: (tag) {},
                  //     onDelete: (tag) {}),

                  // Padding(
                  //   padding: const EdgeInsets.only(top: 20),
                  //   child: FlutterTagging(
                  //     textFieldDecoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //               color: Theme.of(context).accentColor)),
                  //       hintText: AppLocalizations.of(context).tags,
                  //       labelText: AppLocalizations.of(context).srchTags,
                  //     ),
                  //     addButtonWidget: Container(
                  //       padding: EdgeInsets.all(8.0),
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  //         color: Theme.of(context).accentColor,
                  //       ),
                  //       child: Row(
                  //         mainAxisSize: MainAxisSize.min,
                  //         children: <Widget>[
                  //           Icon(
                  //             Icons.add,
                  //             color: Colors.white,
                  //             size: 15.0,
                  //           ),
                  //           Text(
                  //             AppLocalizations.of(context).addtags,
                  //             style: TextStyle(
                  //                 color: Colors.white, fontSize: 14.0),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     chipsColor: Theme.of(context).accentColor,
                  //     chipsFontColor: Colors.white,
                  //     deleteIcon: Icon(Icons.cancel, color: Colors.white),
                  //     chipsPadding: EdgeInsets.all(2.0),
                  //     chipsFontSize: 14.0,
                  //     chipsSpacing: 5.0,
                  //     suggestionsCallback: (pattern) async {
                  //       return await TagSearchService.getSuggestions(pattern);
                  //     },
                  //     onChanged: (tag) {
                  //       print(tag);
                  //       print(tags);
                  //     },
                  //   ),
                  // )
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
                        Radio(
                          activeColor: Color(0xff273147),
                          groupValue: groupValue,
                          onChanged: (value) => setState(() {
                            groupValue = value;
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
                        Radio(
                          activeColor: Color(0xff273147),
                          groupValue: groupValue,
                          onChanged: (value) => setState(() {
                            groupValue = value;
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
                        if (_productListingForm.currentState.validate() &&
                            image != null) {
                          Product product = Product.fromJson({
                            "arName": arName,
                            "arDesc": arDesc,
                            "enName": enName,
                            "enDesc": enDesc,
                            "price": price,
                            "discount": discount,
                            "discountDuration": discountDuration,
                            "itemsAvailable": itemsAvailable,
                            "tags": tags,
                            "maxQuantityPerOrder": maxQuantityPerOrder,
                            "shipment": groupValue
                          });
                          try {
                            await Provider.of<MainLocaleProvider>(context,
                                    listen: false)
                                .addProduct(product, image);
                            Navigator.of(context).pushNamed('/productReview',
                                arguments: product);
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

// class TagSearchService {
//   static Future<List> getSuggestions(String query) async {
//     await Future.delayed(Duration(milliseconds: 400), null);
//     List<String> tagList = <String>[
//       'Painting',
//       'Jewelry',
//       'Dolls',
//       'Accrssiries'
//     ];
//     // tagList.add('Painting');
//     // tagList.add('Jewelry');
//     // tagList.add('Dolls');
//     // tagList.add('Accrssiries');
//     List<String> filteredTagList = <String>[];
//     if (query.isNotEmpty) {
//       filteredTagList.add(query);
//     }
//     for (String tag in tagList) {
//       if (tag.toLowerCase().contains(query)) {
//         filteredTagList.add(tag);
//       }
//     }
//     return filteredTagList;
//   }
// }
