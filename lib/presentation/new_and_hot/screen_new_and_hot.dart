import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colours/colors.dart';
import 'package:netflix_clone/core/constant.dart';
import 'package:netflix_clone/presentation/new_and_hot/widget/comming_soon_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widget/everyone_watching_widget.dart';

class HotAndNewScreen extends StatelessWidget {
  const HotAndNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: kblackColor,
            title: const Text(
              'New & Hot',
              style: TextStyle(
                  color: kwhiteColor, fontWeight: FontWeight.bold, fontSize: 30),
            ),
            actions: const [
              Icon(
                Icons.cast,
                color: kwhiteColor,
                size: 30,
              ),
              kwidth,
              Icon(
                Icons.account_box_outlined,
                color: kwhiteColor,
                size: 30,
              ),
            ],
            bottom: TabBar(
              labelColor: kblackColor,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              dividerColor: kblackColor,
              unselectedLabelColor: kwhiteColor,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelPadding: const EdgeInsets.all(14),
              indicator: BoxDecoration(
                color: kwhiteColor,
                borderRadius: kRadius10,
              ),
              tabs: const [
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    '🍟 Coming Soon',
                  ),
                ),
                Text(
                  '👀 Everyone\'s watching',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _buildComingSoon(),
              _buildEeryonesWatching(),
            ],
          )),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const ComingSoonWidget(),
    );
  }

  Widget _buildEeryonesWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const EveryonesWatchingWidget(),
    );
  }
}