import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veterinario/widget/custom_search_widget.dart';
import 'package:veterinario/widget/custom_see_details_widget.dart';
import '../controller/filter_controller.dart';
import '../controller/scheduling_controller.dart';
import '../widget/custom_app_bar_widget.dart';
import '../widget/custom_list_item_widget.dart';
import '../widget/custom_nav_bar_widget.dart';
import '../widget/custom_select_search_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer2<FilterController, SchedulingController>(
      builder: (context, filterController, schedulingController, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 12,
              ),
              child: CustomAppBarWidget(controller: schedulingController),
            ),
          ),
          body: Container(
            color: Colors.white,
            child: Column(
              children: [
                const CustomSeeDetailsWidget(),
                CustomSearchWidget(
                  onSearch: filterController.onSearch,
                ),
                CustomSelectSearchWidget(
                  onSelectedSpecialty: filterController.onSelectedSpecialty,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filterController.displayedVeterinarians.length,
                    itemBuilder: (context, index) {
                      return CustomListItemWidget(
                        veterinarian:
                            filterController.displayedVeterinarians[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: const CustomNavBarWidget(),
        );
      },
    );
  }
}
