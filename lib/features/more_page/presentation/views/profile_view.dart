import 'package:cached_network_image/cached_network_image.dart';
import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/core/widgets/app_text_form.dart';
import 'package:fasn_ecommerce/core/widgets/main_buttom.dart';
import 'package:fasn_ecommerce/features/more_page/data/repos/profile_repo_imple.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:fasn_ecommerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  static const String routeName = 'profile_view';
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(ProfilRepoImple()),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          var profileCubit = ProfileCubit.get(context);
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: SafeArea(
                child: Padding(
              padding: 14.aEdge,
              child: Expanded(
                child: profileCubit.usermodel == null
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //? head of page ================
                            Row(
                              children: [
                                // ? back button ================
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: AppColors.white,
                                    size: 28,
                                  ),
                                ),
                                20.wSize,
                                Text(
                                  'User Profile',
                                  style: AppStyles.style24,
                                ),
                              ],
                            ),

                            20.hSize,

                            // ? profile image ================
                            Row(
                              children: [
                                Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: CachedNetworkImage(
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                        imageUrl: profileCubit
                                                .usermodel?.data?.image ??
                                            '',
                                        //  'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
                                        placeholder: (context, url) =>
                                            const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await profileCubit.setImage(context);
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.white,
                                          ),
                                          child: const Icon(
                                            Icons.camera_alt_rounded,
                                            size: 20,
                                            color: AppColors.blue,
                                          )),
                                    ),
                                  ],
                                ),
                                20.wSize,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        profileCubit.usermodel?.data?.name ??
                                            '',
                                        style: AppStyles.style20,
                                      ),
                                      7.hSize,
                                      Text(
                                        profileCubit.usermodel?.data?.email ??
                                            '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppStyles.style20.copyWith(
                                          color: AppColors.borderColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            //? user info ====================
                            20.hSize,
                            MainTextField(
                              controller: profileCubit.nameController,
                              prefixIcon: Icons.person_3_sharp,
                              textStyle: AppStyles.style18,
                              fillColor: AppColors.borderColor,
                              title: S.of(context).user_name,
                              // intialValue:
                              //     profileCubit.usermodel?.data?.name ?? '',
                              readOnly: !profileCubit.isUpdated,
                              suffixWidget: const Icon(
                                Icons.edit_note,
                                color: AppColors.white,
                              ),
                              suffixPressed: () {
                                profileCubit.changeIsUpdated();
                              },
                            ),
                            10.hSize,
                            MainTextField(
                              controller: profileCubit.emailController,
                              prefixIcon: Icons.email,
                              textStyle: AppStyles.style18,
                              fillColor: AppColors.borderColor,
                              title: S.of(context).email_address,
                              // intialValue:
                              //     profileCubit.usermodel?.data?.email ?? '',
                              readOnly: !profileCubit.isUpdated,
                              suffixWidget: const Icon(
                                Icons.edit_note,
                                color: AppColors.white,
                              ),
                              suffixPressed: () {
                                profileCubit.changeIsUpdated();
                              },
                            ),
                            10.hSize,
                            MainTextField(
                              controller: profileCubit.phoneController,
                              prefixIcon: Icons.phone,
                              textStyle: AppStyles.style18,
                              fillColor: AppColors.borderColor,
                              title: S.of(context).mobile_number,
                              // intialValue:
                              //     profileCubit.usermodel?.data?.phone ?? '',
                              readOnly: !profileCubit.isUpdated,
                              suffixWidget: const Icon(
                                Icons.edit_note,
                                color: AppColors.white,
                              ),
                              suffixPressed: () {
                                profileCubit.changeIsUpdated();
                              },
                            ),
                            10.hSize,
                            //? edit section ====================
                            if (profileCubit.isUpdated) ...{
                              MainTextField(
                                controller: profileCubit.passwordController,
                                prefixIcon: Icons.password_outlined,
                                hintText: S.of(context).enter_your_password,
                                hintStyle: AppStyles.style16,
                                textStyle: AppStyles.style18,
                                fillColor: AppColors.borderColor,
                                title: S.of(context).enter_your_password,
                              ),
                              30.hSize,
                              if (state is! UpdateProfileLoading) ...{
                                MainButtom(
                                  text: S.of(context).save,
                                  color: Colors.blue.shade600,
                                  onPressed: () async {
                                    await profileCubit.updateProfile();
                                  },
                                )
                              } else ...{
                                Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.blue.shade600,
                                  ),
                                ),
                              },
                              15.hSize,
                              SizedBox(
                                width: double.infinity,
                                height: 45,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: 12.cBorder,
                                    ),
                                  ),
                                  onPressed: () {
                                    profileCubit.changeIsUpdated();
                                  },
                                  child: Text(
                                    S.of(context).cancel,
                                    style: AppStyles.style18
                                        .copyWith(color: AppColors.black),
                                  ),
                                ),
                              ),
                            }
                          ],
                        ),
                      ),
              ),
            )),
          );
        },
      ),
    );
  }
}
