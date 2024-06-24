import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestate/provider/user_provider.dart';
import 'package:realestate/user/widgets/propertyWishlist.dart';

class Wishlist extends StatefulWidget {
  static const routeName = '/wishlist';
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var propertyWishlist = context.watch<UserProvider>().users.ratings!.length;
    print(propertyWishlist);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('My Wishlist'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade300,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: propertyWishlist == null?Center(
          child: CircularProgressIndicator(),
        ) :ListView.builder(
            itemCount: propertyWishlist,
            itemBuilder: (context, index) {
              return PropertiesWishlist(index: index);
            }),
      ),
    );
  }
}
