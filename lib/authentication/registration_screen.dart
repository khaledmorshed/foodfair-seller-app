import 'package:flutter/material.dart';
import 'package:foodfair_seller_app/presentation/color_manager.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../widgets/container_decoration.dart';
import '../widgets/custom_text_form_field.dart';
import 'package:geolocator/geolocator.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();

  Position? position;
  List<Placemark>? placeMarks;

  Future<void> _getImage() async {
    imageXFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageXFile;
    });
  }

  getCurrentLocation() async {
    //by default permission stays denied. so it needs to send request to the usesr
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position newPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    position = newPosition;
    //it will provide multiple location but exact location is in index[0]
    placeMarks = await placemarkFromCoordinates(
      position!.latitude,
      position!.longitude,
    );

    //to get exact location
    Placemark pMark = placeMarks![0];
    //to get complete address
    String completeAddress =
        '${pMark.subThoroughfare} ${pMark.thoroughfare},${pMark.subLocality} ${pMark.locality},${pMark.subAdministrativeArea}, ${pMark.administrativeArea} ${pMark.postalCode}, ${pMark.country}';

    //now assign completeAddress inside of locationController.text
    locationController.text = completeAddress;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register form"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const ContainerDecoration().decoaration(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const ContainerDecoration().decoaration(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                //const SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    _getImage();
                  },
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.20,
                    backgroundColor: Colors.white,
                    backgroundImage: imageXFile == null
                        ? null
                        : FileImage(File(imageXFile!.path)),
                    child: imageXFile == null
                        ? Icon(
                            Icons.add_photo_alternate,
                            size: MediaQuery.of(context).size.width * 0.20,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        iconData: Icons.person,
                        controller: nameController,
                        hintText: "Name",
                        isObsecure: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        iconData: Icons.email,
                        controller: emailController,
                        hintText: "Email",
                        textInputType: TextInputType.emailAddress,
                        isObsecure: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        iconData: Icons.lock,
                        controller: passwordController,
                        hintText: "Password",
                        isObsecure: true,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        iconData: Icons.lock,
                        controller: confirmPasswordController,
                        hintText: "Confirm Password",
                        isObsecure: true,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        iconData: Icons.phone,
                        controller: phoneController,
                        textInputType: TextInputType.number,
                        hintText: "Phone",
                        isObsecure: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        iconData: Icons.my_location,
                        controller: locationController,
                        hintText: "Cafe/Restaurant Address",
                        isObsecure: false,
                        enable: true,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 400,
                        height: 40,
                        alignment: Alignment.center,
                        child: ElevatedButton.icon(
                          label: const Text(
                            "Get my Current Location",
                            style: TextStyle(color: Colors.white),
                          ),
                          icon: const Icon(
                            Icons.location_on,
                            color: Colors.cyan,
                          ),
                          onPressed: () {
                            getCurrentLocation();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: ColorManager.purple3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: ColorManager.green2),
                    ),
                  ),
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
