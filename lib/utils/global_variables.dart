import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testing/screens/add_post_screen.dart';
import 'package:testing/screens/feed_screen.dart';
import 'package:testing/screens/profile_screen.dart';
import 'package:testing/screens/search_screen.dart';

const webScreenSize = 600;

const homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Text('notif'),
  // ProfileScreen(
  //   uid: FirebaseAuth.instance.currentUser!.uid,
  // ),
];
