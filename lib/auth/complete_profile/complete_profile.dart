import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/auth/auth_provider.dart';
import 'package:pro_shop_golf_club/models/user.dart';
import 'package:pro_shop_golf_club/util/helper/helper.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_auth_button.dart';
import '../widgets/input_fields.dart';

class Completeprofile extends StatefulWidget {
  Completeprofile({Key? key}) : super(key: key);

  @override
  State<Completeprofile> createState() => _CompleteprofileState();
}

class _CompleteprofileState extends State<Completeprofile> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _dobController = TextEditingController();
  late Authentication auth;
  late UserModel userModel;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth = Provider.of<Authentication>(context, listen: false);
    userModel = auth.loggedUser!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  const Text(
                    'Complete profile',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Image.asset('assets/images/golf2.png'),
                  InputField(
                    controller: _firstNameController,
                    hint: 'First name',
                    icon: const Icon(Icons.person),
                  ),
                  const SizedBox(height: 8),

                  InputField(
                    controller: _lastNameController,
                    hint: 'Last name',
                    icon: const Icon(Icons.mail),
                  ),
                  const SizedBox(height: 8),
                  PhoneInput(controller: _phoneNumberController),
                  const SizedBox(height: 8),
                  CustomDate(
                    prefixIcon: const Icon(Icons.calendar_month),
                    hint: 'Date of birth',
                    controller: _dobController,
                  ),
                  const SizedBox(height: 8),
                  InputField(
                    hint: 'payment method',
                    icon: const Icon(Icons.payment),
                  ),
                  const SizedBox(height: 30),
                  Center(
                      child: AuthButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (validateGivenNames(
                                _firstNameController.text, true) !=
                            null) {
                          showSnackBar(
                              context,
                              validateGivenNames(
                                  _firstNameController.text, true)!);
                        } else if (validateGivenNames(
                                _lastNameController.text, false) !=
                            null) {
                          showSnackBar(
                              context,
                              validateGivenNames(
                                  _lastNameController.text, false)!);
                        } else if (validateDob(_dobController.text) != null) {
                          showSnackBar(
                              context, validateDob(_dobController.text)!);
                        } else {
                          userModel.firstName = _firstNameController.text;
                          userModel.lastName = _lastNameController.text;
                          userModel.phoneNumber = _phoneNumberController.text;
                          userModel.dob = _dobController.text;
                          userModel.completedProfile = true;

                          showProgress(context, 'Completing Profile', true);
                          auth.completeProfile(userModel).then((value) {
                            hideProgress();
                            setState(() {});
                          });
                        }
                      }
                    },
                    text: 'Finish',
                  )),
                  const SizedBox(height: 20),
                  // const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
