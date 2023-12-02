import 'dart:async';

import 'package:pagination_hooks_riverpod/page/pagination_controller.dart';
import 'package:pagination_hooks_riverpod/page/pagination_response.dart';
import 'package:riverpod/riverpod.dart';

import '../model/item.dart';
import '../repository/item_repo.dart';
import 'pagination_request.dart';

final itemsController = AsyncNotifierProvider.autoDispose<ItemsController,
    PaginationResponse<Item>>(ItemsController.new);

class ItemsController extends AutoDisposeAsyncNotifier<PaginationResponse<Item>>
    with PaginationController<Item> {
  @override
  Future<PaginationResponse<Item>> build() async {
    return await loadData(PaginationRequest(page: 1, perPage: 30));
  }

  @override
  FutureOr<PaginationResponse<Item>> loadData(PaginationRequest query) {
    return ref.read(itemRepoProvider).getItemByPagePaginate(query);
  }
}
