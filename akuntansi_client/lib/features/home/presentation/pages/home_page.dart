import 'package:akuntansi_client/core/utils/colors.dart';
import 'package:akuntansi_client/core/utils/injection.dart';
import 'package:akuntansi_client/features/home/presentation/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => locator<HomeProvider>(),
        child: Consumer<HomeProvider>(
          builder: (context, provider, _) {
            return Scaffold(
              body: provider.currentPage,
              bottomNavigationBar: BottomAppBar(
                shape: const CircularNotchedRectangle(),
                notchMargin: 6.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.home),
                      color: provider.currentIndex == 0 ? primaryDarkColor : Colors.grey,
                      onPressed: () {
                        provider.changePage(0);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.person),
                      color: provider.currentIndex == 1 ? primaryDarkColor : Colors.grey,
                      onPressed: () {
                        provider.changePage(1);
                      },
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: primaryDarkColor,
                onPressed: () {
                  provider.changePage(1);
                },
                tooltip: 'Add',
                child: const Icon(Icons.add),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            );
          },
        ));
  }
}
