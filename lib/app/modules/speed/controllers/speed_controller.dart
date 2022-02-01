import 'package:get/get.dart';
import 'package:internet_speed_test/callbacks_enum.dart';
import 'package:internet_speed_test/internet_speed_test.dart';
import 'package:king_vpn/app/components/errorMsg.dart';
import 'package:king_vpn/app/components/progressBar.dart';
import 'package:king_vpn/app/helper/constants/testServer.dart';

class SpeedController extends GetxController {
  final internetSpeedTest = InternetSpeedTest();
  final ProgressBar progressBar = ProgressBar();
  RxDouble downloadRate = 0.0.obs;
  RxDouble uploadRate = 0.0.obs;
  RxString downloadProgress = '0'.obs;
  RxString uploadProgress = '0'.obs;
  double displayRate = 0;
  String displayRateTxt = '0.0';
  RxDouble displayPer = 0.0.obs;
  RxString unitText = 'Mb/s'.obs;

  // Using a flag to prevent the user from interrupting running tests
  RxBool isTesting = false.obs;

  void protectGauge(double rate) {
    // this function prevents the needle from exceeding the maximum limit of the gauge
    if (rate > 150) {
      displayRateTxt = rate.toStringAsFixed(2);
    } else {
      displayRate = rate;
      displayRateTxt = displayRate.toStringAsFixed(2);
    }
  }

  void speedTest() {
    if (!isTesting.value) {
      isTesting.value = true;
      internetSpeedTest.startDownloadTesting(
        onDone: (double transferRate, SpeedUnit unit) {
          // setState(() {
          //   downloadRate = transferRate;
          //   protectGauge(downloadRate);
          //   unitText = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
          //   downloadProgress = '100';
          //   displayPer = 100.0;
          // });
          downloadRate.value = transferRate;
          protectGauge(downloadRate.value);
          unitText.value = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
          downloadProgress.value = '100';
          displayPer.value = 100.0;

          internetSpeedTest.startUploadTesting(
            onDone: (double transferRate, SpeedUnit unit) {
              uploadRate.value = transferRate;
              uploadRate.value = uploadRate * 10;
              protectGauge(uploadRate.value);
              unitText.value = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
              uploadProgress.value = '100';
              displayPer.value = 100.0;
              isTesting.value = false;
              // Display speed test results

              
              // Alert(
              //   context: context,
              //   style: alertStyle,
              //   type: AlertType.info,
              //   title: "TEST RESULTS",
              //   desc: 'Download Speed: ' +
              //       downloadRate.toStringAsFixed(2) +
              //       ' $unitText\nUpload Speed: ' +
              //       uploadRate.toStringAsFixed(2) +
              //       ' $unitText',
              //   buttons: [
              //     DialogButton(
              //       child: Text(
              //         "OK",
              //         style: TextStyle(color: Colors.white, fontSize: 20),
              //       ),
              //       onPressed: () => Navigator.pop(context),
              //       color: Color.fromRGBO(114, 137, 218, 1.0),
              //       radius: BorderRadius.circular(0.0),
              //     ),
              //   ],
              // ).show();
            },
            onProgress: (double percent, double transferRate, SpeedUnit unit) {
              // setState(() {
              //   uploadRate = transferRate;
              //   uploadRate = uploadRate * 10;
              //   protectGauge(uploadRate);
              //   unitText = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
              //   uploadProgress = percent.toStringAsFixed(2);
              //   displayPer = percent;
              // });

              uploadRate.value = transferRate;
              uploadRate.value = uploadRate.value * 10;
              protectGauge(uploadRate.value);
              unitText.value = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
              uploadProgress.value = percent.toStringAsFixed(2);
              displayPer.value = percent;
            },
            onError: (String errorMessage, String speedTestError) {
              showError(
                  'Upload test failed! Please check your internet connection.');

              isTesting.value = false;
            },
            testServer: uploadServer,
            fileSize: 20000000,
          );
        },
        onProgress: (double percent, double transferRate, SpeedUnit unit) {
          downloadRate.value = transferRate;
          protectGauge(downloadRate.value);
          unitText.value = unit == SpeedUnit.Kbps ? 'Kb/s' : 'Mb/s';
          downloadProgress.value = percent.toStringAsFixed(2);
          displayPer.value = percent;
        },
        onError: (String errorMessage, String speedTestError) {
          showError(
              'Download test failed! Please check your internet connection.');

          isTesting.value = false;
        },
        testServer: downloadServer,
        fileSize: 20000000,
      );
    }
  }
}
