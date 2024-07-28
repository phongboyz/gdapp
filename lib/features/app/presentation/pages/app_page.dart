import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gd/core/constants/app_colors.dart';
import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/navigator/app_navigator.dart';
import 'package:gd/core/routes/route_path.dart';
import '../../../../core/widgets/loading_widget_store.dart';
import '../cubit/app_cubit.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: AppColors.secondaryColor,
      body: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          if (state.status == DataStatus.failure) {
            print(state.error ?? '');
            // Fluttertoast.showToast(msg: state.error ?? '');
          }
          if (state.status == DataStatus.success) {
            AppNavigator.pushAndRemoveUntil(RoutePath.login);
          }
        },
        builder: (context, state) {
          if (state.status == DataStatus.loading) {
            return const LoadingStoreWidget();
          }
          return const LoadingStoreWidget();
          // return SafeArea(
          //   child: SingleChildScrollView(
          //     child: Column(
          //       children: [
          //         Text('tontanh'),
          //         SizedBox(height: 20),
          //         Text('${state.currentUsers}'),
          //         InkWell(
          //             onTap: () async {
          //               // final NetworkCall networkCall;
          //               // var loginData = const Login(username: '', password: '');
          //               // final response =
          //               //     await NetworkCall.login(loginData);
          //               // // print(response);
          //             },
          //             child: Text('onpress'))
          //       ],
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}
