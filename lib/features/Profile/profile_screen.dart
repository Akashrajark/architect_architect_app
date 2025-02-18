import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Import necessary files based on your project structure
import '../../common_widgets.dart/change_password.dart';
import '../../common_widgets.dart/custom_alert_dialog.dart';
import '../../util/check_login.dart';
import '../../util/format_function.dart';
import '../signin/signin_screen.dart';
import 'profile_bloc/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileBloc _profileBloc = ProfileBloc();
  Map _profile = {};

  @override
  void initState() {
    getProfile();
    checkLogin(context);
    super.initState();
  }

  void getProfile() {
    _profileBloc.add(GetAllProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _profileBloc,
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failure',
                description: state.message,
                primaryButton: 'Try Again',
                onPrimaryPressed: () {
                  getProfile();
                  Navigator.pop(context);
                },
              ),
            );
          } else if (state is ProfileGetSuccessState) {
            _profile = state.profile;
            setState(() {});
          } else if (state is ProfileSuccessState) {
            getProfile();
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              children: [
                const SizedBox(height: 16),
                // Profile section
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: _profile['photo'] != null
                          ? NetworkImage(_profile['photo'])
                          : null,
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formatValue(_profile['name'] ?? 'Bima Beser'),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            formatValue(_profile['email']),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            formatValue(_profile['phone']),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Trip section
                const Text(
                  'License Details',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),

                // Trip card
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Trip image with overlay
                      if (_profile['license_url'] != null)
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          child: Image.network(
                            _profile['license_url'],
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                      // Trip details
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.tag,
                              color: Colors.black,
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              formatValue(_profile['license_no']),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // Settings section
                const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),

                SettingsItem(
                  icon: Icons.lock_outline,
                  title: 'Change Password',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const ChangePasswordDialog(),
                    );
                  },
                ),
                SettingsItem(
                  icon: Icons.logout,
                  color: Colors.red.withAlpha(200),
                  title: 'Sign Out',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomAlertDialog(
                        title: "SIGN OUT",
                        content: const Text(
                          "Are you sure you want to Sign Out? Clicking 'Sign Out' will end your current session and require you to sign in again to access your account.",
                        ),
                        primaryButton: "SIGN OUT",
                        onPrimaryPressed: () {
                          Supabase.instance.client.auth.signOut();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SigninScreen(),
                            ),
                            (route) => false,
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onTap;
  final Color color;

  const SettingsItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap,
      this.color = Colors.black54});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: color),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: color,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
    );
  }
}
