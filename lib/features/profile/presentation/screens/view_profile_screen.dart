import 'package:final_project/features/profile/presentation/bloc/profile_cubit.dart';
import 'package:final_project/features/profile/presentation/bloc/profile_state.dart';
import 'package:final_project/features/profile/presentation/widgets/profile_image_widget.dart';
import 'package:final_project/features/profile/presentation/widgets/profile_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen();
  static const routeName = 'view_profile';
  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).viewProfile();
    super.initState();
  }

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
            success: (user) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileImageWidget(
                    user.imageUrl,
                  ),
                  Text(
                    user.name,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  ProfileItemWidget(
                    text: user.email,
                    icon: Icons.email_outlined,
                  ),
                  ProfileItemWidget(
                    text: user.phone ?? '',
                    icon: Icons.phone_outlined,
                  ),
                  ProfileItemWidget(
                    text: user.address ?? '',
                    icon: Icons.home_work_outlined,
                  ),
                  ProfileItemWidget(
                    text: '${user.age ?? ''}',
                    icon: Icons.home_work_outlined,
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
