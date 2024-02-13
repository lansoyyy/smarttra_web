import 'package:flutter/material.dart';
import 'package:smarttra_web/screens/tab/updates_tab.dart';
import 'package:smarttra_web/screens/tab/users_tab.dart';
import 'package:smarttra_web/screens/tab/vehicles_tab.dart';
import 'package:smarttra_web/widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool invehicles = true;
  bool inupdates = false;

  bool inuser = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Card(
              child: SizedBox(
                width: 300,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/train 2.png',
                          width: 100,
                        ),
                        TextWidget(
                          fontFamily: 'Bold',
                          text: 'Smarttra',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          invehicles = true;
                          inupdates = false;
                          inuser = false;
                        });
                      },
                      leading: Icon(
                        Icons.bus_alert_sharp,
                        color: invehicles ? Colors.black : Colors.grey,
                      ),
                      title: TextWidget(
                        text: 'Vehicles',
                        fontSize: 18,
                        color: invehicles ? Colors.black : Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          invehicles = false;
                          inupdates = true;
                          inuser = false;
                        });
                      },
                      leading: Icon(
                        Icons.report,
                        color: inupdates ? Colors.black : Colors.grey,
                      ),
                      title: TextWidget(
                        text: 'Updates',
                        fontSize: 18,
                        color: inupdates ? Colors.black : Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      onTap: () {
                        setState(() {
                          invehicles = false;
                          inupdates = false;
                          inuser = true;
                        });
                      },
                      leading: Icon(
                        Icons.account_circle,
                        color: inuser ? Colors.black : Colors.grey,
                      ),
                      title: TextWidget(
                        text: 'User Management',
                        fontSize: 18,
                        color: inuser ? Colors.black : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            invehicles
                ? const VehiclesTab()
                : inuser
                    ? const AddUserTab()
                    : const UpdatesTab()
          ],
        ),
      ),
    );
  }
}
