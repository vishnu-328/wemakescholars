import 'dart:async';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var phoneNumber = ''.obs;
  var otp = ''.obs;
  var otpSent = false.obs;
  var isResendButtonDisabled = true.obs;
  var timerValue = 30.obs;
  Timer? _timer;

  void startTimer() {
    timerValue.value = 30;
    isResendButtonDisabled.value = true;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerValue.value <= 0) {
        _timer?.cancel();
        isResendButtonDisabled.value = false;
      } else {
        timerValue.value--;
      }
    });
  }

  void sendOtp() {
    otpSent.value = true;
    startTimer();
  }

  void resendOtp() {
    startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
