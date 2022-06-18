import 'package:clean_code_snippets/src/features/random_snippets/presentation/cubit/random_snippet_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_palette.dart';
import '../../../../core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import '../widgets/snippent_content.dart';
import '../../../../core/widgets/error_widget.dart' as error_widget;

class SnippetsScreen extends StatefulWidget {
  const SnippetsScreen({Key? key}) : super(key: key);
  @override
  State<SnippetsScreen> createState() => _SnippetsScreenState();
}

class _SnippetsScreenState extends State<SnippetsScreen> {
  final appBar = AppBar(
    title: const Text(
      AppStrings.appName,
      style: TextStyle(
        color: AppPalette.primary,
      ),
    ),
  );
  _getRandomSnippet() =>
      BlocProvider.of<RandomSnippetCubit>(context).getRandomSnippet();

  Widget _buildBodyContent() => SafeArea(
        child: BlocBuilder<RandomSnippetCubit, RandomSnippetState>(
          builder: (context, state) {
            if (state is RandomSnippetIsLoading) {
              return const CircularProgressIndicator();
            } else if (state is RandomSnippetError) {
              return const error_widget.ErrorWidget();
            } else if (state is RandomSnippetIsLoaded) {
              return Center(
                child: Column(
                  children: [
                    SnippetContent(
                      snippet: state.snippet,
                    ),
                    InkWell(
                      onTap: () => _getRandomSnippet(),
                      child: Container(
                        padding: EdgeInsets.all(10.r),
                        margin: EdgeInsets.symmetric(vertical: 15.h),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppPalette.primary,
                        ),
                        child: const Icon(Icons.refresh),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      );
  @override
  void initState() {
    super.initState();
    _getRandomSnippet();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: Scaffold(appBar: appBar, body: _buildBodyContent()),
      onRefresh: () => _getRandomSnippet(),
    );
  }
}
