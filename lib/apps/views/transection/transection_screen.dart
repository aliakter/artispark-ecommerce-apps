import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/views/transection/component/my_plan_card.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transactions"),
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_sharp,color: iconThemeColor,),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return MyPlanCard(/*plansBillingModel: state.planList[index],index: index,*/);
              },childCount: 3),
            ),
          )
        ],
      ),
    );
  }
}
