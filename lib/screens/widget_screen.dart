import 'package:first_app/main.dart';
import 'package:first_app/selected_widgets_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class WidgetsScreen extends StatefulWidget {
  static const routeName = 'widgets-screen';

  @override
  State<WidgetsScreen> createState() => _WidgetsScreenState();
}

class _WidgetsScreenState extends State<WidgetsScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Consumer<SelectedWidgetsProvider>(
      builder: (context, selectedWidgetProvider, child) => Scaffold(
        body: Padding(
          padding: EdgeInsets.all(height * 0.05),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(height * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (() {
                        selectedWidgetProvider.updateText();
                      }),
                      child: Container(
                        height: height * 0.03,
                        width: height * 0.03,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          shape: BoxShape.circle,
                          color: selectedWidgetProvider.getText
                              ? Colors.green
                              : Colors.white,
                        ),
                      ),
                    ),
                    Gap(height * 0.01),
                    Container(
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
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    )
                  ],
                ),
                Gap(height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (() {
                        selectedWidgetProvider.updateImage();
                      }),
                      child: Container(
                        height: height * 0.03,
                        width: height * 0.03,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green),
                          color: selectedWidgetProvider.getImage
                              ? Colors.green
                              : Colors.white,
                        ),
                      ),
                    ),
                    Gap(height * 0.01),
                    Container(
                      child: const Text(
                        'Image Widget',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
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
                    )
                  ],
                ),
                Gap(height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (() {
                        selectedWidgetProvider.updateButton();
                      }),
                      child: Container(
                        height: height * 0.03,
                        width: height * 0.03,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green),
                          color: selectedWidgetProvider.getButton
                              ? Colors.green
                              : Colors.white,
                        ),
                      ),
                    ),
                    Gap(height * 0.01),
                    Container(
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
                        'Button Widget',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                Gap(height * 0.1),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.teal.shade100,
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Import Widgets',
                    style: TextStyle(fontSize: 18, color: Colors.teal),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
