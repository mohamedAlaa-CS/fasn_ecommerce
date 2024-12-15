import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/core/widgets/app_text_form.dart';
import 'package:fasn_ecommerce/features/home/presentaion/widgets/product_widget.dart';
import 'package:fasn_ecommerce/features/search_page/data/repos/search_repo_imple.dart';
import 'package:fasn_ecommerce/features/search_page/presentation/manager/cubit/search_cubit.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return BlocProvider(
      create: (context) => SearchCubit(SerachRepoImple()),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          var searchCubit = SearchCubit.get(context);
          return Column(
            children: [
              10.hSize,
              MainTextField(
                onChanged: (value) async {
                  await searchCubit.getSearchedList(text: value);
                },
                textStyle: AppStyles.style16,
                prefixIcon: Icons.search,
                hintText: S.of(context).search_Now,
                hintStyle:
                    AppStyles.style18.copyWith(color: AppColors.borderColor),
                fillColor: AppColors.violateColor,
              ),
              20.hSize,
              Expanded(
                child: (state is SearchLoading &&
                        searchCubit.searcheList.isEmpty)
                    ? const Center(child: CircularProgressIndicator())
                    : (searchCubit.searcheList.isEmpty || state is SearchStop)
                        ? Center(
                            child: Text(
                            S.of(context).not_found_result,
                            style: AppStyles.style28,
                          ))
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio:
                                  isPortrait ? (1 / 1.7) : (1 / 1.25),
                            ),
                            itemBuilder: (context, index) => ProductWidget(
                              product: searchCubit.searcheList[index],
                            ),
                            itemCount: searchCubit.searcheList.length,
                          ),
              ),
            ],
          );
        },
      ),
    );
  }
}
