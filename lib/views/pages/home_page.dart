import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/view_modes/home_cubit/home_cubit.dart';
import 'package:ecommerce_app/views/widgets/category_tab_view.dart';
import 'package:ecommerce_app/views/widgets/home_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = HomeCubit();
        cubit.getHomeData();
        return cubit;
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                            'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDJ8fG1hbiUyMGZhdm9yaXRlfGVufDB8fHx8MTY5MjA3NTQxNw&ixlib=rb-4.0.3&q=80&w=400',
                          ),
                          radius: 30,
                        ),
                        const SizedBox(width: 8.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              'Hi, Sidi Maadh',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Let\'s go shopping!',
                              style: Theme.of(context).textTheme.labelMedium!
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.notifications),
                          onPressed: () {
                            // Handle notification button press
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            // Handle search button press
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                TabBar(
                  controller: _tabController,
                  unselectedLabelColor: const Color.fromARGB(
                    255,
                    161,
                    160,
                    160,
                  ),
                  tabs: [
                    Tab(text: 'Home'), 
                    Tab(text: 'Categories')
                  ],
                ),
                const SizedBox(height: 24.0),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [HomeTabView(), CategoryTabView()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
