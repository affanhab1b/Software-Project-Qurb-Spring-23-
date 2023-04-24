import 'package:flutter/material.dart';
import 'package:testing/screens/add_post_screen.dart';
import 'package:testing/screens/feed_screen.dart';
import 'package:testing/screens/profile_screen.dart';
import 'package:testing/screens/search_screen.dart';

const webScreenSize = 600;

const homeScreenItems = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  Text('notif'),
  ProfileScreen(),
];
