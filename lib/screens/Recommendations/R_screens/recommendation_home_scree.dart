import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:olx_server/constants/variables.dart';

class RecommendationHomeScreen extends StatelessWidget {
  const RecommendationHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Provide the [TabController]
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SegmentedTabControl(
                    // Customization of widget
                    radius: const Radius.circular(3),
                    backgroundColor: Theme.of(context).unselectedWidgetColor,
                    indicatorColor: Theme.of(context).indicatorColor,
                    tabTextColor: Colors.black45,
                    selectedTabTextColor: Colors.white,
                    squeezeIntensity: 2,

                    height: 45,
                    tabPadding: const EdgeInsets.symmetric(horizontal: 8),
                    textStyle: Theme.of(context).textTheme.bodyText1,
                    // Options for selection
                    // All specified values will override the [SegmentedTabControl] setting
                    tabs: [
                      SegmentTab(
                        label: 'ACCOUNT',
                        // For example, this overrides [indicatorColor] from [SegmentedTabControl]
                        color: Colors.red.shade200,
                      ),
                      SegmentTab(
                        label: 'HOME',
                        backgroundColor: Colors.blue.shade100,
                        selectedTextColor: Colors.black45,
                        textColor: Colors.black26,
                      ),
                      const SegmentTab(label: 'NEW'),
                    ],
                  ),
                ),
                // Sample pages
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SampleWidget(
                        label: 'FIRST PAGE',
                        color: Colors.red.shade200,
                      ),
                      SampleWidget(
                        label: 'SECOND PAGE',
                        color: Colors.blue.shade100,
                      ),
                      SampleWidget(
                        label: 'THIRD PAGE',
                        color: Colors.orange.shade200,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SampleWidget extends StatelessWidget {
  const SampleWidget({
    Key? key,
    required this.label,
    required this.color,
  }) : super(key: key);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10))),
      child: IconButton(
          onPressed: () {
            print(variables.pageIndex);
          },
          icon: const Icon(
            Icons.home,
            size: 20,
          )),
    );
  }
}
