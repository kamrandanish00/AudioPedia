import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lgs_audiopedia/common/form_submitted_screen.dart';
import 'package:lgs_audiopedia/common/header.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({Key? key}) : super(key: key);

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  bool loading = true;
  bool sending = true;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _complaintDetailsController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  // String? base64Image;
  // File? tempFile;
  // String errMessage = 'Error uploading image';
  // Future<File>? file;
  // String status = '';

  @override
  void initState() {
    getProvinces();
    getDistricts();
    getTehsils();
    getDepartments();
    getComplaintsNature();

    super.initState();
  }

  // setStatus(String message) {
  //   setState(() {
  //     // status = message;
  //   });
  // }

  //upload image
  // startUpload() {
  //   setStatus('Uploading Image...');
  //   if (null == tempFile) {
  //     setStatus(errMessage);
  //     return;
  //   }
  //   String fileName = tempFile!.path.split('/').last;
  //   upload(fileName);
  // }

  // //upload
  // upload(String fileName) {}

  // //show image widget
  // Widget showImage() {
  //   return FutureBuilder<File>(
  //     future: file,
  //     builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
  //       if (snapshot.connectionState == ConnectionState.done &&
  //           null != snapshot.data) {
  //         tempFile = snapshot.data;
  //         base64Image = base64Encode(snapshot.data!.readAsBytesSync());
  //         return Flexible(
  //             child: Image.file(
  //           snapshot.data!,
  //           fit: BoxFit.fill,
  //         ));
  //       } else if (null != snapshot.error) {
  //         return const Text(
  //           'Error Picking Image',
  //           textAlign: TextAlign.center,
  //         );
  //       } else {
  //         return const Text(
  //           'No Image Selected',
  //           textAlign: TextAlign.center,
  //         );
  //       }
  //     },
  //   );
  // }

  // final List<String> provinces = [
  //   'Khyber Pakhtunkhwa',
  //   'Punjab',
  //   'Sindh',
  //   'Balochistan'
  // ];
  // String? selectedProvince = 'Khyber Pakhtunkhwa';

  //new provinces
  var selectedProvince;
  List? provicensData;

  //for getting tracking id
  List? trackingIdData;

  //getting provinces
  Future getProvinces() async {
    String url = 'https://audiopedia.crispato.com/api/provinces.php';

    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonBody = response.body;
        var jsonData = json.decode(jsonBody);

        setState(() {
          provicensData = jsonData;
          loading = false;
        });
        print('These are Provinces *********** $jsonData');
        return 'success';
      } else {
        return 'getProvinces failed to load data';
      }
    } catch (e) {
      return e;
    }
  }

  //districs
  var selectedDistrict;
  List? districtsData;

  //fetching districts
  Future getDistricts() async {
    String districsUrl =
        'https://audiopedia.crispato.com/api/district.php?id=$selectedProvince';

    try {
      var response = await http.get(Uri.parse(districsUrl));
      var jsonBody = response.body;
      var jsonData = json.decode(jsonBody);

      setState(() {
        districtsData = jsonData;
      });
      print('These are Districs $districtsData');
      return 'Success';
    } catch (e) {
      return 'Failed districts';
    }
  }

  //getting tehsils data

  var selectedTehsil;
  List? tehsilsData;
  Future getTehsils() async {
    String tehsilsUrl =
        'https://audiopedia.crispato.com/api/tehsil.php?id=$selectedDistrict';

    try {
      var response = await http.get(Uri.parse(tehsilsUrl));
      var jsonBody = response.body;
      var jsonData = json.decode(jsonBody);

      setState(() {
        tehsilsData = jsonData;
      });
      print('These are Tehsils $tehsilsData');
      return 'Success';
    } catch (e) {
      return 'Failed districts';
    }
  }

  //department list
  var selectedDepartment;
  List? departmentsData;

  //getting provinces
  Future getDepartments() async {
    String url = 'https://audiopedia.crispato.com/api/department.php';

    try {
      var response = await http.get(Uri.parse(url));
      var jsonBody = response.body;
      var jsonData = json.decode(jsonBody);

      setState(() {
        departmentsData = jsonData;
      });
      print('These are Provinces *********** $jsonData');
      return 'success';
    } catch (e) {
      return e;
    }
  }

  //complaint nature
  String? selectedComplaintNature;
  List? complaintsData;

  //getting complaints nature
  Future getComplaintsNature() async {
    String url =
        'https://audiopedia.crispato.com/api/naturelist.php?id=$selectedDepartment';

    try {
      var response = await http.get(Uri.parse(url));
      var jsonBody = response.body;
      var jsonData = json.decode(jsonBody);

      setState(() {
        complaintsData = jsonData;
      });
      print('These are Provinces *********** $jsonData');
      return 'success';
    } catch (e) {
      return e;
    }
  }

  //District list
  final List<String> districts = [
    'Charsadda District',
    'Nowshera District',
    'Peshawar District',
    'Khyber District',
    'Mohmand District'
  ];
  // String? selectedDistrict = 'Peshawar District';
  //Tehsil list
  final List<String> tehsils = [
    'Peshawar City Tehsil',
    'Shah Alam Tehsil',
    'Mathra Tehsil',
    'Chamkani Tehsil',
    'Badbher Tehsil',
    'Peshtakhara Tehsil',
    'Hassan Kheil Tehsil'
  ];
  // String? selectedTehsil = 'Peshawar City Tehsil';

  //image picker
  // dynamic _image;
  //picking image using camera
  // _imgFromCamera() async {
  //   dynamic image = await ImagePicker()
  //       .pickImage(source: ImageSource.camera, imageQuality: 50);

  //   setState(() {
  //     _image = image;
  //   });
  // }
  //
  File? image;
  Future pickImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  //image from gallery johnness milke
  Future pickImageGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemperoray = File(image.path);
      setState(() {
        this.image = imageTemperoray;
      });
    } on PlatformException catch (e) {
      print('Faild to pick image from gallery $e');
    }
  }

  // _imgFromGallery() async {
  //   XFile? image = await ImagePicker()
  //       .pickImage(source: ImageSource.gallery, imageQuality: 50);

  //   setState(() {
  //     _image = image;
  //   });
  // }

  // choose camera or gallery choice for user
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
                      title: new Text('Photo Library'),
                      onTap: () {
                        pickImageGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      // _imgFromCamera();
                      pickImageFromCamera();

                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  //build method
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final font = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Color(0xff35016D),
            child: Header(),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back),
                color: Color(0xff35016D),
              ),
              Spacer(),
              Text(
                // 'Feedback Form',
                AppLocalizations.of(context)!.feedback_form,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff35016D),
                ),
              ),
              Spacer(),
            ],
          ),
          // provicensData != null
          !loading
              ? Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Form(
                            // autovalidateMode: AutovalidateMode.onUserInteraction,
                            key: _formKey,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Text('Name'),
                                              Text(
                                                AppLocalizations.of(context)!
                                                    .name,
                                              ),
                                              SizedBox(
                                                height: screenHeight * 0.008,
                                              ),
                                              Container(
                                                // width: screenWidth * 0.48,
                                                height: screenHeight * 0.05,
                                                // alignment: Alignment.centerRight,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color(0xff35016D),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: TextFormField(
                                                    controller: _nameController,
                                                    // The validator receives the text that the user has entered.
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return AppLocalizations
                                                                .of(context)!
                                                            .please_enter_your_name;
                                                      }
                                                      return null;
                                                    },
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 14,
                                                              right: 14,
                                                              bottom: 12),
                                                      border: InputBorder.none,
                                                      // hintText: 'Enter your name',

                                                      hintText:
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .enter_your_name,
                                                      hintStyle: TextStyle(
                                                        fontSize: font * 13,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        //contact no
                                        SizedBox(width: screenWidth * 0.01),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                // 'Contact No',
                                                AppLocalizations.of(context)!
                                                    .contact_no,
                                                // textAlign: TextAlign.left,
                                              ),
                                              SizedBox(
                                                  height: screenHeight * 0.008),
                                              Container(
                                                // width: screenWidth * 0.47,
                                                height: screenHeight * 0.05,
                                                // alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color(0xff35016D),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                  child: TextFormField(
                                                    controller:
                                                        _contactController,
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        // return 'Please enter your contact no';
                                                        return AppLocalizations
                                                                .of(context)!
                                                            .please_enter_your_contact_no;
                                                      }
                                                      return null;
                                                    },
                                                    decoration: InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                          left: 14,
                                                          right: 14,
                                                          bottom: 12,
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                        // hintText: 'Enter your contact number',
                                                        hintText: AppLocalizations
                                                                .of(context)!
                                                            .enter_your_contact_no,
                                                        hintStyle: TextStyle(
                                                          fontSize: font * 13,
                                                        )),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: screenHeight * 0.01),
                                    //complaint dept and complaint nature textformfields
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              // Text('Complaint Department'),
                                              Text(
                                                AppLocalizations.of(context)!
                                                    .complaint_department,
                                              ),
                                              SizedBox(
                                                height: screenHeight * 0.008,
                                              ),
                                              departmentsData != null
                                                  ? Container(
                                                      // width: screenWidth * 0.48,
                                                      height:
                                                          screenHeight * 0.05,
                                                      // alignment: Alignment.centerRight,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color:
                                                              Color(0xff35016D),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      // child: Center(
                                                      //   child: TextFormField(
                                                      //     validator: (value) {
                                                      //       if (value == null ||
                                                      //           value.isEmpty) {
                                                      //         // return 'This field is required';
                                                      //         return AppLocalizations.of(
                                                      //                 context)!
                                                      //             .this_field_is_mandatory;
                                                      //       }
                                                      //       return null;
                                                      //     },
                                                      //     decoration: InputDecoration(
                                                      //         contentPadding:
                                                      //             EdgeInsets.only(
                                                      //                 left: 14,
                                                      //                 right: 14,
                                                      //                 bottom: 12),
                                                      //         border: InputBorder.none,
                                                      //         // hintText: 'Enter complaint department',
                                                      //         hintText: AppLocalizations.of(
                                                      //                 context)!
                                                      //             .enter_complaint_department,
                                                      //         hintStyle: TextStyle(
                                                      //           fontSize: font * 13,
                                                      //         )),
                                                      //   ),
                                                      // ),

                                                      //complaint department from api
                                                      child: FittedBox(
                                                          child:
                                                              DropdownButtonHideUnderline(
                                                        child: DropdownButton<
                                                            dynamic>(
                                                          value:
                                                              selectedDepartment,
                                                          hint: Text(
                                                              'select Department'),
                                                          items:
                                                              departmentsData!
                                                                  .map(
                                                            (departmentslList) {
                                                              return DropdownMenuItem(
                                                                child: Text(
                                                                    departmentslList[
                                                                        'name']),
                                                                value: departmentslList[
                                                                        'id']
                                                                    .toString(),
                                                              );
                                                            },
                                                          ).toList(),
                                                          onChanged: (value) {
                                                            setState(() {
                                                              selectedDepartment =
                                                                  value;
                                                              // selectedComplaintNature =
                                                              //     null;
                                                              // complaintsData = [];
                                                              getComplaintsNature();
                                                              print(
                                                                  'This is Selected Department value === $selectedDepartment');
                                                            });
                                                          },
                                                        ),
                                                      )),
                                                    )
                                                  : Center(
                                                      child:
                                                          CircularProgressIndicator()),
                                            ],
                                          ),
                                        ),
                                        //contact no
                                        SizedBox(width: screenWidth * 0.01),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Text(
                                                // 'Nature of Complaint:',
                                                AppLocalizations.of(context)!
                                                    .nature_of_complaint,
                                                // textAlign: TextAlign.left,
                                              ),
                                              SizedBox(
                                                  height: screenHeight * 0.008),
                                              Container(
                                                // width: screenWidth * 0.47,
                                                height: screenHeight * 0.05,
                                                // alignment: Alignment.centerRight,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color(0xff35016D),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                // child: Center(
                                                //   child: TextFormField(
                                                //     decoration: InputDecoration(
                                                //         contentPadding:
                                                //             EdgeInsets.only(
                                                //                 left: 14,
                                                //                 right: 14,
                                                //                 bottom: 12),
                                                //         border: InputBorder.none,
                                                //         // hintText: 'Enter Complaint Nature',
                                                //         hintText: AppLocalizations.of(
                                                //                 context)!
                                                //             .enter_complaint_nature,
                                                //         hintStyle: TextStyle(
                                                //           fontSize: font * 13,
                                                //         )),
                                                //   ),
                                                // ),

                                                //complaint nature dropdown from api
                                                child: complaintsData != null
                                                    ? FittedBox(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              DropdownButtonHideUnderline(
                                                            child: ButtonTheme(
                                                              alignedDropdown:
                                                                  true,
                                                              child:
                                                                  DropdownButton<
                                                                      dynamic>(
                                                                value:
                                                                    selectedComplaintNature,
                                                                hint: Text(
                                                                    'select Complaint Nature'),
                                                                items:
                                                                    complaintsData!
                                                                        .map(
                                                                  (complaintslList) {
                                                                    return DropdownMenuItem(
                                                                      child:
                                                                          FittedBox(
                                                                        child: Text(
                                                                            complaintslList['submodule']),
                                                                      ),
                                                                      value: complaintslList[
                                                                              'id']
                                                                          .toString(),
                                                                    );
                                                                  },
                                                                ).toList(),
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    selectedComplaintNature =
                                                                        value ??
                                                                            'dsdf';
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : Center(
                                                        child: Text(
                                                            'No Internet')),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    //complaint details
                                    SizedBox(height: screenHeight * 0.03),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                // 'Complaint Details',
                                                AppLocalizations.of(context)!
                                                    .complaint_details,
                                                // textAlign: TextAlign.left,
                                              ),
                                              SizedBox(
                                                  height: screenHeight * 0.008),
                                              Container(
                                                // width: screenWidth * 1,
                                                height: screenHeight * 0.2,
                                                // alignment: Alignment.centerRight,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color(0xff35016D),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: TextFormField(
                                                  controller:
                                                      _complaintDetailsController,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      // return 'Kindly provide some details about your complaint.';
                                                      return AppLocalizations
                                                              .of(context)!
                                                          .kindly_provide_some_details_about_complaint;
                                                    }
                                                    return null;
                                                  },
                                                  minLines: 2,
                                                  maxLines: 6,
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 14,
                                                              right: 14,
                                                              bottom: 12),
                                                      border: InputBorder.none,
                                                      // hintText: 'Provide Complete Details',
                                                      hintText: AppLocalizations
                                                              .of(context)!
                                                          .provide_complaint_details,
                                                      hintStyle: TextStyle(
                                                        fontSize: font * 13,
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    //address
                                    SizedBox(height: screenHeight * 0.01),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                // 'Address',
                                                AppLocalizations.of(context)!
                                                    .address,
                                                // textAlign: TextAlign.left,
                                              ),
                                              SizedBox(
                                                  height: screenHeight * 0.008),
                                              Container(
                                                // width: screenWidth * 1,
                                                height: screenHeight * 0.05,
                                                // alignment: Alignment.centerRight,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color(0xff35016D),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: TextFormField(
                                                  controller:
                                                      _addressController,
                                                  //  validator: (value) {
                                                  //     if (value == null ||
                                                  //         value.isEmpty) {
                                                  //       return 'This field is required';
                                                  //     }
                                                  //     return null;
                                                  //   },
                                                  validator: (val) {
                                                    if (val == null ||
                                                        val.isEmpty) {
                                                      return 'This field is required';
                                                    }
                                                    return null;
                                                  },
                                                  // minLines: 2,
                                                  // maxLines: 6,
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 14,
                                                              right: 14,
                                                              bottom: 12),
                                                      border: InputBorder.none,
                                                      // hintText: 'Enter your address',
                                                      hintText: AppLocalizations
                                                              .of(context)!
                                                          .enter_your_address,
                                                      hintStyle: TextStyle(
                                                        fontSize: font * 13,
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: screenHeight * 0.02),
                                    //dropdowns
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(height: screenHeight * 0.04),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                // 'Provice',
                                                AppLocalizations.of(context)!
                                                    .province,
                                                // textAlign: TextAlign.left,
                                              ),
                                              SizedBox(
                                                  height: screenHeight * 0.008),
                                              Container(
                                                // width: screenWidth * 0.3,
                                                height: screenHeight * 0.05,
                                                // alignment: Alignment.centerRight,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color(0xff35016D),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Center(
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    // child: DropdownButton<String>(
                                                    //   icon: Icon(
                                                    //     Icons.arrow_drop_down,
                                                    //     color: Colors.grey,
                                                    //   ),
                                                    //   // style: TextStyle(
                                                    //   //   backgroundColor: Colors.green,
                                                    //   // ),
                                                    //   value: selectedProvince,
                                                    //   onChanged: (value) {
                                                    //     setState(() {
                                                    //       selectedProvince = value;
                                                    //     });
                                                    //   },
                                                    //   items: provinces.map<
                                                    //       DropdownMenuItem<
                                                    //           String>>((value) {
                                                    //     return DropdownMenuItem(
                                                    //       child: Text(
                                                    //         value,
                                                    //         style: TextStyle(
                                                    //           color: Colors.grey,
                                                    //           fontSize: font * 9,
                                                    //         ),
                                                    //       ),
                                                    //       value: value,
                                                    //     );
                                                    //   }).toList(),
                                                    //   dropdownColor: Colors.black,
                                                    // ),

                                                    //latest province dropdown with api
                                                    child: FittedBox(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0,
                                                                right: 8),
                                                        child: DropdownButton<
                                                            dynamic>(
                                                          value:
                                                              selectedProvince,
                                                          hint: Text(
                                                              'select province'),
                                                          items: provicensData!
                                                              .map(
                                                            (list) {
                                                              return DropdownMenuItem(
                                                                child:
                                                                    FittedBox(
                                                                  child: Text(list[
                                                                      'province']),
                                                                ),
                                                                value: list[
                                                                        'id']
                                                                    .toString(),
                                                              );
                                                            },
                                                          ).toList(),
                                                          onChanged: (value) {
                                                            setState(() {
                                                              selectedProvince =
                                                                  value;
                                                              getDistricts();
                                                              getTehsils();
                                                              print(
                                                                  'This is SelectedProvince === $selectedProvince');
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        //district dropdown
                                        SizedBox(width: screenWidth * 0.01),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                // 'District',
                                                AppLocalizations.of(context)!
                                                    .district,
                                                // textAlign: TextAlign.left,
                                              ),
                                              SizedBox(
                                                  height: screenHeight * 0.008),
                                              Container(
                                                // width: screenWidth * 0.3,
                                                height: screenHeight * 0.05,
                                                // alignment: Alignment.centerRight,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color(0xff35016D),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Center(
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    // child: DropdownButton<String>(
                                                    //   icon: Icon(
                                                    //     Icons.arrow_drop_down,
                                                    //     color: Colors.grey,
                                                    //   ),
                                                    //   // style: TextStyle(
                                                    //   //   backgroundColor: Colors.green,
                                                    //   // ),
                                                    //   value: selectedDistrict,
                                                    //   onChanged: (value) {
                                                    //     setState(() {
                                                    //       selectedDistrict = value;
                                                    //     });
                                                    //   },
                                                    //   items: districts.map<
                                                    //       DropdownMenuItem<
                                                    //           String>>((value) {
                                                    //     return DropdownMenuItem(
                                                    //       child: Text(
                                                    //         value,
                                                    //         style: TextStyle(
                                                    //           color: Colors.grey,
                                                    //           fontSize: font * 9,
                                                    //         ),
                                                    //       ),
                                                    //       value: value,
                                                    //     );
                                                    //   }).toList(),
                                                    //   dropdownColor: Colors.black,
                                                    // ),

                                                    //new districts dropdown with api
                                                    child: FittedBox(
                                                      child: DropdownButton<
                                                          dynamic>(
                                                        value: selectedDistrict,
                                                        hint: Text(
                                                            'select district'),
                                                        items:
                                                            districtsData!.map(
                                                          (distList) {
                                                            return DropdownMenuItem(
                                                              child: Text(distList[
                                                                  'district']),
                                                              value: distList[
                                                                      'id']
                                                                  .toString(),
                                                            );
                                                          },
                                                        ).toList(),
                                                        onChanged: (value) {
                                                          setState(() {
                                                            selectedDistrict =
                                                                value;
                                                            selectedTehsil =
                                                                null;
                                                            tehsilsData = [];
                                                            getTehsils();
                                                            print(
                                                                'this is seletectedDistric value ===== $selectedDistrict');
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        //tehsil dropdown
                                        SizedBox(width: screenWidth * 0.01),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                // 'Tehsil',
                                                AppLocalizations.of(context)!
                                                    .tehsil,
                                                // textAlign: TextAlign.left,
                                              ),
                                              SizedBox(
                                                  height: screenHeight * 0.008),
                                              Container(
                                                // width: screenWidth * 0.3,
                                                height: screenHeight * 0.05,
                                                // alignment: Alignment.centerRight,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color(0xff35016D),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Center(
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    // child: DropdownButton<String>(
                                                    //   icon: Icon(
                                                    //     Icons.arrow_drop_down,
                                                    //     color: Colors.grey,
                                                    //   ),
                                                    //   // style: TextStyle(
                                                    //   //   backgroundColor: Colors.green,
                                                    //   // ),
                                                    //   value: selectedTehsil,
                                                    //   onChanged: (value) {
                                                    //     setState(() {
                                                    //       selectedTehsil = value;
                                                    //     });
                                                    //   },
                                                    //   items: tehsils.map<
                                                    //       DropdownMenuItem<
                                                    //           String>>((value) {
                                                    //     return DropdownMenuItem(
                                                    //       child: Text(
                                                    //         value,
                                                    //         style: TextStyle(
                                                    //           color: Colors.grey,
                                                    //           fontSize: font * 9,
                                                    //         ),
                                                    //       ),
                                                    //       value: value,
                                                    //     );
                                                    //   }).toList(),
                                                    //   dropdownColor: Colors.black,
                                                    // ),

                                                    //new tehsils dropdown with api
                                                    child: FittedBox(
                                                      child: DropdownButton<
                                                          dynamic>(
                                                        value: selectedTehsil,
                                                        hint: Text(
                                                            'select Tehsil'),
                                                        items: tehsilsData!.map(
                                                          (tehsilList) {
                                                            return DropdownMenuItem(
                                                              child: Text(
                                                                  tehsilList[
                                                                      'tehsil']),
                                                              value: tehsilList[
                                                                      'id']
                                                                  .toString(),
                                                            );
                                                          },
                                                        ).toList(),
                                                        onChanged: (value) {
                                                          setState(() {
                                                            selectedTehsil =
                                                                value ?? 'dsdf';
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: screenHeight * 0.01),
                                    //upload picture
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              // 'Picture'
                                              AppLocalizations.of(context)!
                                                  .picture,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                // pickImageFromCamera();
                                                _showPicker(context);
                                              },
                                              child: image == null
                                                  ? Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height:
                                                          screenHeight * 0.05,
                                                      width: screenWidth * 0.25,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey[700],
                                                        border: Border.all(
                                                            color: Colors.black,
                                                            width: 2),
                                                      ),
                                                      // child: image != Null
                                                      //     ? ClipRRect(
                                                      //         borderRadius: BorderRadius.circular(50),
                                                      //         child: Image.file(
                                                      //           image!,
                                                      //           width: 100,
                                                      //           height: 100,
                                                      //           fit: BoxFit.fitHeight,
                                                      //         ),
                                                      //       )
                                                      //     : TextButton(
                                                      //         onPressed: () {
                                                      //           // _showPicker(context);
                                                      //           // pickImageFromCamera();
                                                      //         },
                                                      //         child: Text(
                                                      //           'Upload File',
                                                      //           style: TextStyle(color: Colors.white),
                                                      //         ),
                                                      //       ),
                                                      //new
                                                      // child: TextButton(
                                                      //   onPressed: () {
                                                      //     // _showPicker(context);
                                                      //     // pickImageFromCamera();
                                                      //   },
                                                      child: image != null
                                                          ? Image.file(
                                                              image!,
                                                              fit: BoxFit.cover,
                                                            )
                                                          : Text(
                                                              // 'Upload File',
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .upload_file,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                      // ),
                                                    )
                                                  : Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Flexible(
                                                          fit: FlexFit.loose,
                                                          child: Container(
                                                            width: screenWidth *
                                                                0.9,
                                                            height: 300,
                                                            child: Image.file(
                                                              image!,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                            )
                                          ],
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                    SizedBox(height: screenHeight * 0.01),
                                    //send
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            // Validate returns true if the form is valid, or false otherwise.
                                            if (_formKey.currentState!
                                                .validate()) {
                                              // If the form is valid, display a snackbar. In the real world,
                                              // you'd often call a server or save the information in a database.
                                              // ScaffoldMessenger.of(context)
                                              //     .showSnackBar(
                                              //   const SnackBar(
                                              //       content: Text(
                                              //     'Processing Data',
                                              //     textAlign: TextAlign.center,
                                              //   )),
                                              // );

                                              //if form is valid then submit the form.
                                              RegisterComplaint();

                                              Timer(
                                                  Duration(milliseconds: 4000),
                                                  () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (ctx) =>
                                                            FormSubmittedScreen(
                                                              trackingIdData:
                                                                  trackingIdData!,
                                                            )));
                                              });

                                              // Navigator.of(context).pushReplacement(
                                              //     MaterialPageRoute(
                                              //         builder: (ctx) =>
                                              //             FormSubmittedScreen()));
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        'Please fill the required fields.')),
                                              );
                                            }
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: screenWidth * 0.3,
                                            height: screenHeight * 0.05,
                                            decoration: BoxDecoration(
                                              color: Color(0xff35016D),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: sending
                                                ? Text(
                                                    // 'SEND',
                                                    AppLocalizations.of(
                                                            context)!
                                                        .send,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: font * 20,
                                                    ),
                                                  )
                                                : Container(
                                                    height: 20,
                                                    width: 20,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5,
                                                            vertical: 1),
                                                    child:
                                                        CircularProgressIndicator(
                                                      // color: Colors.red,
                                                      strokeWidth: 0.5,
                                                    ),
                                                  ),
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                    // SizedBox(height: screenHeight * 0.05),
                                    // showImage(),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Container(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _formKey.currentState!.validate();
      //   },
      //   child: Icon(Icons.done),
      // ),
    );
  }

  Future RegisterComplaint() async {
    var apiUrl = 'https://audiopedia.crispato.com/api/insertcomplaint.php';

    Map<String, dynamic> mapeddata = {
      'nature': selectedDepartment,
      'subnature': selectedComplaintNature,
      'complaint': _complaintDetailsController.text,
      'address': _addressController.text,
      'province': selectedProvince,
      'district': selectedDistrict,
      'priority': 'Urgent',
      'contact': _contactController.text,
      'tehsil': selectedTehsil,
      'newdate': 'New date will be here',
    };
    print('JSON DATA  -==== $mapeddata');
    var decodeddvalue = jsonEncode(mapeddata);
    print('this is encoded data === $decodeddvalue');

    http.Response response = await http.post(
      Uri.parse(apiUrl),
      // headers: <String, String>{
      //   "Content-Type": "text/html; charset=UTF-8",
      // },
      body: mapeddata,
      // body: decodeddvalue,
    );
    if (response.statusCode == 200) {
      print('success');
      var jsonBody = response.body;
      var jsonData = json.decode(jsonBody);
      print('jsonData of tracking IDs $jsonData');
      //mapping through the jsonData to store its data in the list.
      var myList = jsonData.entries
          .map((entry) => "${entry.key} = ${entry.value}")
          .toList();

      setState(() {
        // trackingIdData = jsonData;
        trackingIdData = myList;
        sending = false;
      });
    } else {
      print('failed');
    }
    var rb = jsonEncode(response.body);
    print('this is jsonEncode reponse body ===== $rb');
    print('this is the post response ======== ${response.body}');
  }
}
