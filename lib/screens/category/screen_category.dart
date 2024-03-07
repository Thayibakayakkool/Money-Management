import 'package:flutter/material.dart';
import 'package:money_management/db/category/category_db.dart';
import 'package:money_management/screens/category/expense_category_list.dart';
import 'package:money_management/screens/category/income_category_list.dart';

class ScreenCategroy extends StatefulWidget {
  const ScreenCategroy({super.key});

  @override
  State<ScreenCategroy> createState() => _ScreenCategroyState();
}

class _ScreenCategroyState extends State<ScreenCategroy>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    CategoryDB().refreshUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.pink[900],
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: const [
            Tab(
              text: 'INCOME',
            ),
            Tab(
              text: 'EXPENSE',
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              IncomeCategoryList(),
              ExpenseCategoryList(),
            ],
          ),
        ),
      ],
    );
  }
}
