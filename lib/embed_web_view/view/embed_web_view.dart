import 'package:elice_mobile_team_pa/common/common.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EmbedWebView extends StatefulWidget {
  const EmbedWebView({
    super.key,
    required this.url,
  });

  final String? url;

  @override
  State<EmbedWebView> createState() => _EmbedWebViewState();
}

class _EmbedWebViewState extends State<EmbedWebView> {
  late final WebViewController _webViewController;

  String get url => widget.url ?? WEB_VIEW_BASE_URL;

  static const APP_BAR_TITLE = "Elice Web";
  static const WEB_VIEW_BASE_URL = "https://academy.elice.io/explore";

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    _webViewController = WebViewController()..loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      appBar: const GlobalAppBar(
        color: AppColors.black,
        title: Text(APP_BAR_TITLE, style: AppTextStyle.head2),
      ),
      body: WebViewWidget(
        controller: _webViewController,
      ),
    );
  }
}
