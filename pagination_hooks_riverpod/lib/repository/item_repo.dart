import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/item.dart';
import '../page/pagination_request.dart';
import '../page/pagination_response.dart';

final itemRepoProvider = Provider((ref) => ItemRepo());

class ItemRepo {
  Future<PaginationResponse<Item>> getItemByPagePaginate(
      PaginationRequest request) async {
    await Future.delayed(const Duration(seconds: 1));
    return PaginationResponse(
        data: List.generate(
            request.perPage,
            (index) => Item(
                id: (request.page + index).toString(),
                name: "name ${request.page + index}")),
        meta: MetaData(
            page: request.page, perPage: request.perPage, totalPage: 10));
  }
}
