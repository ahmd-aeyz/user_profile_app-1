import 'package:final_project/features/profile/presentation/bloc/profile_cubit.dart';
import 'package:final_project/features/profile/presentation/bloc/profile_state.dart';
import 'package:final_project/features/profile/presentation/widgets/profile_image_widget.dart';
import 'package:final_project/features/profile/presentation/widgets/profile_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewProfileScreen extends StatelessWidget {
  const ViewProfileScreen();
  static const routeName = '/view_profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View profile'),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error) => Center(child: Text(error)),
            success: (profile) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileImageWidget(profile.imageUrl),
                  Text(
                    profile.name,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  ProfileItemWidget(
                    text: profile.email,
                    icon: Icons.email_outlined,
                  ),
                  ProfileItemWidget(
                    text: profile.password,
                    icon: Icons.lock_outline,
                  ),
                  ProfileItemWidget(
                    text: profile.phone,
                    icon: Icons.phone_outlined,
                  ),
                  ProfileItemWidget(
                    text: profile.job,
                    icon: Icons.account_circle_outlined,
                  ),
                ],
              );
            },
            orElse: () => Container(),
          );
        },
      ),
    );
  }
}
