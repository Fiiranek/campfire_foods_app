import 'package:cff_ap/providers/user.dart';
import 'package:cff_ap/screens/home.dart';
import 'package:cff_ap/screens/loading.dart';
import 'package:cff_ap/screens/login.dart';
import 'package:cff_ap/screens/place_order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool isLoading = true;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      // auth = Provider.of<Auth>(context, listen: false);
      final auth = Provider.of<User>(context, listen: false);
      final isUserLogged = await auth.initUser();
      isLoading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context, auth, child) {
      if (isLoading) {
        return const Loading();
      }
      if (auth.isLogged) {
        return const Home();
      }
      return const Login();
    });
  }
}
