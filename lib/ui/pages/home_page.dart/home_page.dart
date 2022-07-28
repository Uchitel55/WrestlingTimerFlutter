import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:unicons/unicons.dart';

import '../../../resources/app_constants.dart';
import '../../../resources/images_constants.dart';
import '../../../routes.dart';

enum HomePageFields {
  work,
  rest,
  rounds,
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  //TODO: Separated build methods <40 lines
  //TODO: String constants
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Colors.white,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Color(0xFF04003F)),
        elevation: 0,
      ),
      body: FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildImage(context),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.center),
                //TODO: Navigate to timer page
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.timer);
                },
                child: const Icon(
                  Icons.play_arrow_rounded,
                  size: 60,
                  color: Color(0xFF04003F),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderField(
                    name: HomePageFields.work.name,
                    builder: (FormFieldState<dynamic> field) {
                      return GestureDetector(
                        onTap: () {
                          //TODO: Move in reusable separate widget
                          showDialog(
                            context: context,
                            builder: (_) {
                              return const AlertDialog(
                                title: Text('Enter Time'),
                                //TODO: FormBuilderTextField
                                content: Text(''),
                              );
                            },
                          );
                        },
                        child: InputDecorator(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Row(
                            children: const [
                              Icon(UniconsLine.play_circle, size: 24),
                              SizedBox(width: 8),
                              Text(
                                AppConstants.work,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '03:00',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderField(
                    name: HomePageFields.rest.name,
                    builder: (FormFieldState<dynamic> field) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          children: const [
                            Icon(UniconsLine.pause_circle, size: 24),
                            SizedBox(width: 8),
                            Text(
                              AppConstants.rest,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '01:00',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderField(
                    name: HomePageFields.rounds.name,
                    builder: (FormFieldState<dynamic> field) {
                      return InputDecorator(
                        isEmpty: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.replay_5_rounded, size: 24),
                            SizedBox(width: 8),
                            Text(
                              AppConstants.rounds,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '2',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.3,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagesConstants.uww),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
