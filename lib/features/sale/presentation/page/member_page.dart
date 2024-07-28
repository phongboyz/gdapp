import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gd/core/constants/app_colors.dart';
import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/constants/app_images.dart';
import 'package:gd/core/navigator/app_navigator.dart';
import 'package:gd/core/params/member_param.dart';
import 'package:gd/core/provider/provider.dart';
import 'package:gd/core/widgets/custom_textfield.dart';
import 'package:gd/core/widgets/loading_widget.dart';
import 'package:gd/features/sale/presentation/cubit/sale_cubit.dart';
import 'package:gd/generated/locale_keys.g.dart';
import 'package:provider/provider.dart';

class MemberPage extends StatelessWidget {
  const MemberPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    ScrollController scrollController = ScrollController();
    return Scaffold(
        body: BlocConsumer<SaleCubit, SaleState>(listener: (context, state) {
      if (state.status == DataStatus.failure) {
        print(state.error.toString());
        // Fluttertoast.showToast(msg: state.error ?? '');
      }
      if (state.status == DataStatus.success) {}
    }, builder: (context, state) {
      if (state.status == DataStatus.loading) {
        return const LoadingDocsWidgetNoteBody();
      }
      if (state.status == DataStatus.failure) {
        return Text(state.error.toString());
      }
      return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
            appBar: AppBar(
              leading: BackButton(
                color: Colors.black,
                onPressed: () => AppNavigator.goBack(),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Text(
                LocaleKeys.kCustomer.tr(),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            body: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          // width: 200,
                          child: CustomTextField(
                            onSummit: (value) {
                              context
                                  .read<SaleCubit>()
                                  .getMember(searchController.text);
                              return null;
                            },
                            controller: searchController,
                            color: AppColors.whiteGreyColor,
                            name: "search",
                            icon: AppImages.search,
                            // controller: ,
                            textInputAction: TextInputAction.search,
                            hintText: LocaleKeys.kSearch.tr(),
                          ),
                        ),
                        const SizedBox(width: 5),
                        SizedBox(
                          width: 80,
                          child: ElevatedButton(
                            onPressed: () async {
                              context
                                  .read<SaleCubit>()
                                  .getMember(searchController.text);
                            },
                            child: Text(
                              LocaleKeys.kSearch.tr(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  BlocConsumer<SaleCubit, SaleState>(
                      listener: (context, state) {
                    if (state.status == DataStatus.failure) {
                      print(state.error.toString());
                      // Fluttertoast.showToast(msg: state.error ?? '');
                    }
                    if (state.status == DataStatus.success) {}
                  }, builder: (context, state) {
                    if (state.status == DataStatus.loading) {
                      return const LoadingDocsWidgetNoteBody();
                    }
                    if (state.status == DataStatus.failure) {
                      return Text(state.error.toString());
                    }
                    return ListView.builder(
                        controller: scrollController,
                        shrinkWrap: true,
                        itemCount: state.member?.data?.length,
                        // itemCount: 3,
                        itemBuilder: (context, index) {
                          var data = state.member?.data?[index];
                          return Card(
                            child: Container(
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Stack(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 100,
                                          color: Colors.grey[200],
                                          child: const Icon(
                                            Icons.person_add,
                                            color: AppColors.primaryColor,
                                            size: 80,
                                          ),
                                          // child: Image.network(img.toString()),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Wrap(children: [
                                              Text(
                                                data?.name ?? '',
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontSize: 16),
                                              ),
                                            ]),
                                            Text(
                                              '${data?.contact_id ?? 0}',
                                              style: const TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 16),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: 5,
                                      child: GestureDetector(
                                        onTap: () async {
                                          MemberParams memberParams =
                                              MemberParams(
                                            members: true,
                                            name: data?.name,
                                            contactId: data?.id.toString(),
                                          );
                                          final prefUser =
                                              Provider.of<DataProvider>(context,
                                                  listen: false);
                                          prefUser
                                              .changeMemberParams(memberParams);
                                          AppNavigator.goBack();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: AppColors.primaryColor),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Text(
                                              LocaleKeys.kAddCustomer.tr(),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }),
                ],
              ),
            )),
      );
    }));
  }
}
