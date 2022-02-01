import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:king_vpn/app/components/speedLabels.dart';
import 'package:king_vpn/app/helper/constants/palette.dart';
import 'package:king_vpn/app/helper/constants/btnStyle.dart';
import 'package:king_vpn/app/modules/speed/controllers/speed_controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SpeedViewFixed extends GetView<SpeedController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Speed test"),
      ),
      body: Center(
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
                height: 20,
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
              SfRadialGauge(
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
                    maximum: 150,
                    axisLabelStyle: GaugeTextStyle(
                      color: Colors.orange, // will change
                    ),
                    ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 0,
                          endValue: 50,
                          color: gaugeRange1,
                          startWidth: 10,
                          endWidth: 10),
                      GaugeRange(
                          startValue: 50,
                          endValue: 100,
                          color: gaugeRange2,
                          startWidth: 10,
                          endWidth: 10),
                      GaugeRange(
                          startValue: 100,
                          endValue: 150,
                          color: gaugeRange1,
                          startWidth: 10,
                          endWidth: 10)
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
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: txtCol,
                              ),
                            ),
                          ),
                          angle: 90,
                          positionFactor: 0.5)
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: ButtonInk(
                      buttonName: "Test",
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
    );
  }
}
