import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wemakescholars/controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                IntlPhoneField(
                  dropdownIconPosition: IconPosition.trailing,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  initialCountryCode: 'IN',
                  validator: (value) {
                    if (value == null || value.completeNumber.isEmpty) {
                      return 'Please enter your phone number';
                    } else if (!RegExp(r'^\d{10,}$')
                        .hasMatch(value.completeNumber)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Obx(() {
                  return authController.otpSent.value
                      ? PinCodeTextField(
                          appContext: context,
                          length: 6,
                          onChanged: (value) {
                            authController.otp.value = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the OTP';
                            } else if (value.length != 6) {
                              return 'OTP should be 6 digits';
                            }
                            return null;
                          },
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                            inactiveFillColor: Colors.grey[300],
                            selectedFillColor: Colors.white,
                            activeColor: Color(0xFF1fbba6),
                            inactiveColor: Colors.grey,
                            selectedColor: Color(0xFF1fbba6),
                          ),
                          keyboardType: TextInputType.number,
                        )
                      : Container();
                }),
                SizedBox(height: 16),
                Obx(() {
                  return authController.otpSent.value
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1fbba6),
                          ),
                          onPressed: authController.isResendButtonDisabled.value
                              ? null
                              : () {
                                  authController.resendOtp();
                                },
                          child: Text(authController.timerValue.value != 0
                              ? 'Resend OTP in ${authController.timerValue.value} seconds'
                              : 'Resend OTP'),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1fbba6),
                          ),
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              authController.sendOtp();
                            }
                          },
                          child: Text('Send OTP'),
                        );
                }),
                const SizedBox(height: 16),
                Obx(() {
                  return authController.otpSent.value
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1fbba6),
                          ),
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              Get.offAllNamed('/home');
                            }
                          },
                          child: const Text('Login'),
                        )
                      : Container();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
