import 'package:flutter/material.dart';
import 'package:smarttra_web/widgets/text_widget.dart';

class UpdatesTab extends StatelessWidget {
  const UpdatesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 1000,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: 'Dashboard Overview',
                fontSize: 18,
                color: Colors.black,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    child: SizedBox(
                      width: 175,
                      height: 125,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: 'All vehicles',
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                            text: '4',
                            fontSize: 50,
                            color: Colors.black,
                            fontFamily: 'Bold',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: SizedBox(
                      width: 175,
                      height: 125,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: 'On Trip',
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                            text: '4',
                            fontSize: 50,
                            color: Colors.black,
                            fontFamily: 'Bold',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: SizedBox(
                      width: 175,
                      height: 125,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: 'Idling',
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                            text: '4',
                            fontSize: 50,
                            color: Colors.black,
                            fontFamily: 'Bold',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: SizedBox(
                      width: 175,
                      height: 125,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: 'Parking',
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                            text: '4',
                            fontSize: 50,
                            color: Colors.black,
                            fontFamily: 'Bold',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 480,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: const Icon(
                          Icons.account_circle,
                          size: 50,
                        ),
                        title: SizedBox(
                            width: 300,
                            child: Row(
                              children: [
                                TextWidget(
                                  text: 'Name',
                                  fontSize: 18,
                                  fontFamily: 'Bold',
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                TextWidget(
                                  text: '# of passengers: 20',
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ],
                            )),
                        trailing: TextWidget(
                          text: 'Assigned',
                          fontSize: 14,
                          color: Colors.green,
                          fontFamily: 'Bold',
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
