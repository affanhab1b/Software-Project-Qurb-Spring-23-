import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testing/screens/posting.dart';
import 'package:testing/screens/postfeed.dart';
import 'package:testing/screens/userprofile.dart';
import 'package:testing/screens/usersearch.dart';

const webScreenSize = 600;

const homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const ProfileScreen(),
];
