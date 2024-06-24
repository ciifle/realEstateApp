import 'package:flutter/material.dart';
import 'package:realestate/models/user_model.dart';
import 'package:realestate/user/services/auth_services.dart';
class UsersPageAdmin extends StatefulWidget {
  static final routeName = "/users";
  const UsersPageAdmin({super.key});

  @override
  State<UsersPageAdmin> createState() => _UsersPageAdminState();
}

class _UsersPageAdminState extends State<UsersPageAdmin> {
  final AuthServices authServices = AuthServices();
  List<User> users = [];

  //get all user
  void getUsers()async{
    users = await authServices.getAllUsers(context: context);
    setState(() {

    });
  }
  @override
  void initState() {
    getUsers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Users",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child:users.isEmpty
        ? Center(child: CircularProgressIndicator())
        : RefreshIndicator(
    onRefresh: () async {
    getUsers();
    },
    child:ListView.builder(
            itemCount: users.length,
            itemBuilder: (context,index){
              var user = users[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 7),
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
            width: double.infinity,
            height: size.height * .16,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: Offset(-10, -10),
                    color: Colors.grey.withOpacity(.1),
                    spreadRadius: 1,
                    blurRadius: 10),
                BoxShadow(
                    offset: Offset(10, 10),
                    color: Colors.grey.withOpacity(.1),
                    spreadRadius: 1,
                    blurRadius: 10),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.name,style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),),
                Text(user.email,style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),),
                Text(user.isAdmin?"Admin":"User",style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),),
              ],
            ),
          );
        }),
      ),),
    );
  }
}
