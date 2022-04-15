import 'package:flutter/material.dart';

import '../widgets/custom_auth_button.dart';
import '../widgets/input_fields.dart';

class Completeprofile extends StatefulWidget {
  Completeprofile({Key? key}) : super(key: key);

  @override
  State<Completeprofile> createState() => _CompleteprofileState();
}

class _CompleteprofileState extends State<Completeprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
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
                  hint: 'First name',
                  icon: const Icon(Icons.person),
                ),
                const SizedBox(height: 8),

                InputField(
                  hint: 'Last name',
                  icon: const Icon(Icons.mail),
                ),
                const SizedBox(height: 8),
                PhoneInput(),
                const SizedBox(height: 8),
                InputField(
                    hint: 'date of birth', icon: const Icon(Icons.date_range)),
                const SizedBox(height: 8),
                InputField(
                  hint: 'payment method',
                  icon: const Icon(Icons.payment),
                ),
                const SizedBox(height: 30),
                Center(
                    child: AuthButton(
                  onTap: () {},
                  text: 'Finish',
                )),
                // const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
