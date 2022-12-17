import 'dart:developer';

import 'package:elice_mobile_team_pa/common/layout/screen_layout.dart';
import 'package:elice_mobile_team_pa/common/style/app_colors.dart';
import 'package:elice_mobile_team_pa/common/style/app_text_styles.dart';
import 'package:elice_mobile_team_pa/support/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final _mobileScannerController = MobileScannerController();

  static const QR_SCANNER_INFO = "QR 코드를 인식해주세요";

  Future<void> onDetect(Barcode barcode) async {
    bool isBase64 = StringValidator.isBase64(barcode.rawValue);
    log(barcode.rawValue.toString());
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      body: Container(
        color: AppColors.black,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                  border: Border.all(
                width: 2,
                color: AppColors.yellow,
              )),
              child: MobileScanner(
                fit: BoxFit.cover,
                controller: _mobileScannerController,
                onDetect: (barcode, args) => onDetect(barcode),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              QR_SCANNER_INFO,
              style: AppTextStyle.head3.copyWith(color: AppColors.yellow),
            ),
          ],
        ),
      ),
    );
  }
}
