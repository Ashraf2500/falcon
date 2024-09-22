import 'package:falcon/core/core_exports.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppPadding.pVScreen2(context),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: AppPadding.pHScreen2(context)),
          child: SizedBox(
            width:AppConstants.wScreen(context),
            child: Row(
              children: [
                Icon(Icons.account_box,color: ColorManager.darkGrey.withOpacity(0.8),size: AppConstants.hScreen(context)*0.15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( 
                      "${context.read<CurrentUserBloc>().userData!.name}",
                      style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s14),
                    ),
                    Text(
                      "${context.read<CurrentUserBloc>().userData!.phone}",
                      style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s10),
                    ),
                    SizedBox(
                      width: AppConstants.wScreen(context)*0.62,
                      child: Wrap(
                        children: [
                          (context.read<CurrentUserBloc>().userData!.faculty!=null || context.read<CurrentUserBloc>().userData!.faculty !="")?Text(
                            "${context.read<CurrentUserBloc>().userData!.faculty}",
                            style: getBoldStyle(color: ColorManager.darkGrey,fontSize: FontSize.s10),
                          ):SizedBox(),
                          (context.read<CurrentUserBloc>().userData!.university!=null || context.read<CurrentUserBloc>().userData!.university !="" &&context.read<CurrentUserBloc>().userData!.faculty!=null || context.read<CurrentUserBloc>().userData!.faculty !="" )?Text(
                            " at ",
                            style: getBoldStyle(color: ColorManager.darkGrey,fontSize: FontSize.s10),
                          ):SizedBox(),
                          (context.read<CurrentUserBloc>().userData!.university!=null || context.read<CurrentUserBloc>().userData!.university !="")?Text(
                            "${context.read<CurrentUserBloc>().userData!.university}",
                            style: getBoldStyle(color: ColorManager.darkGrey,fontSize: FontSize.s10),
                          ):SizedBox(),
                        ],
                      ),
                    ),
                    (context.read<CurrentUserBloc>().userData!.level!=null || context.read<CurrentUserBloc>().userData!.level !="")?Text(
                      "${context.read<CurrentUserBloc>().userData!.level}",
                      style: getBoldStyle(color: ColorManager.darkGrey,fontSize: FontSize.s10),
                    ):SizedBox(),


                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: AppPadding.pVScreen2(context),
        ),
        Container(
          height: 2,
          width:AppConstants.wScreen(context),
          color: ColorManager.lightGrey,
        ),
        SizedBox(
          height: AppPadding.pVScreen4(context),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: AppPadding.pHScreen4(context)),
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, PageTransition(
                    child: MultiBlocProvider(
                      providers: [
                        BlocProvider(create: (context)=>EditProfileInfoCubit()),
                      ],
                      child: CustomGeneralInfo(),
                    ),
                    type: PageTransitionType.fade,
                    curve: Curves.fastEaseInToSlowEaseOut,
                    duration: const Duration(milliseconds: AppConstants.pageTransition200),
                  ));
                },
                child: Row(
                  children: [
                    Icon(Icons.person_outline,color: ColorManager.primary,size:30,),
                    SizedBox(
                      width: AppPadding.pHScreen2(context),
                    ),
                    Text(
                      "Edit Profile",
                      style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s12),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppPadding.pVScreen2(context),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, PageTransition(
                    child: WalletView(),
                    type: PageTransitionType.fade,
                    curve: Curves.fastEaseInToSlowEaseOut,
                    duration: const Duration(milliseconds: AppConstants.pageTransition200),
                  ));
                },
                child: Row(
                  children: [
                    Icon(Icons.account_balance_wallet_outlined,color: ColorManager.primary,size:30,),
                    SizedBox(
                      width: AppPadding.pHScreen2(context),
                    ),
                    Text(
                      "Wallet",
                      style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s12),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: AppPadding.pVScreen2(context),
              // ),
              // GestureDetector(
              //   onTap: (){},
              //   child: Row(
              //     children: [
              //       Icon(Icons.call_outlined,color: ColorManager.primary,size:30,),
              //       SizedBox(
              //         width: AppPadding.pHScreen2(context),
              //       ),
              //       Text(
              //         "Contact Us",
              //         style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s12),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: AppPadding.pVScreen2(context),
              ),
              GestureDetector(
                onTap: (){
                  CacheHelper.removeData(key:"isSigned");
                  Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                        child: LoginView(),
                        type: PageTransitionType.fade,
                        curve: Curves.fastEaseInToSlowEaseOut,
                        duration: const Duration(milliseconds: AppConstants.pageTransition200),
                      ), (Route<dynamic> route) => false
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.logout_rounded,color: ColorManager.primary,size:30,),
                    SizedBox(
                      width: AppPadding.pHScreen2(context),
                    ),
                    Text(
                      "Log out",
                      style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
