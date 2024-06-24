import 'package:flutter/material.dart';

class ProfileWisget extends StatelessWidget {
  final Icon trailingIcon;
  final Icon actionIcon;
  final String title;
  final void Function()? onTap;
  const ProfileWisget(
      {super.key,
      required this.trailingIcon,
      required this.actionIcon,
      this.onTap,
      required this.title});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Container(
        width: double.infinity,
        height: size.height * 0.1,
        decoration: BoxDecoration(
          color: Color.fromARGB(77, 190, 190, 190),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: ListTile(
            onTap: onTap,
            title: Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            leading: actionIcon,
            trailing: trailingIcon,
          ),
        ),
      ),
    );
  }
}
