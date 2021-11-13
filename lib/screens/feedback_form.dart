import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lgs_audiopedia/common/header.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({Key? key}) : super(key: key);

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final List<String> provinces = [
    'Khyber Pakhtunkhwa',
    'Punjab',
    'Sindh',
    'Balochistan'
  ];
  String? selectedProvince = 'Khyber Pakhtunkhwa';
  //District list
  final List<String> districts = [
    'Charsadda District',
    'Nowshera District',
    'Peshawar District',
    'Khyber District',
    'Mohmand District'
  ];
  String? selectedDistrict = 'Peshawar District';
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
  String? selectedTehsil = 'Peshawar City Tehsil';

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

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final font = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                  'Feedback Form',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff35016D),
                  ),
                ),
                Spacer(),
              ],
            ),
            Form(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name'),
                            SizedBox(
                              height: screenHeight * 0.008,
                            ),
                            Container(
                              width: screenWidth * 0.48,
                              height: screenHeight * 0.05,
                              // alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xff35016D),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          left: 14, right: 14, bottom: 12),
                                      border: InputBorder.none,
                                      hintText: 'Enter your name',
                                      hintStyle: TextStyle(
                                        fontSize: font * 13,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //contact no
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contact No',
                              // textAlign: TextAlign.left,
                            ),
                            SizedBox(height: screenHeight * 0.008),
                            Container(
                              width: screenWidth * 0.47,
                              height: screenHeight * 0.05,
                              // alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xff35016D),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          left: 14, right: 14, bottom: 12),
                                      border: InputBorder.none,
                                      hintText: 'Enter your contact number',
                                      hintStyle: TextStyle(
                                        fontSize: font * 13,
                                      )),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    //complaint dept and complaint nature textformfields
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name'),
                            SizedBox(
                              height: screenHeight * 0.008,
                            ),
                            Container(
                              width: screenWidth * 0.48,
                              height: screenHeight * 0.05,
                              // alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xff35016D),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          left: 14, right: 14, bottom: 12),
                                      border: InputBorder.none,
                                      hintText: 'Enter your name',
                                      hintStyle: TextStyle(
                                        fontSize: font * 13,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //contact no
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contact No',
                              // textAlign: TextAlign.left,
                            ),
                            SizedBox(height: screenHeight * 0.008),
                            Container(
                              width: screenWidth * 0.47,
                              height: screenHeight * 0.05,
                              // alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xff35016D),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          left: 14, right: 14, bottom: 12),
                                      border: InputBorder.none,
                                      hintText: 'Enter your contact number',
                                      hintStyle: TextStyle(
                                        fontSize: font * 13,
                                      )),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    //complaint details
                    SizedBox(height: screenHeight * 0.03),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Complaint Details',
                          // textAlign: TextAlign.left,
                        ),
                        SizedBox(height: screenHeight * 0.008),
                        Container(
                          width: screenWidth * 1,
                          height: screenHeight * 0.14,
                          // alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xff35016D),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            minLines: 2,
                            maxLines: 6,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: 14, right: 14, bottom: 12),
                                border: InputBorder.none,
                                hintText: 'Enter your name',
                                hintStyle: TextStyle(
                                  fontSize: font * 13,
                                )),
                          ),
                        ),
                      ],
                    ),
                    //address
                    SizedBox(height: screenHeight * 0.04),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Address',
                          // textAlign: TextAlign.left,
                        ),
                        SizedBox(height: screenHeight * 0.008),
                        Container(
                          width: screenWidth * 1,
                          height: screenHeight * 0.05,
                          // alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xff35016D),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            // minLines: 2,
                            // maxLines: 6,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: 14, right: 14, bottom: 12),
                                border: InputBorder.none,
                                hintText: 'Enter your address',
                                hintStyle: TextStyle(
                                  fontSize: font * 13,
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    //dropdowns
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(height: screenHeight * 0.04),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Provice',
                              // textAlign: TextAlign.left,
                            ),
                            SizedBox(height: screenHeight * 0.008),
                            Container(
                              width: screenWidth * 0.3,
                              height: screenHeight * 0.05,
                              // alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xff35016D),
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey,
                                    ),
                                    // style: TextStyle(
                                    //   backgroundColor: Colors.green,
                                    // ),
                                    value: selectedProvince,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedProvince = value;
                                      });
                                    },
                                    items: provinces
                                        .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem(
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: font * 9,
                                          ),
                                        ),
                                        value: value,
                                      );
                                    }).toList(),
                                    dropdownColor: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //district dropdown
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'District',
                              // textAlign: TextAlign.left,
                            ),
                            SizedBox(height: screenHeight * 0.008),
                            Container(
                              width: screenWidth * 0.3,
                              height: screenHeight * 0.05,
                              // alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xff35016D),
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey,
                                    ),
                                    // style: TextStyle(
                                    //   backgroundColor: Colors.green,
                                    // ),
                                    value: selectedDistrict,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedDistrict = value;
                                      });
                                    },
                                    items: districts
                                        .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem(
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: font * 9,
                                          ),
                                        ),
                                        value: value,
                                      );
                                    }).toList(),
                                    dropdownColor: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //tehsil dropdown
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tehsil',
                              // textAlign: TextAlign.left,
                            ),
                            SizedBox(height: screenHeight * 0.008),
                            Container(
                              width: screenWidth * 0.3,
                              height: screenHeight * 0.05,
                              // alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xff35016D),
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey,
                                    ),
                                    // style: TextStyle(
                                    //   backgroundColor: Colors.green,
                                    // ),
                                    value: selectedTehsil,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedTehsil = value;
                                      });
                                    },
                                    items: tehsils
                                        .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem(
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: font * 9,
                                          ),
                                        ),
                                        value: value,
                                      );
                                    }).toList(),
                                    dropdownColor: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    //upload picture
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Picture'),
                            GestureDetector(
                              onTap: () {
                                // pickImageFromCamera();
                                _showPicker(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: screenHeight * 0.05,
                                width: screenWidth * 0.25,
                                decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  border:
                                      Border.all(color: Colors.black, width: 2),
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
                                        'Upload File',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                // ),
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
                        Container(
                          alignment: Alignment.center,
                          width: screenWidth * 0.3,
                          height: screenHeight * 0.05,
                          decoration: BoxDecoration(
                            color: Color(0xff35016D),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'SEND',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: font * 20,
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    // SizedBox(height: screenHeight * 0.05),
                  ],
                ),
              ),
            ))
            //rough form
            // Container(
            //   padding: EdgeInsets.symmetric(vertical: 30),
            //   child: Form(
            //       key: _formKey,
            //       child: Column(
            //         children: [
            //           TextFormField(
            //             validator: (value) {
            //               if (value!.isEmpty) {
            //                 return 'Name cannot be empty';
            //               } else if (value.length < 3) {
            //                 return 'Length should be at least 4';
            //               }
            //               return null;
            //             },
            //             decoration: InputDecoration(
            //                 labelText: 'Name',
            //                 hintText: 'Write Your Name',
            //                 border: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(20),
            //                 )),
            //           ),
            //           TextFormField(
            //             validator: (value) {
            //               if (value!.isEmpty) {
            //                 return 'Name cannot be empty';
            //               } else if (value.length < 3) {
            //                 return 'Length should be at least 4';
            //               }
            //               return null;
            //             },
            //             decoration: InputDecoration(
            //                 labelText: 'Name',
            //                 hintText: 'Write Your Name',
            //                 border: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(20),
            //                 )),
            //           ),
            //           TextFormField(
            //             validator: (value) {
            //               if (value!.isEmpty) {
            //                 return 'Name cannot be empty';
            //               } else if (value.length < 3) {
            //                 return 'Length should be at least 4';
            //               }
            //               return null;
            //             },
            //             decoration: InputDecoration(
            //                 labelText: 'Name',
            //                 hintText: 'Write Your Name',
            //                 border: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(20),
            //                 )),
            //           ),
            //         ],
            //       )),
            // ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _formKey.currentState!.validate();
      //   },
      //   child: Icon(Icons.done),
      // ),
    );
  }
}
