import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/providers/user_provider.dart';
import 'package:testing/utils/global_variables.dart';

class RealTimeLayout extends StatefulWidget {
  final Widget mobileScreenLayout;
  const RealTimeLayout({
    Key? key,
    required this.mobileScreenLayout,
  }) : super(key: key);

  @override
  State<RealTimeLayout> createState() => _RealTimeLayoutState();
}

class _RealTimeLayoutState extends State<RealTimeLayout> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return widget.mobileScreenLayout;
      },
    );
  }
}
