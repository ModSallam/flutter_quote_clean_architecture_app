import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_quote_clean_architecture_bloc_app/config/locale/app_localizations.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/utils/app_colors.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/presentation/widgets/body_content.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/splash/presentation/cubit/locale_cubit.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (AppLocalizations.of(context)!.isEnLocale) {
              context.read<LocaleCubit>().toArabic();
            } else {
              context.read<LocaleCubit>().toEnglish();
            }
          },
          icon: Icon(
            Icons.translate_outlined,
            color: AppColors.primary,
          ),
        ),
        title: Text(AppLocalizations.of(context)!.translate('app_name')!),
      ),
      body: const BodyContent(),
    );
  }
}
