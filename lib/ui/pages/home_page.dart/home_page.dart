import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wrestling_timer/resources/images_constants.dart';

enum HomePageFields {
  work,
  rest,
  rounds,
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                onPressed: () {},
                child: const Icon(
                  Icons.play_arrow,
                  size: 80,
                  // TODO: Change color like on LOGO.
                  color: Colors.blue,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderField(
                    name: HomePageFields.work.name,
                    builder: (FormFieldState<dynamic> state) {
                      return InputDecorator(
                        isEmpty: true,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.play_arrow_outlined),
                            labelText: 'Work',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderField(
                    name: HomePageFields.work.name,
                    builder: (FormFieldState<dynamic> state) {
                      return InputDecorator(
                        isEmpty: true,
                        decoration: InputDecoration(
                            labelText: 'Rest',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderField(
                    name: HomePageFields.work.name,
                    builder: (FormFieldState<dynamic> state) {
                      return InputDecorator(
                        isEmpty: true,
                        decoration: InputDecoration(
                            labelText: 'Rounds',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
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
