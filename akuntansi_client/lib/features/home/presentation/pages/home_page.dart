import 'package:akuntansi_client/core/utils/colors.dart';
import 'package:akuntansi_client/core/utils/injection.dart';
import 'package:akuntansi_client/features/dashboard/presentation/widgets/transaction_form.dart';
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
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          content: SingleChildScrollView(
                            child: Stack(
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: FormTransaction(),
                                ),
                                Positioned(
                                  right: 0.0,
                                  child: IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ));
                    },
                  );
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
