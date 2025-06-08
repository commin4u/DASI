import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/data/listing_repository.dart';
import 'package:home/domain/blocs/listing_state.dart';
import 'package:home/domain/model/listing.dart';

class ListingCubit extends Cubit<ListingState> {
  ListingCubit({
    required ListingRepository listingRepository,
  }) : _listingRepository = listingRepository,
        super(ListingState.initial());

  final ListingRepository _listingRepository;

  Future<void> loadListings() async {
    emit(ListingState.loading());
    final images = [
      'https://www.cdmi.in/courses@2x/2D3D-Game-Design.webp',
      'https://cdn2.unrealengine.com/fnbr-34-00-c6s2-1920x1080-2d1d03472e03.jpg',
      'https://cdn.sega.co.uk/mhc-sega/public/styles/2560/public/content/media/images/raster/sonicracingcrossworlds_horizontal_cover_0.jpg.webp?itok=mMcqIRJQ',
      'https://cdn.media.amplience.net/i/frasersdev/eldenring-nightreign-2x1?fmt=auto&upscale=false&w=991&h=496&sm=c&\$h-ttl\$',
      'https://fastly.picsum.photos/id/933/200/300.jpg?hmac=8zdipGWKGkHz8wyA9J63P3fzghuUL9wqV5Y34b8mLTI',
    ];
    final data = await _listingRepository.fetchListings();
    emit(ListingState.loaded(
      carouselListings: data.take(5).toList(),
      fullListListings: data,
    ));
  }
}