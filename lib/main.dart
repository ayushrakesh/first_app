import 'package:first_app/screens/widget_screen.dart';
import 'package:first_app/selected_widgets_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SelectedWidgetsProvider(),
        )
      ],
      child: MaterialApp(
        home: MyHomePage(),
        routes: {
          WidgetsScreen.routeName: ((context) => WidgetsScreen()),
          MyHomePage.routeName: (context) => MyHomePage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Application App',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<SelectedWidgetsProvider>(
        builder: (context, selectedWidgetProvider, child) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.06,
            vertical: height * 0.02,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                height: height * 0.7,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
                child: !selectedWidgetProvider.getText &&
                        !selectedWidgetProvider.getImage &&
                        !selectedWidgetProvider.getButton
                    ? const Center(
                        child: Text(
                          'No widget is added',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                      )
                    : SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Gap(height * 0.04),
                            selectedWidgetProvider.getText
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.08,
                                      vertical: height * 0.016,
                                    ),
                                    child: const Text(
                                      'Text Widget',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                  )
                                : SizedBox(height: height * 0.1),
                            Gap(height * 0.04),
                            selectedWidgetProvider.getImage
                                ? Container(
                                    height: height * 0.2,
                                    width: width * 0.8,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.08,
                                      vertical: height * 0.016,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Image Widget',
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                      ),
                                    ),
                                  )
                                : SizedBox(height: height * 0.1),
                            Gap(height * 0.04),
                            selectedWidgetProvider.getButton
                                ? ElevatedButton(
                                    onPressed: () {
                                      if (selectedWidgetProvider.getImage ||
                                          selectedWidgetProvider.getText) {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text('Successfully Saved'),
                                          ),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: height * 0.04,
                                        vertical: height * 0.01,
                                      ),
                                      backgroundColor: Colors.grey.shade200,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: const Text(
                                      'Save',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                  )
                                : SizedBox(height: height * 0.1),
                          ],
                        ),
                      ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WidgetsScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      36,
                    ),
                  ),
                  //  side: BorderSide(style: BorderStyle.solid),
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.02,
                    horizontal: width * 0.2,
                  ),
                ),
                child: Text(
                  'Add Widgets',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
