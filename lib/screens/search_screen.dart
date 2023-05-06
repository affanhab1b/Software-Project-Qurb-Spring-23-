import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testing/utils/colors.dart';

import '../widgets/text_field_input.dart';

// extending search screen
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

//extending
class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isShowUsers = false;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SvgPicture.asset(
              'assets/Applogo.svg',
              color: Colors.white,
              height: 32,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: SizedBox(
            height: 48.0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: searchController,
                decoration: const InputDecoration(
                  labelText: 'Search for a user',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                  prefixIcon: Icon(Icons.search),
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 24,
                    minHeight: 24,
                  ),
                ),
                onFieldSubmitted: (String _) {
                  setState(() {
                    isShowUsers = true;
                  });
                },
              ),
            ),
          ),
        ),
      ),

      // appBar: AppBar(
      //   backgroundColor: mobileBackgroundColor,
      //   title: TextFormField(
      //     controller: searchController,
      //     decoration: const InputDecoration(labelText: 'Search for a user'),
      //     onFieldSubmitted: (String _) {
      //       setState(() {
      //         isShowUsers = true;
      //       });
      //     },
      //   ),
      // ),

      body: isShowUsers
          ? FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .where(
                    'username',
                    isGreaterThanOrEqualTo: searchController.text,
                  )
                  .get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.builder(
                  itemCount: (snapshot.data! as dynamic).docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            (snapshot.data! as dynamic).docs[index]
                                ['photoUrl']),
                      ),
                      title: Text(
                          (snapshot.data! as dynamic).docs[index]['username']),
                    );
                  },
                );
              },
            )
          : Text(''),
    );
  }
}
