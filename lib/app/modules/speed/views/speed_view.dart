import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:king_vpn/app/components/speedLabels.dart';
import 'package:king_vpn/app/helper/constants/font_size.dart';
import 'package:king_vpn/app/helper/constants/palette.dart';
import 'package:king_vpn/app/helper/constants/btnStyle.dart';
import 'package:king_vpn/app/helper/strings/strings.dart';
import 'package:king_vpn/app/modules/speed/controllers/speed_controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SpeedView extends GetView<SpeedController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Speed test"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: controller.progressBar.showBar(
                        controller.displayPer.value,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppFontSize.midiumSizedBoxHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShowLabel(
                      label: "Download",
                      speed: controller.downloadRate.value,
                      unit: controller.unitText.value,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShowLabel(
                      label: "Upload",
                      speed: controller.uploadRate.value,
                      unit: controller.unitText.value,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: SfRadialGauge(
                    title: GaugeTitle(
                      text: ' ',
                      textStyle: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 0,
                        maximum: 50,
                        axisLabelStyle: GaugeTextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary, // will change
                        ),
                        ranges: <GaugeRange>[
                          GaugeRange(
                            startValue: 0,
                            endValue: 15,
                            color: gaugeRange1,
                            startWidth: 10,
                            endWidth: 10,
                          ),
                          GaugeRange(
                            startValue: 15,
                            endValue: 35,
                            color: gaugeRange2,
                            startWidth: 10,
                            endWidth: 10,
                          ),
                          GaugeRange(
                            startValue: 35,
                            endValue: 50,
                            color: gaugeRange1,
                            startWidth: 10,
                            endWidth: 10,
                          )
                        ],
                        pointers: <GaugePointer>[
                          NeedlePointer(
                            value: controller.displayRate,
                            enableAnimation: true,
                            needleColor: needleCol,
                          )
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                              widget: Container(
                                child: Text(
                                  controller.displayRate.toStringAsFixed(2) +
                                      ' ' +
                                      controller.unitText.value,
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
                              angle: 90,
                              positionFactor: 0.5)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: AppFontSize.midiumSizedBoxHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: ButtonInk(
                        buttonName: AppString.speedTestButton,
                      ),
                      onPressed: () {
                        controller.speedTest();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
