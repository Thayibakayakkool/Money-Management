import 'package:flutter/material.dart';
import 'package:money_management/screens/add_transactions/screen_add_transaction.dart';
import 'package:money_management/screens/category/category_add_popup.dart';
import 'package:money_management/screens/category/screen_category.dart';
import 'package:money_management/screens/home/widgets/bottom_navigation.dart';
import 'package:money_management/screens/transactions/screen_transactions.dart';

class ScreenHome extends StatelessWidget {
   ScreenHome({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = const [
    ScreenTransactions(),
    ScreenCategroy(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'MONEY MANAGER',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink[900],
      ),
      bottomNavigationBar: const MoneyManagerBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, int updateIndex, Widget? _) {
            return _pages[updateIndex];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            print('Add Transactions');
            Navigator.of(context).pushNamed(ScreenAddTransaction.routeName);
          } else {
            print('Add Category');

            showCategoryAddPopup(context);

            // final _sample = CategoryModel(
            //   id: DateTime.now().millisecondsSinceEpoch.toString(),
            //   name: 'Travel',
            //   type: CategoryType.expense,
            // );

            // CategoryDB().insrtCategory(_sample);
          }
        },
        child: const Icon(
          Icons.add,
        ),
        backgroundColor: Colors.pink[900],
        foregroundColor: Colors.white,
        shape: CircleBorder(),
      ),
    );
  }
}
