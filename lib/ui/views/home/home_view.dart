import 'package:flutter/material.dart';
import 'package:sisyphus/ui/common/app_strings.dart';
import 'package:sisyphus/ui/widgets/common/primary_button/primary_button.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';
import 'widgets/custom_home_tab.dart';
import 'widgets/custom_home_tab_bar.dart';
import 'widgets/get_index_fixed_tab_view.dart';
import 'widgets/get_index_sliding_tab_view.dart';
import 'widgets/rating_stats.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Builder(
            builder: (context) {
              if (viewModel.isDarkMode) {
                return Image.asset(
                  AppStrings.lightLogo,
                );
              }

              return Image.asset(
                AppStrings.darkLogo,
              );
            },
          ),
        ),
        leadingWidth: 121,
        actions: [
          IconButton(
            onPressed: viewModel.onProfileTap,
            tooltip: 'Profile',
            icon: Image.asset(
              AppStrings.profileImage,
              height: 32,
              width: 32,
            ),
          ),
          IconButton(
            onPressed: viewModel.onGlobeTap,
            tooltip: 'Globe',
            icon: Image.asset(
              AppStrings.globe,
              height: 32,
              width: 32,
            ),
          ),
          PopupMenuButton(
            offset: const Offset(0.0, 45),
            padding: EdgeInsets.zero,
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            itemBuilder: (context) => [
              ...viewModel.popUpMenuItems.entries.map(
                (entry) => PopupMenuItem(
                  value: entry.key,
                  onTap: () {},
                  child: Text(
                    entry.value,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            ],
            icon: Image.asset(
              AppStrings.menu,
              height: 32,
              width: 32,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  color: viewModel.cardBackgroundColor,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              AppStrings.cryptoIcons,
                              height: 24,
                              width: 44,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'BTC/USDT',
                              style: TextStyle(
                                color: viewModel.textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            RotatedBox(
                              quarterTurns: 1,
                              child: Icon(
                                Icons.chevron_right,
                                color: viewModel.textColor,
                                size: 17,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              '\$20,634',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(
                            left: 16,
                          ),
                          itemBuilder: (context, index) {
                            final rating = viewModel.ratings.elementAt(index);
                            return RatingStats(
                              rating: rating,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Row(
                              children: [
                                const SizedBox(
                                  width: 3,
                                ),
                                VerticalDivider(
                                  color: viewModel.dividerColor,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                              ],
                            );
                          },
                          itemCount: viewModel.ratings.length,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  color: viewModel.cardBackgroundColor,
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      CustomHomeTabBar(
                        backgroundColor: viewModel.tabBarBackgroundColor,
                        currentIndex: viewModel.fixedTabIndex,
                        setIndex: viewModel.setFixedTabIndex,
                        tabs: [
                          CustomHomeTab(
                            text: 'Charts',
                            backgroundColor: viewModel.tabBackgroundColor,
                          ),
                          CustomHomeTab(
                            text: 'Orderbook',
                            backgroundColor: viewModel.tabBackgroundColor,
                          ),
                          CustomHomeTab(
                            text: 'Recent trades',
                            backgroundColor: viewModel.tabBackgroundColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 250,
                        child: GetIndexFixedTabView(
                          index: viewModel.fixedTabIndex,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  color: viewModel.cardBackgroundColor,
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      CustomHomeTabBar(
                        backgroundColor: viewModel.tabBarBackgroundColor,
                        currentIndex: viewModel.scrollingTabIndex,
                        setIndex: viewModel.setScrollingTabIndex,
                        isSliding: true,
                        tabs: [
                          CustomHomeTab(
                            text: 'Open Orders',
                            backgroundColor: viewModel.tabBackgroundColor,
                          ),
                          CustomHomeTab(
                            text: 'Positions',
                            backgroundColor: viewModel.tabBackgroundColor,
                          ),
                          CustomHomeTab(
                            text: 'Order History',
                            backgroundColor: viewModel.tabBackgroundColor,
                          ),
                          CustomHomeTab(
                            text: 'Trade History',
                            backgroundColor: viewModel.tabBackgroundColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 200,
                        child: GetIndexSlidingTabView(
                          index: viewModel.scrollingTabIndex,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PrimaryButton(
                  buttonText: 'Buy',
                  width: 171,
                  backgroundColor: const Color(0xff25C26E),
                  onTap: viewModel.showBottomSheet,
                ),
                PrimaryButton(
                  buttonText: 'Sell',
                  width: 171,
                  backgroundColor: const Color(0xffFF554A),
                  onTap: viewModel.showBottomSheet,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
