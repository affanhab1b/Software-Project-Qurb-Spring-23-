import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testing/utils/colors.dart';
import 'package:testing/widgets/post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/Group 3.svg',
          color: primaryColor,
          height: 32,
        ),
      ),
      body: const PostCard(),
    );
  }
}
