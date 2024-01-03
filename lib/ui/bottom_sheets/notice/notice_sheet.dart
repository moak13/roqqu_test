import 'package:flutter/material.dart';
import 'package:sisyphus/ui/widgets/common/primary_button/primary_button.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'notice_sheet_model.dart';
import 'widgets/content_holder.dart';
import 'widgets/custom_pill.dart';
import 'widgets/custom_pill_bar.dart';
import 'widgets/custom_tab.dart';
import 'widgets/custom_tab_bar.dart';
import 'widgets/gradient_button.dart';
import 'widgets/stats.dart';

class NoticeSheet extends StackedView<NoticeSheetModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const NoticeSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NoticeSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      height: 650,
      padding: const EdgeInsets.symmetric(
        horizontal: 34,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        color: viewModel.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTabBar(
            backgroundColor: viewModel.tabBarBackgroundColor,
            currentIndex: viewModel.tabIndex,
            setIndex: viewModel.setTabIndex,
            tabs: [
              CustomTab(
                backgroundColor: viewModel.tabBackgroundColor,
                textColor: viewModel.textColor,
                text: 'Buy',
              ),
              CustomTab(
                backgroundColor: viewModel.tabBackgroundColor,
                textColor: viewModel.textColor,
                text: 'Sell',
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          CustomPillBar(
            currentIndex: viewModel.pillIndex,
            setIndex: viewModel.setPillIndex,
            pills: [
              CustomPill(
                backgroundColor: viewModel.pillBackgroundColor,
                textColor: viewModel.textColor,
                text: 'Limit',
              ),
              CustomPill(
                backgroundColor: viewModel.pillBackgroundColor,
                textColor: viewModel.textColor,
                text: 'Market',
              ),
              CustomPill(
                backgroundColor: viewModel.pillBackgroundColor,
                textColor: viewModel.textColor,
                text: 'Stop-Limit',
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          ContentHolder(
            leadingText: 'Limit price',
            trailingText: '0.00 USD',
            contentColor: viewModel.contentColor,
            borderColor: viewModel.contentBorderColor,
          ),
          const SizedBox(
            height: 16,
          ),
          ContentHolder(
            leadingText: 'Amount',
            trailingText: '0.00 USD',
            contentColor: viewModel.contentColor,
            borderColor: viewModel.contentBorderColor,
          ),
          const SizedBox(
            height: 16,
          ),
          ContentHolder(
            leadingText: 'Type',
            trailingText: 'Good till cancelled',
            showIcon: true,
            contentColor: viewModel.contentColor,
            borderColor: viewModel.contentBorderColor,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox.adaptive(
                value: viewModel.isChecked,
                onChanged: viewModel.toggleCheck,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Post Only',
                style: TextStyle(
                  color: viewModel.contentColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(
                Icons.info_outline,
                color: viewModel.contentColor,
                size: 12,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  color: viewModel.contentColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '0.00',
                style: TextStyle(
                  color: viewModel.contentColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          GradientButton(
            buttonText: 'Buy BTC',
            onTap: viewModel.buyBtc,
          ),
          const SizedBox(
            height: 5,
          ),
          Divider(
            color: viewModel.dividerColor,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stats(
                title: 'Total account value',
                titleColor: viewModel.contentColor,
                discription: '0.00',
                discriptionColor: viewModel.textColor,
              ),
              Stats(
                title: 'NGN',
                titleColor: viewModel.contentColor,
                discription: '',
                showIcon: true,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stats(
                title: 'Open Orders',
                titleColor: viewModel.contentColor,
                discription: '0.00',
                discriptionColor: viewModel.textColor,
              ),
              Stats(
                title: 'Available',
                titleColor: viewModel.contentColor,
                discription: '0.00',
                discriptionColor: viewModel.textColor,
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          PrimaryButton(
            buttonText: 'Deposit',
            width: 80,
            backgroundColor: const Color(0xff2764FF),
            onTap: viewModel.deposit,
          ),
        ],
      ),
    );
  }

  @override
  NoticeSheetModel viewModelBuilder(BuildContext context) => NoticeSheetModel();
}
