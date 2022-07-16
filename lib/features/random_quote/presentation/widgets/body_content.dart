import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/utils/app_colors.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/presentation/widgets/custom_refresh_indicator.dart';
import 'package:random_quote_clean_architecture_bloc_app/features/random_quote/presentation/widgets/quote_content.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/widgets/error_widget.dart'
    as error_widget;

class BodyContent extends StatelessWidget {
  const BodyContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
      builder: (context, state) {
        if (state is RandomQuoteLoading) {
          return Center(
            child: SpinKitFadingCircle(
              color: AppColors.primary,
            ),
          );
        } else if (state is RandomQuoteLoaded) {
          return Column(
            children: [
              QuoteContnet(quote: state.quote),
              CustomRefreshIndicator(
                onPressed: () =>
                    context.read<RandomQuoteCubit>().getRandomQuote(),
              ),
            ],
          );
        } else if (state is RandomQuoteError) {
          return error_widget.ErrorWidget(
            onPressed: () => context.read<RandomQuoteCubit>().getRandomQuote(),
           );
        } else {
          return Center(
            child: SpinKitFadingCircle(
              color: AppColors.primary,
            ),
          );
        }
      },
    );
  }
}
