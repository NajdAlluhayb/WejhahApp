import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? HomePageEventWidget()
          : InterfacebeforeloginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? HomePageEventWidget()
              : InterfacebeforeloginWidget(),
        ),
        FFRoute(
          name: CreateAccount2Widget.routeName,
          path: CreateAccount2Widget.routePath,
          builder: (context, params) => CreateAccount2Widget(),
        ),
        FFRoute(
          name: CreateAccount2Copy2Widget.routeName,
          path: CreateAccount2Copy2Widget.routePath,
          builder: (context, params) => CreateAccount2Copy2Widget(),
        ),
        FFRoute(
          name: ForgotPassword02Widget.routeName,
          path: ForgotPassword02Widget.routePath,
          builder: (context, params) => ForgotPassword02Widget(),
        ),
        FFRoute(
          name: DetailsOceanWidget.routeName,
          path: DetailsOceanWidget.routePath,
          builder: (context, params) => DetailsOceanWidget(
            eventid: params.getParam(
              'eventid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: DetailseventCloudsWidget.routeName,
          path: DetailseventCloudsWidget.routePath,
          builder: (context, params) => DetailseventCloudsWidget(
            eventid: params.getParam(
              'eventid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: DetailseventAlulaWidget.routeName,
          path: DetailseventAlulaWidget.routePath,
          builder: (context, params) => DetailseventAlulaWidget(
            detailseventalual: params.getParam(
              'detailseventalual',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TicketQRcloudWidget.routeName,
          path: TicketQRcloudWidget.routePath,
          builder: (context, params) => TicketQRcloudWidget(),
        ),
        FFRoute(
          name: List11MessagesWidget.routeName,
          path: List11MessagesWidget.routePath,
          builder: (context, params) => List11MessagesWidget(),
        ),
        FFRoute(
          name: List16ActivityNotificationsWidget.routeName,
          path: List16ActivityNotificationsWidget.routePath,
          builder: (context, params) => List16ActivityNotificationsWidget(),
        ),
        FFRoute(
          name: HistoryWidget.routeName,
          path: HistoryWidget.routePath,
          builder: (context, params) => HistoryWidget(),
        ),
        FFRoute(
          name: ProfileWidget.routeName,
          path: ProfileWidget.routePath,
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: InformationWidget.routeName,
          path: InformationWidget.routePath,
          builder: (context, params) => InformationWidget(),
        ),
        FFRoute(
          name: CheckoutOceanWidget.routeName,
          path: CheckoutOceanWidget.routePath,
          builder: (context, params) => CheckoutOceanWidget(),
        ),
        FFRoute(
          name: CheckoutcloudsWidget.routeName,
          path: CheckoutcloudsWidget.routePath,
          builder: (context, params) => CheckoutcloudsWidget(),
        ),
        FFRoute(
          name: PayalulaWidget.routeName,
          path: PayalulaWidget.routePath,
          builder: (context, params) => PayalulaWidget(),
        ),
        FFRoute(
          name: PaymentalualWidget.routeName,
          path: PaymentalualWidget.routePath,
          builder: (context, params) => PaymentalualWidget(),
        ),
        FFRoute(
          name: TicketQRALUAWidget.routeName,
          path: TicketQRALUAWidget.routePath,
          builder: (context, params) => TicketQRALUAWidget(),
        ),
        FFRoute(
          name: TicketQRoceanWidget.routeName,
          path: TicketQRoceanWidget.routePath,
          builder: (context, params) => TicketQRoceanWidget(),
        ),
        FFRoute(
          name: PaycloudWidget.routeName,
          path: PaycloudWidget.routePath,
          builder: (context, params) => PaycloudWidget(),
        ),
        FFRoute(
          name: PaymentcloudWidget.routeName,
          path: PaymentcloudWidget.routePath,
          builder: (context, params) => PaymentcloudWidget(),
        ),
        FFRoute(
          name: PaymentoceanWidget.routeName,
          path: PaymentoceanWidget.routePath,
          builder: (context, params) => PaymentoceanWidget(),
        ),
        FFRoute(
          name: PayaoceanWidget.routeName,
          path: PayaoceanWidget.routePath,
          builder: (context, params) => PayaoceanWidget(),
        ),
        FFRoute(
          name: CheckoutAlUlaCopyWidget.routeName,
          path: CheckoutAlUlaCopyWidget.routePath,
          builder: (context, params) => CheckoutAlUlaCopyWidget(),
        ),
        FFRoute(
          name: PaycloudCopyWidget.routeName,
          path: PaycloudCopyWidget.routePath,
          builder: (context, params) => PaycloudCopyWidget(),
        ),
        FFRoute(
          name: DetailseventCloudsCopyWidget.routeName,
          path: DetailseventCloudsCopyWidget.routePath,
          builder: (context, params) => DetailseventCloudsCopyWidget(),
        ),
        FFRoute(
          name: List11MessagesCopyWidget.routeName,
          path: List11MessagesCopyWidget.routePath,
          builder: (context, params) => List11MessagesCopyWidget(),
        ),
        FFRoute(
          name: List11MessagesCopyCopyWidget.routeName,
          path: List11MessagesCopyCopyWidget.routePath,
          builder: (context, params) => List11MessagesCopyCopyWidget(),
        ),
        FFRoute(
          name: RestaurantslistWidget.routeName,
          path: RestaurantslistWidget.routePath,
          builder: (context, params) => RestaurantslistWidget(),
        ),
        FFRoute(
          name: OrganizerWidget.routeName,
          path: OrganizerWidget.routePath,
          builder: (context, params) => OrganizerWidget(),
        ),
        FFRoute(
          name: CreateEventWidget.routeName,
          path: CreateEventWidget.routePath,
          builder: (context, params) => CreateEventWidget(),
        ),
        FFRoute(
          name: InterfacebeforeloginWidget.routeName,
          path: InterfacebeforeloginWidget.routePath,
          builder: (context, params) => InterfacebeforeloginWidget(),
        ),
        FFRoute(
          name: EventSubmittedWidget.routeName,
          path: EventSubmittedWidget.routePath,
          builder: (context, params) => EventSubmittedWidget(),
        ),
        FFRoute(
          name: InformationorWidget.routeName,
          path: InformationorWidget.routePath,
          builder: (context, params) => InformationorWidget(),
        ),
        FFRoute(
          name: ListhistoryyWidget.routeName,
          path: ListhistoryyWidget.routePath,
          builder: (context, params) => ListhistoryyWidget(),
        ),
        FFRoute(
          name: ResturantListAfoodWidget.routeName,
          path: ResturantListAfoodWidget.routePath,
          builder: (context, params) => ResturantListAfoodWidget(),
        ),
        FFRoute(
          name: ResturantListSfoodWidget.routeName,
          path: ResturantListSfoodWidget.routePath,
          builder: (context, params) => ResturantListSfoodWidget(),
        ),
        FFRoute(
          name: ResturantListJfoodWidget.routeName,
          path: ResturantListJfoodWidget.routePath,
          builder: (context, params) => ResturantListJfoodWidget(),
        ),
        FFRoute(
          name: ResturantListIfoodWidget.routeName,
          path: ResturantListIfoodWidget.routePath,
          builder: (context, params) => ResturantListIfoodWidget(),
        ),
        FFRoute(
          name: ResturantListMfoodWidget.routeName,
          path: ResturantListMfoodWidget.routePath,
          builder: (context, params) => ResturantListMfoodWidget(),
        ),
        FFRoute(
          name: ResturantFfoodWidget.routeName,
          path: ResturantFfoodWidget.routePath,
          builder: (context, params) => ResturantFfoodWidget(),
        ),
        FFRoute(
          name: EventSubmittedCopyWidget.routeName,
          path: EventSubmittedCopyWidget.routePath,
          builder: (context, params) => EventSubmittedCopyWidget(),
        ),
        FFRoute(
          name: ResturantListMfoodCopyWidget.routeName,
          path: ResturantListMfoodCopyWidget.routePath,
          builder: (context, params) => ResturantListMfoodCopyWidget(),
        ),
        FFRoute(
          name: ResturantbookingcoffeeWidget.routeName,
          path: ResturantbookingcoffeeWidget.routePath,
          builder: (context, params) => ResturantbookingcoffeeWidget(),
        ),
        FFRoute(
          name: Resturantbooking1breakfastWidget.routeName,
          path: Resturantbooking1breakfastWidget.routePath,
          builder: (context, params) => Resturantbooking1breakfastWidget(),
        ),
        FFRoute(
          name: ResturantListMfoodCopy2Widget.routeName,
          path: ResturantListMfoodCopy2Widget.routePath,
          builder: (context, params) => ResturantListMfoodCopy2Widget(),
        ),
        FFRoute(
          name: ChangepasswordWidget.routeName,
          path: ChangepasswordWidget.routePath,
          builder: (context, params) => ChangepasswordWidget(),
        ),
        FFRoute(
          name: Resturantbooking2breakfastCopyWidget.routeName,
          path: Resturantbooking2breakfastCopyWidget.routePath,
          builder: (context, params) => Resturantbooking2breakfastCopyWidget(),
        ),
        FFRoute(
          name: Resturantbooking3breakfastCopyCopyWidget.routeName,
          path: Resturantbooking3breakfastCopyCopyWidget.routePath,
          builder: (context, params) =>
              Resturantbooking3breakfastCopyCopyWidget(),
        ),
        FFRoute(
          name: Resturantbooking4breakfastCopyCopyCopyWidget.routeName,
          path: Resturantbooking4breakfastCopyCopyCopyWidget.routePath,
          builder: (context, params) =>
              Resturantbooking4breakfastCopyCopyCopyWidget(),
        ),
        FFRoute(
          name: RevieworganizerWidget.routeName,
          path: RevieworganizerWidget.routePath,
          builder: (context, params) => RevieworganizerWidget(),
        ),
        FFRoute(
          name: Resturantbooking5breakfastCopyCopyCopyWidget.routeName,
          path: Resturantbooking5breakfastCopyCopyCopyWidget.routePath,
          builder: (context, params) =>
              Resturantbooking5breakfastCopyCopyCopyWidget(),
        ),
        FFRoute(
          name: ReportSubmittedWidget.routeName,
          path: ReportSubmittedWidget.routePath,
          builder: (context, params) => ReportSubmittedWidget(),
        ),
        FFRoute(
          name: Resturantbooking6breakfastCopyCopyCopyCopyWidget.routeName,
          path: Resturantbooking6breakfastCopyCopyCopyCopyWidget.routePath,
          builder: (context, params) =>
              Resturantbooking6breakfastCopyCopyCopyCopyWidget(),
        ),
        FFRoute(
          name: ReportAproblemWidget.routeName,
          path: ReportAproblemWidget.routePath,
          builder: (context, params) => ReportAproblemWidget(),
        ),
        FFRoute(
          name: Resturantbooking7breakfastCopyCopyCopyCopyWidget.routeName,
          path: Resturantbooking7breakfastCopyCopyCopyCopyWidget.routePath,
          builder: (context, params) =>
              Resturantbooking7breakfastCopyCopyCopyCopyWidget(),
        ),
        FFRoute(
          name: GamesListWidget.routeName,
          path: GamesListWidget.routePath,
          builder: (context, params) => GamesListWidget(),
        ),
        FFRoute(
          name: SaudiCultureLISTWidget.routeName,
          path: SaudiCultureLISTWidget.routePath,
          builder: (context, params) => SaudiCultureLISTWidget(),
        ),
        FFRoute(
          name: Rrrr2Widget.routeName,
          path: Rrrr2Widget.routePath,
          builder: (context, params) => Rrrr2Widget(),
        ),
        FFRoute(
          name: Rrrr3Widget.routeName,
          path: Rrrr3Widget.routePath,
          builder: (context, params) => Rrrr3Widget(),
        ),
        FFRoute(
          name: Rrrr4Widget.routeName,
          path: Rrrr4Widget.routePath,
          builder: (context, params) => Rrrr4Widget(),
        ),
        FFRoute(
          name: Rrr5Widget.routeName,
          path: Rrr5Widget.routePath,
          builder: (context, params) => Rrr5Widget(),
        ),
        FFRoute(
          name: ResturantsBookedWidget.routeName,
          path: ResturantsBookedWidget.routePath,
          builder: (context, params) => ResturantsBookedWidget(),
        ),
        FFRoute(
          name: ChangepasswordOrganizerWidget.routeName,
          path: ChangepasswordOrganizerWidget.routePath,
          builder: (context, params) => ChangepasswordOrganizerWidget(),
        ),
        FFRoute(
          name: SportsListWidget.routeName,
          path: SportsListWidget.routePath,
          builder: (context, params) => SportsListWidget(),
        ),
        FFRoute(
          name: MusicListWidget.routeName,
          path: MusicListWidget.routePath,
          builder: (context, params) => MusicListWidget(),
        ),
        FFRoute(
          name: HomePageEventWidget.routeName,
          path: HomePageEventWidget.routePath,
          builder: (context, params) => HomePageEventWidget(
            username: params.getParam(
              'username',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: Search2Widget.routeName,
          path: Search2Widget.routePath,
          builder: (context, params) => Search2Widget(),
        ),
        FFRoute(
          name: EventsHistoryWidget.routeName,
          path: EventsHistoryWidget.routePath,
          builder: (context, params) => EventsHistoryWidget(),
        ),
        FFRoute(
          name: NewBookingPageWidget.routeName,
          path: NewBookingPageWidget.routePath,
          builder: (context, params) => NewBookingPageWidget(),
        ),
        FFRoute(
          name: MajlisAlqahwaBookingPageWidget.routeName,
          path: MajlisAlqahwaBookingPageWidget.routePath,
          builder: (context, params) => MajlisAlqahwaBookingPageWidget(),
        ),
        FFRoute(
          name: LaVieEnWardBookingPageWidget.routeName,
          path: LaVieEnWardBookingPageWidget.routePath,
          builder: (context, params) => LaVieEnWardBookingPageWidget(),
        ),
        FFRoute(
          name: NajdiDoorsUnlockedBookingPageWidget.routeName,
          path: NajdiDoorsUnlockedBookingPageWidget.routePath,
          builder: (context, params) => NajdiDoorsUnlockedBookingPageWidget(),
        ),
        FFRoute(
          name: FragranceOfTheKingdoomBookingPageWidget.routeName,
          path: FragranceOfTheKingdoomBookingPageWidget.routePath,
          builder: (context, params) =>
              FragranceOfTheKingdoomBookingPageWidget(),
        ),
        FFRoute(
          name: ReportSubmittedCopyWidget.routeName,
          path: ReportSubmittedCopyWidget.routePath,
          builder: (context, params) => ReportSubmittedCopyWidget(),
        ),
        FFRoute(
          name: PoetryInMotionBookingPageWidget.routeName,
          path: PoetryInMotionBookingPageWidget.routePath,
          builder: (context, params) => PoetryInMotionBookingPageWidget(),
        ),
        FFRoute(
          name: BookingPageCopyWidget.routeName,
          path: BookingPageCopyWidget.routePath,
          builder: (context, params) => BookingPageCopyWidget(),
        ),
        FFRoute(
          name: DressedInSaudiBookingPageWidget.routeName,
          path: DressedInSaudiBookingPageWidget.routePath,
          builder: (context, params) => DressedInSaudiBookingPageWidget(),
        ),
        FFRoute(
          name: FirstPage4PicsWidget.routeName,
          path: FirstPage4PicsWidget.routePath,
          builder: (context, params) => FirstPage4PicsWidget(),
        ),
        FFRoute(
          name: TicketQRoceanCopyWidget.routeName,
          path: TicketQRoceanCopyWidget.routePath,
          builder: (context, params) => TicketQRoceanCopyWidget(),
        ),
        FFRoute(
          name: AbdulmajeedAbdullahBookingPageWidget.routeName,
          path: AbdulmajeedAbdullahBookingPageWidget.routePath,
          builder: (context, params) => AbdulmajeedAbdullahBookingPageWidget(),
        ),
        FFRoute(
          name: RabehSaqerBookingPageWidget.routeName,
          path: RabehSaqerBookingPageWidget.routePath,
          builder: (context, params) => RabehSaqerBookingPageWidget(),
        ),
        FFRoute(
          name: KhalidAbdulrahmanBookingPageWidget.routeName,
          path: KhalidAbdulrahmanBookingPageWidget.routePath,
          builder: (context, params) => KhalidAbdulrahmanBookingPageWidget(),
        ),
        FFRoute(
          name: ElissaBookingPageWidget.routeName,
          path: ElissaBookingPageWidget.routePath,
          builder: (context, params) => ElissaBookingPageWidget(),
        ),
        FFRoute(
          name: AhlamBookingPageWidget.routeName,
          path: AhlamBookingPageWidget.routePath,
          builder: (context, params) => AhlamBookingPageWidget(),
        ),
        FFRoute(
          name: RashidAlfaresBookingPageWidget.routeName,
          path: RashidAlfaresBookingPageWidget.routePath,
          builder: (context, params) => RashidAlfaresBookingPageWidget(),
        ),
        FFRoute(
          name: MyTicketsWidget.routeName,
          path: MyTicketsWidget.routePath,
          builder: (context, params) => MyTicketsWidget(),
        ),
        FFRoute(
          name: AlasyahOnWheelsBookingPageWidget.routeName,
          path: AlasyahOnWheelsBookingPageWidget.routePath,
          builder: (context, params) => AlasyahOnWheelsBookingPageWidget(),
        ),
        FFRoute(
          name: EscapeTheRoomBookingPageWidget.routeName,
          path: EscapeTheRoomBookingPageWidget.routePath,
          builder: (context, params) => EscapeTheRoomBookingPageWidget(),
        ),
        FFRoute(
          name: HitAndFireBookingPageWidget.routeName,
          path: HitAndFireBookingPageWidget.routePath,
          builder: (context, params) => HitAndFireBookingPageWidget(),
        ),
        FFRoute(
          name: ThuwairatSandSlideBookingPageWidget.routeName,
          path: ThuwairatSandSlideBookingPageWidget.routePath,
          builder: (context, params) => ThuwairatSandSlideBookingPageWidget(),
        ),
        FFRoute(
          name: AbhaCloudLineBookingPageWidget.routeName,
          path: AbhaCloudLineBookingPageWidget.routePath,
          builder: (context, params) => AbhaCloudLineBookingPageWidget(),
        ),
        FFRoute(
          name: KhobarAquaLandBookingPageWidget.routeName,
          path: KhobarAquaLandBookingPageWidget.routePath,
          builder: (context, params) => KhobarAquaLandBookingPageWidget(),
        ),
        FFRoute(
          name: SaudiEquestrianCupBookingPageWidget.routeName,
          path: SaudiEquestrianCupBookingPageWidget.routePath,
          builder: (context, params) => SaudiEquestrianCupBookingPageWidget(),
        ),
        FFRoute(
          name: SaudiVsJapanBookingPageWidget.routeName,
          path: SaudiVsJapanBookingPageWidget.routePath,
          builder: (context, params) => SaudiVsJapanBookingPageWidget(),
        ),
        FFRoute(
          name: WWEBookingPageWidget.routeName,
          path: WWEBookingPageWidget.routePath,
          builder: (context, params) => WWEBookingPageWidget(),
        ),
        FFRoute(
          name: TennisBookingPageWidget.routeName,
          path: TennisBookingPageWidget.routePath,
          builder: (context, params) => TennisBookingPageWidget(),
        ),
        FFRoute(
          name: RoadToDakarBookingPageWidget.routeName,
          path: RoadToDakarBookingPageWidget.routePath,
          builder: (context, params) => RoadToDakarBookingPageWidget(),
        ),
        FFRoute(
          name: ESportsBookingPageWidget.routeName,
          path: ESportsBookingPageWidget.routePath,
          builder: (context, params) => ESportsBookingPageWidget(),
        ),
        FFRoute(
          name: CheckoutAlUalWidget.routeName,
          path: CheckoutAlUalWidget.routePath,
          builder: (context, params) => CheckoutAlUalWidget(),
        ),
        FFRoute(
          name: FavWidget.routeName,
          path: FavWidget.routePath,
          builder: (context, params) => FavWidget(),
        ),
        FFRoute(
          name: PayConDressedInSaudiWidget.routeName,
          path: PayConDressedInSaudiWidget.routePath,
          builder: (context, params) => PayConDressedInSaudiWidget(),
        ),
        FFRoute(
          name: PaymentDressedInSaudiWidget.routeName,
          path: PaymentDressedInSaudiWidget.routePath,
          builder: (context, params) => PaymentDressedInSaudiWidget(),
        ),
        FFRoute(
          name: PayConFragranceWidget.routeName,
          path: PayConFragranceWidget.routePath,
          builder: (context, params) => PayConFragranceWidget(),
        ),
        FFRoute(
          name: PaymentFragranceWidget.routeName,
          path: PaymentFragranceWidget.routePath,
          builder: (context, params) => PaymentFragranceWidget(),
        ),
        FFRoute(
          name: PayConLaVieEnWardWidget.routeName,
          path: PayConLaVieEnWardWidget.routePath,
          builder: (context, params) => PayConLaVieEnWardWidget(),
        ),
        FFRoute(
          name: PaymentLaVieEnWardWidget.routeName,
          path: PaymentLaVieEnWardWidget.routePath,
          builder: (context, params) => PaymentLaVieEnWardWidget(),
        ),
        FFRoute(
          name: PaymentMajlisWidget.routeName,
          path: PaymentMajlisWidget.routePath,
          builder: (context, params) => PaymentMajlisWidget(),
        ),
        FFRoute(
          name: PayConMajlisWidget.routeName,
          path: PayConMajlisWidget.routePath,
          builder: (context, params) => PayConMajlisWidget(),
        ),
        FFRoute(
          name: PayConnajdidoorsWidget.routeName,
          path: PayConnajdidoorsWidget.routePath,
          builder: (context, params) => PayConnajdidoorsWidget(),
        ),
        FFRoute(
          name: PaymentnajdiDoorsWidget.routeName,
          path: PaymentnajdiDoorsWidget.routePath,
          builder: (context, params) => PaymentnajdiDoorsWidget(),
        ),
        FFRoute(
          name: PayConPoetryInMotionWidget.routeName,
          path: PayConPoetryInMotionWidget.routePath,
          builder: (context, params) => PayConPoetryInMotionWidget(),
        ),
        FFRoute(
          name: PaymentPoetryinMotiomWidget.routeName,
          path: PaymentPoetryinMotiomWidget.routePath,
          builder: (context, params) => PaymentPoetryinMotiomWidget(),
        ),
        FFRoute(
          name: CreatAccVisitorWidget.routeName,
          path: CreatAccVisitorWidget.routePath,
          builder: (context, params) => CreatAccVisitorWidget(),
        ),
        FFRoute(
          name: LogInPagevisitorWidget.routeName,
          path: LogInPagevisitorWidget.routePath,
          builder: (context, params) => LogInPagevisitorWidget(),
        ),
        FFRoute(
          name: ResetPasswordWidget.routeName,
          path: ResetPasswordWidget.routePath,
          builder: (context, params) => ResetPasswordWidget(),
        ),
        FFRoute(
          name: BrawosOnlyNotificationWidget.routeName,
          path: BrawosOnlyNotificationWidget.routePath,
          builder: (context, params) => BrawosOnlyNotificationWidget(),
        ),
        FFRoute(
          name: CitysMapsWidget.routeName,
          path: CitysMapsWidget.routePath,
          builder: (context, params) => CitysMapsWidget(),
        ),
        FFRoute(
          name: RiyadhMapWidget.routeName,
          path: RiyadhMapWidget.routePath,
          builder: (context, params) => RiyadhMapWidget(),
        ),
        FFRoute(
          name: AlulaMapWidget.routeName,
          path: AlulaMapWidget.routePath,
          builder: (context, params) => AlulaMapWidget(),
        ),
        FFRoute(
          name: DammamMapWidget.routeName,
          path: DammamMapWidget.routePath,
          builder: (context, params) => DammamMapWidget(),
        ),
        FFRoute(
          name: UmlujMapWidget.routeName,
          path: UmlujMapWidget.routePath,
          builder: (context, params) => UmlujMapWidget(),
        ),
        FFRoute(
          name: JeddahMapWidget.routeName,
          path: JeddahMapWidget.routePath,
          builder: (context, params) => JeddahMapWidget(),
        ),
        FFRoute(
          name: MapcloudsWidget.routeName,
          path: MapcloudsWidget.routePath,
          builder: (context, params) => MapcloudsWidget(
            eventid: params.getParam(
              'eventid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MapoceanWidget.routeName,
          path: MapoceanWidget.routePath,
          builder: (context, params) => MapoceanWidget(
            eventid: params.getParam(
              'eventid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MapalulaWidget.routeName,
          path: MapalulaWidget.routePath,
          builder: (context, params) => MapalulaWidget(
            eventid: params.getParam(
              'eventid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: PayConeSportsWidget.routeName,
          path: PayConeSportsWidget.routePath,
          builder: (context, params) => PayConeSportsWidget(),
        ),
        FFRoute(
          name: PaymenteSportsWidget.routeName,
          path: PaymenteSportsWidget.routePath,
          builder: (context, params) => PaymenteSportsWidget(),
        ),
        FFRoute(
          name: PayConRoadToDakarWidget.routeName,
          path: PayConRoadToDakarWidget.routePath,
          builder: (context, params) => PayConRoadToDakarWidget(),
        ),
        FFRoute(
          name: PaymentRoadToDakarWidget.routeName,
          path: PaymentRoadToDakarWidget.routePath,
          builder: (context, params) => PaymentRoadToDakarWidget(),
        ),
        FFRoute(
          name: PayConsaudieqcupWidget.routeName,
          path: PayConsaudieqcupWidget.routePath,
          builder: (context, params) => PayConsaudieqcupWidget(),
        ),
        FFRoute(
          name: PaymentSaudiEqCupWidget.routeName,
          path: PaymentSaudiEqCupWidget.routePath,
          builder: (context, params) => PaymentSaudiEqCupWidget(),
        ),
        FFRoute(
          name: PayConSaudiVsJapanWidget.routeName,
          path: PayConSaudiVsJapanWidget.routePath,
          builder: (context, params) => PayConSaudiVsJapanWidget(),
        ),
        FFRoute(
          name: PaymentSaudiVsJapanWidget.routeName,
          path: PaymentSaudiVsJapanWidget.routePath,
          builder: (context, params) => PaymentSaudiVsJapanWidget(),
        ),
        FFRoute(
          name: PayConTennisWidget.routeName,
          path: PayConTennisWidget.routePath,
          builder: (context, params) => PayConTennisWidget(),
        ),
        FFRoute(
          name: PaymentTennisWidget.routeName,
          path: PaymentTennisWidget.routePath,
          builder: (context, params) => PaymentTennisWidget(),
        ),
        FFRoute(
          name: PaymentWWEWidget.routeName,
          path: PaymentWWEWidget.routePath,
          builder: (context, params) => PaymentWWEWidget(),
        ),
        FFRoute(
          name: PayConWWEWidget.routeName,
          path: PayConWWEWidget.routePath,
          builder: (context, params) => PayConWWEWidget(),
        ),
        FFRoute(
          name: PayConAbhaCloudLineWidget.routeName,
          path: PayConAbhaCloudLineWidget.routePath,
          builder: (context, params) => PayConAbhaCloudLineWidget(),
        ),
        FFRoute(
          name: PaymentAbhaCloudLIneWidget.routeName,
          path: PaymentAbhaCloudLIneWidget.routePath,
          builder: (context, params) => PaymentAbhaCloudLIneWidget(),
        ),
        FFRoute(
          name: PayConAlasyahOnWheelsWidget.routeName,
          path: PayConAlasyahOnWheelsWidget.routePath,
          builder: (context, params) => PayConAlasyahOnWheelsWidget(),
        ),
        FFRoute(
          name: PaymentAlaAsyahOnWheelsWidget.routeName,
          path: PaymentAlaAsyahOnWheelsWidget.routePath,
          builder: (context, params) => PaymentAlaAsyahOnWheelsWidget(),
        ),
        FFRoute(
          name: PayConEscapeTheRoomWidget.routeName,
          path: PayConEscapeTheRoomWidget.routePath,
          builder: (context, params) => PayConEscapeTheRoomWidget(),
        ),
        FFRoute(
          name: PaymentEscapeTheRoomWidget.routeName,
          path: PaymentEscapeTheRoomWidget.routePath,
          builder: (context, params) => PaymentEscapeTheRoomWidget(),
        ),
        FFRoute(
          name: PayConHitAndFireWidget.routeName,
          path: PayConHitAndFireWidget.routePath,
          builder: (context, params) => PayConHitAndFireWidget(),
        ),
        FFRoute(
          name: PaymentHitAndFireWidget.routeName,
          path: PaymentHitAndFireWidget.routePath,
          builder: (context, params) => PaymentHitAndFireWidget(),
        ),
        FFRoute(
          name: PayConKhobarAquaLandWidget.routeName,
          path: PayConKhobarAquaLandWidget.routePath,
          builder: (context, params) => PayConKhobarAquaLandWidget(),
        ),
        FFRoute(
          name: PaymentKhobarAquaLandWidget.routeName,
          path: PaymentKhobarAquaLandWidget.routePath,
          builder: (context, params) => PaymentKhobarAquaLandWidget(),
        ),
        FFRoute(
          name: PaymentThuwairatSandSlideWidget.routeName,
          path: PaymentThuwairatSandSlideWidget.routePath,
          builder: (context, params) => PaymentThuwairatSandSlideWidget(),
        ),
        FFRoute(
          name: PayConThuwairatSandSlideWidget.routeName,
          path: PayConThuwairatSandSlideWidget.routePath,
          builder: (context, params) => PayConThuwairatSandSlideWidget(),
        ),
        FFRoute(
          name: PayConAbdulmajeedAbdullahWidget.routeName,
          path: PayConAbdulmajeedAbdullahWidget.routePath,
          builder: (context, params) => PayConAbdulmajeedAbdullahWidget(),
        ),
        FFRoute(
          name: PaymentAbdulmajeedAbdullahWidget.routeName,
          path: PaymentAbdulmajeedAbdullahWidget.routePath,
          builder: (context, params) => PaymentAbdulmajeedAbdullahWidget(),
        ),
        FFRoute(
          name: PayConAhlamWidget.routeName,
          path: PayConAhlamWidget.routePath,
          builder: (context, params) => PayConAhlamWidget(),
        ),
        FFRoute(
          name: PaymentAhlamWidget.routeName,
          path: PaymentAhlamWidget.routePath,
          builder: (context, params) => PaymentAhlamWidget(),
        ),
        FFRoute(
          name: PayConKhalidWidget.routeName,
          path: PayConKhalidWidget.routePath,
          builder: (context, params) => PayConKhalidWidget(),
        ),
        FFRoute(
          name: PaymentKhalidWidget.routeName,
          path: PaymentKhalidWidget.routePath,
          builder: (context, params) => PaymentKhalidWidget(),
        ),
        FFRoute(
          name: PayConElissaWidget.routeName,
          path: PayConElissaWidget.routePath,
          builder: (context, params) => PayConElissaWidget(),
        ),
        FFRoute(
          name: PaymentElissaWidget.routeName,
          path: PaymentElissaWidget.routePath,
          builder: (context, params) => PaymentElissaWidget(),
        ),
        FFRoute(
          name: PaymentRabehWidget.routeName,
          path: PaymentRabehWidget.routePath,
          builder: (context, params) => PaymentRabehWidget(),
        ),
        FFRoute(
          name: PayConRabehWidget.routeName,
          path: PayConRabehWidget.routePath,
          builder: (context, params) => PayConRabehWidget(),
        ),
        FFRoute(
          name: PayConRashidWidget.routeName,
          path: PayConRashidWidget.routePath,
          builder: (context, params) => PayConRashidWidget(),
        ),
        FFRoute(
          name: PaymentRashidWidget.routeName,
          path: PaymentRashidWidget.routePath,
          builder: (context, params) => PaymentRashidWidget(),
        ),
        FFRoute(
          name: AdmainHomePageWidget.routeName,
          path: AdmainHomePageWidget.routePath,
          builder: (context, params) => AdmainHomePageWidget(),
        ),
        FFRoute(
          name: MaintenanceWidget.routeName,
          path: MaintenanceWidget.routePath,
          builder: (context, params) => MaintenanceWidget(),
        ),
        FFRoute(
          name: DetailseventCloudsCopyCopyWidget.routeName,
          path: DetailseventCloudsCopyCopyWidget.routePath,
          builder: (context, params) => DetailseventCloudsCopyCopyWidget(),
        ),
        FFRoute(
          name: FivorateListWidget.routeName,
          path: FivorateListWidget.routePath,
          builder: (context, params) => FivorateListWidget(),
        ),
        FFRoute(
          name: MyFavListWidget.routeName,
          path: MyFavListWidget.routePath,
          builder: (context, params) => MyFavListWidget(),
        ),
        FFRoute(
          name: TicketQRDressedInSaudiWidget.routeName,
          path: TicketQRDressedInSaudiWidget.routePath,
          builder: (context, params) => TicketQRDressedInSaudiWidget(),
        ),
        FFRoute(
          name: TicketQRFragranceOfTheKingdomWidget.routeName,
          path: TicketQRFragranceOfTheKingdomWidget.routePath,
          builder: (context, params) => TicketQRFragranceOfTheKingdomWidget(),
        ),
        FFRoute(
          name: TicketQRLaVieEnWardWidget.routeName,
          path: TicketQRLaVieEnWardWidget.routePath,
          builder: (context, params) => TicketQRLaVieEnWardWidget(),
        ),
        FFRoute(
          name: TicketQRMajlisAlqahwahWidget.routeName,
          path: TicketQRMajlisAlqahwahWidget.routePath,
          builder: (context, params) => TicketQRMajlisAlqahwahWidget(),
        ),
        FFRoute(
          name: TicketQRNajdiDoorsUnlockedWidget.routeName,
          path: TicketQRNajdiDoorsUnlockedWidget.routePath,
          builder: (context, params) => TicketQRNajdiDoorsUnlockedWidget(),
        ),
        FFRoute(
          name: TicketQRPoetryInMotionWidget.routeName,
          path: TicketQRPoetryInMotionWidget.routePath,
          builder: (context, params) => TicketQRPoetryInMotionWidget(),
        ),
        FFRoute(
          name: ReviewfoodWidget.routeName,
          path: ReviewfoodWidget.routePath,
          builder: (context, params) => ReviewfoodWidget(),
        ),
        FFRoute(
          name: ReviewsportWidget.routeName,
          path: ReviewsportWidget.routePath,
          builder: (context, params) => ReviewsportWidget(),
        ),
        FFRoute(
          name: ReviewmusicWidget.routeName,
          path: ReviewmusicWidget.routePath,
          builder: (context, params) => ReviewmusicWidget(),
        ),
        FFRoute(
          name: ReviewgamesWidget.routeName,
          path: ReviewgamesWidget.routePath,
          builder: (context, params) => ReviewgamesWidget(),
        ),
        FFRoute(
          name: TicketQRAbdulmajeedAbdullahWidget.routeName,
          path: TicketQRAbdulmajeedAbdullahWidget.routePath,
          builder: (context, params) => TicketQRAbdulmajeedAbdullahWidget(),
        ),
        FFRoute(
          name: TicketQRAhlamWidget.routeName,
          path: TicketQRAhlamWidget.routePath,
          builder: (context, params) => TicketQRAhlamWidget(),
        ),
        FFRoute(
          name: TicketQRElissaWidget.routeName,
          path: TicketQRElissaWidget.routePath,
          builder: (context, params) => TicketQRElissaWidget(),
        ),
        FFRoute(
          name: TicketQRKhalidWidget.routeName,
          path: TicketQRKhalidWidget.routePath,
          builder: (context, params) => TicketQRKhalidWidget(),
        ),
        FFRoute(
          name: TicketQRRabehWidget.routeName,
          path: TicketQRRabehWidget.routePath,
          builder: (context, params) => TicketQRRabehWidget(),
        ),
        FFRoute(
          name: TicketQRRashidWidget.routeName,
          path: TicketQRRashidWidget.routePath,
          builder: (context, params) => TicketQRRashidWidget(),
        ),
        FFRoute(
          name: ReviewSAUDIWidget.routeName,
          path: ReviewSAUDIWidget.routePath,
          builder: (context, params) => ReviewSAUDIWidget(),
        ),
        FFRoute(
          name: TicketQRAbhaCloudLineWidget.routeName,
          path: TicketQRAbhaCloudLineWidget.routePath,
          builder: (context, params) => TicketQRAbhaCloudLineWidget(),
        ),
        FFRoute(
          name: TicketQRAlAsyahOnWheelsWidget.routeName,
          path: TicketQRAlAsyahOnWheelsWidget.routePath,
          builder: (context, params) => TicketQRAlAsyahOnWheelsWidget(),
        ),
        FFRoute(
          name: TicketQREscapeTheRoomWidget.routeName,
          path: TicketQREscapeTheRoomWidget.routePath,
          builder: (context, params) => TicketQREscapeTheRoomWidget(),
        ),
        FFRoute(
          name: TicketQRHitAndFireWidget.routeName,
          path: TicketQRHitAndFireWidget.routePath,
          builder: (context, params) => TicketQRHitAndFireWidget(),
        ),
        FFRoute(
          name: TicketQRKhobarAquaLandWidget.routeName,
          path: TicketQRKhobarAquaLandWidget.routePath,
          builder: (context, params) => TicketQRKhobarAquaLandWidget(),
        ),
        FFRoute(
          name: TicketQRThuwairatSandSlideWidget.routeName,
          path: TicketQRThuwairatSandSlideWidget.routePath,
          builder: (context, params) => TicketQRThuwairatSandSlideWidget(),
        ),
        FFRoute(
          name: Reviewvisitor1Widget.routeName,
          path: Reviewvisitor1Widget.routePath,
          builder: (context, params) => Reviewvisitor1Widget(),
        ),
        FFRoute(
          name: TicketQReSportsWidget.routeName,
          path: TicketQReSportsWidget.routePath,
          builder: (context, params) => TicketQReSportsWidget(),
        ),
        FFRoute(
          name: TicketQRRoadToDakarWidget.routeName,
          path: TicketQRRoadToDakarWidget.routePath,
          builder: (context, params) => TicketQRRoadToDakarWidget(),
        ),
        FFRoute(
          name: TicketQRSaudiEqCupWidget.routeName,
          path: TicketQRSaudiEqCupWidget.routePath,
          builder: (context, params) => TicketQRSaudiEqCupWidget(),
        ),
        FFRoute(
          name: TicketQRSaudiVsJapanWidget.routeName,
          path: TicketQRSaudiVsJapanWidget.routePath,
          builder: (context, params) => TicketQRSaudiVsJapanWidget(),
        ),
        FFRoute(
          name: TicketQRTennisWidget.routeName,
          path: TicketQRTennisWidget.routePath,
          builder: (context, params) => TicketQRTennisWidget(),
        ),
        FFRoute(
          name: TicketQRWWEWidget.routeName,
          path: TicketQRWWEWidget.routePath,
          builder: (context, params) => TicketQRWWEWidget(),
        ),
        FFRoute(
          name: LogInPageSelectRoleWidget.routeName,
          path: LogInPageSelectRoleWidget.routePath,
          builder: (context, params) => LogInPageSelectRoleWidget(),
        ),
        FFRoute(
          name: LogInPageOrgWidget.routeName,
          path: LogInPageOrgWidget.routePath,
          builder: (context, params) => LogInPageOrgWidget(),
        ),
        FFRoute(
          name: LogInPageAdmainWidget.routeName,
          path: LogInPageAdmainWidget.routePath,
          builder: (context, params) => LogInPageAdmainWidget(),
        ),
        FFRoute(
          name: Rvistor5Widget.routeName,
          path: Rvistor5Widget.routePath,
          builder: (context, params) => Rvistor5Widget(),
        ),
        FFRoute(
          name: Rvisitor2Widget.routeName,
          path: Rvisitor2Widget.routePath,
          builder: (context, params) => Rvisitor2Widget(),
        ),
        FFRoute(
          name: Rvisitor3Widget.routeName,
          path: Rvisitor3Widget.routePath,
          builder: (context, params) => Rvisitor3Widget(),
        ),
        FFRoute(
          name: Rvisitor4Widget.routeName,
          path: Rvisitor4Widget.routePath,
          builder: (context, params) => Rvisitor4Widget(),
        ),
        FFRoute(
          name: ChatbotPageWidget.routeName,
          path: ChatbotPageWidget.routePath,
          builder: (context, params) => ChatbotPageWidget(),
        ),
        FFRoute(
          name: HomePageEventbrowesWidget.routeName,
          path: HomePageEventbrowesWidget.routePath,
          builder: (context, params) => HomePageEventbrowesWidget(
            username: params.getParam(
              'username',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SaudiCultureLISTbrowesWidget.routeName,
          path: SaudiCultureLISTbrowesWidget.routePath,
          builder: (context, params) => SaudiCultureLISTbrowesWidget(),
        ),
        FFRoute(
          name: SportsListbrowesWidget.routeName,
          path: SportsListbrowesWidget.routePath,
          builder: (context, params) => SportsListbrowesWidget(),
        ),
        FFRoute(
          name: MusicListbrowesWidget.routeName,
          path: MusicListbrowesWidget.routePath,
          builder: (context, params) => MusicListbrowesWidget(),
        ),
        FFRoute(
          name: GamesListbrowesWidget.routeName,
          path: GamesListbrowesWidget.routePath,
          builder: (context, params) => GamesListbrowesWidget(),
        ),
        FFRoute(
          name: RestaurantslistbrowesWidget.routeName,
          path: RestaurantslistbrowesWidget.routePath,
          builder: (context, params) => RestaurantslistbrowesWidget(),
        ),
        FFRoute(
          name: BookTicketChatbotWidget.routeName,
          path: BookTicketChatbotWidget.routePath,
          builder: (context, params) => BookTicketChatbotWidget(),
        ),
        FFRoute(
          name: RepportChatbotWidget.routeName,
          path: RepportChatbotWidget.routePath,
          builder: (context, params) => RepportChatbotWidget(),
        ),
        FFRoute(
          name: CancelTicketChatbotWidget.routeName,
          path: CancelTicketChatbotWidget.routePath,
          builder: (context, params) => CancelTicketChatbotWidget(),
        ),
        FFRoute(
          name: BookTableResChatbotWidget.routeName,
          path: BookTableResChatbotWidget.routePath,
          builder: (context, params) => BookTableResChatbotWidget(),
        ),
        FFRoute(
          name: SupportChatbotWidget.routeName,
          path: SupportChatbotWidget.routePath,
          builder: (context, params) => SupportChatbotWidget(),
        ),
        FFRoute(
          name: LocationBookChatbotWidget.routeName,
          path: LocationBookChatbotWidget.routePath,
          builder: (context, params) => LocationBookChatbotWidget(),
        ),
        FFRoute(
          name: ChangebookingChatbotWidget.routeName,
          path: ChangebookingChatbotWidget.routePath,
          builder: (context, params) => ChangebookingChatbotWidget(),
        ),
        FFRoute(
          name: FAVeventChatbotWidget.routeName,
          path: FAVeventChatbotWidget.routePath,
          builder: (context, params) => FAVeventChatbotWidget(),
        ),
        FFRoute(
          name: QRCodeChatbotWidget.routeName,
          path: QRCodeChatbotWidget.routePath,
          builder: (context, params) => QRCodeChatbotWidget(),
        ),
        FFRoute(
          name: PaymentChatbotWidget.routeName,
          path: PaymentChatbotWidget.routePath,
          builder: (context, params) => PaymentChatbotWidget(),
        ),
        FFRoute(
          name: PassChatbotWidget.routeName,
          path: PassChatbotWidget.routePath,
          builder: (context, params) => PassChatbotWidget(),
        ),
        FFRoute(
          name: AccWidget.routeName,
          path: AccWidget.routePath,
          builder: (context, params) => AccWidget(),
        ),
        FFRoute(
          name: Acc2Widget.routeName,
          path: Acc2Widget.routePath,
          builder: (context, params) => Acc2Widget(),
        ),
        FFRoute(
          name: Acc2CopyWidget.routeName,
          path: Acc2CopyWidget.routePath,
          builder: (context, params) => Acc2CopyWidget(),
        ),
        FFRoute(
          name: Acc3Widget.routeName,
          path: Acc3Widget.routePath,
          builder: (context, params) => Acc3Widget(),
        ),
        FFRoute(
          name: Acc4Widget.routeName,
          path: Acc4Widget.routePath,
          builder: (context, params) => Acc4Widget(),
        ),
        FFRoute(
          name: Acc5Widget.routeName,
          path: Acc5Widget.routePath,
          builder: (context, params) => Acc5Widget(),
        ),
        FFRoute(
          name: RequestedWidget.routeName,
          path: RequestedWidget.routePath,
          builder: (context, params) => RequestedWidget(),
        ),
        FFRoute(
          name: ReportChatbotPageWidget.routeName,
          path: ReportChatbotPageWidget.routePath,
          builder: (context, params) => ReportChatbotPageWidget(),
        ),
        FFRoute(
          name: RejectWidget.routeName,
          path: RejectWidget.routePath,
          builder: (context, params) => RejectWidget(),
        ),
        FFRoute(
          name: R1reportChatbotWidget.routeName,
          path: R1reportChatbotWidget.routePath,
          builder: (context, params) => R1reportChatbotWidget(),
        ),
        FFRoute(
          name: R2reportChatbotWidget.routeName,
          path: R2reportChatbotWidget.routePath,
          builder: (context, params) => R2reportChatbotWidget(),
        ),
        FFRoute(
          name: PadelBookingWidget.routeName,
          path: PadelBookingWidget.routePath,
          builder: (context, params) => PadelBookingWidget(),
        ),
        FFRoute(
          name: R3reportChatbotWidget.routeName,
          path: R3reportChatbotWidget.routePath,
          builder: (context, params) => R3reportChatbotWidget(),
        ),
        FFRoute(
          name: R4reportChatbotWidget.routeName,
          path: R4reportChatbotWidget.routePath,
          builder: (context, params) => R4reportChatbotWidget(),
        ),
        FFRoute(
          name: R5reportChatbotWidget.routeName,
          path: R5reportChatbotWidget.routePath,
          builder: (context, params) => R5reportChatbotWidget(),
        ),
        FFRoute(
          name: R6reportChatbotWidget.routeName,
          path: R6reportChatbotWidget.routePath,
          builder: (context, params) => R6reportChatbotWidget(),
        ),
        FFRoute(
          name: R7reportChatbotWidget.routeName,
          path: R7reportChatbotWidget.routePath,
          builder: (context, params) => R7reportChatbotWidget(),
        ),
        FFRoute(
          name: VriyWidget.routeName,
          path: VriyWidget.routePath,
          builder: (context, params) => VriyWidget(),
        ),
        FFRoute(
          name: VjeddWidget.routeName,
          path: VjeddWidget.routePath,
          builder: (context, params) => VjeddWidget(),
        ),
        FFRoute(
          name: ValulaWidget.routeName,
          path: ValulaWidget.routePath,
          builder: (context, params) => ValulaWidget(),
        ),
        FFRoute(
          name: VkhWidget.routeName,
          path: VkhWidget.routePath,
          builder: (context, params) => VkhWidget(),
        ),
        FFRoute(
          name: VdammWidget.routeName,
          path: VdammWidget.routePath,
          builder: (context, params) => VdammWidget(),
        ),
        FFRoute(
          name: VtaifWidget.routeName,
          path: VtaifWidget.routePath,
          builder: (context, params) => VtaifWidget(),
        ),
        FFRoute(
          name: VhailWidget.routeName,
          path: VhailWidget.routePath,
          builder: (context, params) => VhailWidget(),
        ),
        FFRoute(
          name: VabhaWidget.routeName,
          path: VabhaWidget.routePath,
          builder: (context, params) => VabhaWidget(),
        ),
        FFRoute(
          name: Eventshistoryy1Widget.routeName,
          path: Eventshistoryy1Widget.routePath,
          builder: (context, params) => Eventshistoryy1Widget(),
        ),
        FFRoute(
          name: ListWidget.routeName,
          path: ListWidget.routePath,
          builder: (context, params) => ListWidget(),
        ),
        FFRoute(
          name: VenueWidget.routeName,
          path: VenueWidget.routePath,
          builder: (context, params) => VenueWidget(),
        ),
        FFRoute(
          name: TicketshistoryWidget.routeName,
          path: TicketshistoryWidget.routePath,
          builder: (context, params) => TicketshistoryWidget(),
        ),
        FFRoute(
          name: RecomendedOpWidget.routeName,
          path: RecomendedOpWidget.routePath,
          builder: (context, params) => RecomendedOpWidget(),
        ),
        FFRoute(
          name: ByTimeWidget.routeName,
          path: ByTimeWidget.routePath,
          builder: (context, params) => ByTimeWidget(),
        ),
        FFRoute(
          name: ByPriceWidget.routeName,
          path: ByPriceWidget.routePath,
          builder: (context, params) => ByPriceWidget(),
        ),
        FFRoute(
          name: SRbyTimeWidget.routeName,
          path: SRbyTimeWidget.routePath,
          builder: (context, params) => SRbyTimeWidget(),
        ),
        FFRoute(
          name: Smartrec1Widget.routeName,
          path: Smartrec1Widget.routePath,
          builder: (context, params) => Smartrec1Widget(),
        ),
        FFRoute(
          name: Smartre2Widget.routeName,
          path: Smartre2Widget.routePath,
          builder: (context, params) => Smartre2Widget(),
        ),
        FFRoute(
          name: Smartrec3Widget.routeName,
          path: Smartrec3Widget.routePath,
          builder: (context, params) => Smartrec3Widget(),
        ),
        FFRoute(
          name: SmartcupWidget.routeName,
          path: SmartcupWidget.routePath,
          builder: (context, params) => SmartcupWidget(),
        ),
        FFRoute(
          name: SmartmusicWidget.routeName,
          path: SmartmusicWidget.routePath,
          builder: (context, params) => SmartmusicWidget(),
        ),
        FFRoute(
          name: SmartchilWidget.routeName,
          path: SmartchilWidget.routePath,
          builder: (context, params) => SmartchilWidget(),
        ),
        FFRoute(
          name: SmartcultureWidget.routeName,
          path: SmartcultureWidget.routePath,
          builder: (context, params) => SmartcultureWidget(),
        ),
        FFRoute(
          name: Smartrec4Widget.routeName,
          path: Smartrec4Widget.routePath,
          builder: (context, params) => Smartrec4Widget(),
        ),
        FFRoute(
          name: SmartadvenWidget.routeName,
          path: SmartadvenWidget.routePath,
          builder: (context, params) => SmartadvenWidget(),
        ),
        FFRoute(
          name: SmartdiscoverWidget.routeName,
          path: SmartdiscoverWidget.routePath,
          builder: (context, params) => SmartdiscoverWidget(),
        ),
        FFRoute(
          name: SmarteveningWidget.routeName,
          path: SmarteveningWidget.routePath,
          builder: (context, params) => SmarteveningWidget(),
        ),
        FFRoute(
          name: SmartmorningWidget.routeName,
          path: SmartmorningWidget.routePath,
          builder: (context, params) => SmartmorningWidget(),
        ),
        FFRoute(
          name: SmartalulaWidget.routeName,
          path: SmartalulaWidget.routePath,
          builder: (context, params) => SmartalulaWidget(),
        ),
        FFRoute(
          name: SmartwifeWidget.routeName,
          path: SmartwifeWidget.routePath,
          builder: (context, params) => SmartwifeWidget(),
        ),
        FFRoute(
          name: SmartfriendsWidget.routeName,
          path: SmartfriendsWidget.routePath,
          builder: (context, params) => SmartfriendsWidget(),
        ),
        FFRoute(
          name: SmartfamilyWidget.routeName,
          path: SmartfamilyWidget.routePath,
          builder: (context, params) => SmartfamilyWidget(),
        ),
        FFRoute(
          name: FirstpagesmartWidget.routeName,
          path: FirstpagesmartWidget.routePath,
          builder: (context, params) => FirstpagesmartWidget(),
        ),
        FFRoute(
          name: HomePageEventCopyWidget.routeName,
          path: HomePageEventCopyWidget.routePath,
          builder: (context, params) => HomePageEventCopyWidget(
            username: params.getParam(
              'username',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: DetailsOceanBrowseWidget.routeName,
          path: DetailsOceanBrowseWidget.routePath,
          builder: (context, params) => DetailsOceanBrowseWidget(
            eventid: params.getParam(
              'eventid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ReviewvisitorBrowseWidget.routeName,
          path: ReviewvisitorBrowseWidget.routePath,
          builder: (context, params) => ReviewvisitorBrowseWidget(),
        ),
        FFRoute(
          name: MapoceanBrowseWidget.routeName,
          path: MapoceanBrowseWidget.routePath,
          builder: (context, params) => MapoceanBrowseWidget(
            eventid: params.getParam(
              'eventid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: DetailseventCloudsBrowseWidget.routeName,
          path: DetailseventCloudsBrowseWidget.routePath,
          builder: (context, params) => DetailseventCloudsBrowseWidget(
            eventid: params.getParam(
              'eventid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MapcloudsBrowseWidget.routeName,
          path: MapcloudsBrowseWidget.routePath,
          builder: (context, params) => MapcloudsBrowseWidget(
            eventid: params.getParam(
              'eventid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: DetailseventAlulaBrowseWidget.routeName,
          path: DetailseventAlulaBrowseWidget.routePath,
          builder: (context, params) => DetailseventAlulaBrowseWidget(
            detailseventalual: params.getParam(
              'detailseventalual',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MapalulaBrowseWidget.routeName,
          path: MapalulaBrowseWidget.routePath,
          builder: (context, params) => MapalulaBrowseWidget(
            eventid: params.getParam(
              'eventid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CitysMapsBrowseWidget.routeName,
          path: CitysMapsBrowseWidget.routePath,
          builder: (context, params) => CitysMapsBrowseWidget(),
        ),
        FFRoute(
          name: Rradmin1Widget.routeName,
          path: Rradmin1Widget.routePath,
          builder: (context, params) => Rradmin1Widget(),
        ),
        FFRoute(
          name: Radmin2Widget.routeName,
          path: Radmin2Widget.routePath,
          builder: (context, params) => Radmin2Widget(),
        ),
        FFRoute(
          name: Radmin3Widget.routeName,
          path: Radmin3Widget.routePath,
          builder: (context, params) => Radmin3Widget(),
        ),
        FFRoute(
          name: Radmin4Widget.routeName,
          path: Radmin4Widget.routePath,
          builder: (context, params) => Radmin4Widget(),
        ),
        FFRoute(
          name: Radmin5Widget.routeName,
          path: Radmin5Widget.routePath,
          builder: (context, params) => Radmin5Widget(),
        ),
        FFRoute(
          name: OrganizernewWidget.routeName,
          path: OrganizernewWidget.routePath,
          builder: (context, params) => OrganizernewWidget(),
        ),
        FFRoute(
          name: PolicyAndTermaVisitorWidget.routeName,
          path: PolicyAndTermaVisitorWidget.routePath,
          builder: (context, params) => PolicyAndTermaVisitorWidget(),
        ),
        FFRoute(
          name: PolicyAndTermaOrgWidget.routeName,
          path: PolicyAndTermaOrgWidget.routePath,
          builder: (context, params) => PolicyAndTermaOrgWidget(),
        ),
        FFRoute(
          name: LowPriceSmartWidget.routeName,
          path: LowPriceSmartWidget.routePath,
          builder: (context, params) => LowPriceSmartWidget(),
        ),
        FFRoute(
          name: MediumPriceSmartWidget.routeName,
          path: MediumPriceSmartWidget.routePath,
          builder: (context, params) => MediumPriceSmartWidget(),
        ),
        FFRoute(
          name: HighPriceSmartWidget.routeName,
          path: HighPriceSmartWidget.routePath,
          builder: (context, params) => HighPriceSmartWidget(),
        ),
        FFRoute(
          name: RecommendedLowPrice1Widget.routeName,
          path: RecommendedLowPrice1Widget.routePath,
          builder: (context, params) => RecommendedLowPrice1Widget(),
        ),
        FFRoute(
          name: AticketHight1Widget.routeName,
          path: AticketHight1Widget.routePath,
          builder: (context, params) => AticketHight1Widget(),
        ),
        FFRoute(
          name: AlowPriceFamilyWidget.routeName,
          path: AlowPriceFamilyWidget.routePath,
          builder: (context, params) => AlowPriceFamilyWidget(),
        ),
        FFRoute(
          name: AticketLow1CopyWidget.routeName,
          path: AticketLow1CopyWidget.routePath,
          builder: (context, params) => AticketLow1CopyWidget(),
        ),
        FFRoute(
          name: AticketLow1Copy2Widget.routeName,
          path: AticketLow1Copy2Widget.routePath,
          builder: (context, params) => AticketLow1Copy2Widget(),
        ),
        FFRoute(
          name: HPRestWidget.routeName,
          path: HPRestWidget.routePath,
          builder: (context, params) => HPRestWidget(),
        ),
        FFRoute(
          name: AticketLow1CopyCopyWidget.routeName,
          path: AticketLow1CopyCopyWidget.routePath,
          builder: (context, params) => AticketLow1CopyCopyWidget(),
        ),
        FFRoute(
          name: HPmusicWidget.routeName,
          path: HPmusicWidget.routePath,
          builder: (context, params) => HPmusicWidget(),
        ),
        FFRoute(
          name: AticketHight1CopyWidget.routeName,
          path: AticketHight1CopyWidget.routePath,
          builder: (context, params) => AticketHight1CopyWidget(),
        ),
        FFRoute(
          name: HPRestCopyWidget.routeName,
          path: HPRestCopyWidget.routePath,
          builder: (context, params) => HPRestCopyWidget(),
        ),
        FFRoute(
          name: EscapeTheRoomWidget.routeName,
          path: EscapeTheRoomWidget.routePath,
          builder: (context, params) => EscapeTheRoomWidget(),
        ),
        FFRoute(
          name: EscapeTheRoomticketWidget.routeName,
          path: EscapeTheRoomticketWidget.routePath,
          builder: (context, params) => EscapeTheRoomticketWidget(),
        ),
        FFRoute(
          name: SportmedTicketsWidget.routeName,
          path: SportmedTicketsWidget.routePath,
          builder: (context, params) => SportmedTicketsWidget(),
        ),
        FFRoute(
          name: SportmedWidget.routeName,
          path: SportmedWidget.routePath,
          builder: (context, params) => SportmedWidget(),
        ),
        FFRoute(
          name: OrganizermainWidget.routeName,
          path: OrganizermainWidget.routePath,
          builder: (context, params) => OrganizermainWidget(),
        ),
        FFRoute(
          name: InformationornewWidget.routeName,
          path: InformationornewWidget.routePath,
          builder: (context, params) => InformationornewWidget(),
        ),
        FFRoute(
          name: MainorWidget.routeName,
          path: MainorWidget.routePath,
          builder: (context, params) => MainorWidget(),
        ),
        FFRoute(
          name: MaineventsWidget.routeName,
          path: MaineventsWidget.routePath,
          builder: (context, params) => MaineventsWidget(),
        ),
        FFRoute(
          name: EditadmainWidget.routeName,
          path: EditadmainWidget.routePath,
          builder: (context, params) => EditadmainWidget(),
        ),
        FFRoute(
          name: SmartOpWidget.routeName,
          path: SmartOpWidget.routePath,
          builder: (context, params) => SmartOpWidget(),
        ),
        FFRoute(
          name: ComingSoonWidget.routeName,
          path: ComingSoonWidget.routePath,
          builder: (context, params) => ComingSoonWidget(),
        ),
        FFRoute(
          name: ComingSoonBrowseWidget.routeName,
          path: ComingSoonBrowseWidget.routePath,
          builder: (context, params) => ComingSoonBrowseWidget(),
        ),
        FFRoute(
          name: EventSubmittednewWidget.routeName,
          path: EventSubmittednewWidget.routePath,
          builder: (context, params) => EventSubmittednewWidget(),
        ),
        FFRoute(
          name: CreateEventneworWidget.routeName,
          path: CreateEventneworWidget.routePath,
          builder: (context, params) => CreateEventneworWidget(),
        ),
        FFRoute(
          name: VenuenewWidget.routeName,
          path: VenuenewWidget.routePath,
          builder: (context, params) => VenuenewWidget(),
        ),
        FFRoute(
          name: VabhaCopyWidget.routeName,
          path: VabhaCopyWidget.routePath,
          builder: (context, params) => VabhaCopyWidget(),
        ),
        FFRoute(
          name: ValulaCopyWidget.routeName,
          path: ValulaCopyWidget.routePath,
          builder: (context, params) => ValulaCopyWidget(),
        ),
        FFRoute(
          name: VdammCopyWidget.routeName,
          path: VdammCopyWidget.routePath,
          builder: (context, params) => VdammCopyWidget(),
        ),
        FFRoute(
          name: VhailCopyWidget.routeName,
          path: VhailCopyWidget.routePath,
          builder: (context, params) => VhailCopyWidget(),
        ),
        FFRoute(
          name: VjeddCopyWidget.routeName,
          path: VjeddCopyWidget.routePath,
          builder: (context, params) => VjeddCopyWidget(),
        ),
        FFRoute(
          name: VkhCopyWidget.routeName,
          path: VkhCopyWidget.routePath,
          builder: (context, params) => VkhCopyWidget(),
        ),
        FFRoute(
          name: VriyCopyWidget.routeName,
          path: VriyCopyWidget.routePath,
          builder: (context, params) => VriyCopyWidget(),
        ),
        FFRoute(
          name: VtaifCopyWidget.routeName,
          path: VtaifCopyWidget.routePath,
          builder: (context, params) => VtaifCopyWidget(),
        ),
        FFRoute(
          name: SmartOpCopyWidget.routeName,
          path: SmartOpCopyWidget.routePath,
          builder: (context, params) => SmartOpCopyWidget(),
        ),
        FFRoute(
          name: SmartOpCopyCopyWidget.routeName,
          path: SmartOpCopyCopyWidget.routePath,
          builder: (context, params) => SmartOpCopyCopyWidget(),
        ),
        FFRoute(
          name: OneToTowhoursWidget.routeName,
          path: OneToTowhoursWidget.routePath,
          builder: (context, params) => OneToTowhoursWidget(),
        ),
        FFRoute(
          name: FiveHoursWidget.routeName,
          path: FiveHoursWidget.routePath,
          builder: (context, params) => FiveHoursWidget(),
        ),
        FFRoute(
          name: ThreeToFourHoursWidget.routeName,
          path: ThreeToFourHoursWidget.routePath,
          builder: (context, params) => ThreeToFourHoursWidget(),
        ),
        FFRoute(
          name: InterfacebeforeloginCopyWidget.routeName,
          path: InterfacebeforeloginCopyWidget.routePath,
          builder: (context, params) => InterfacebeforeloginCopyWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/interfacebeforelogin';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
