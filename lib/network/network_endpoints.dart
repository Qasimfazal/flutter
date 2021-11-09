class NetworkEndpoints {
  // static const String BASE_HOTEL_IMAGE ="http://photos.hotelbeds.com/giata/original/";
  static const String BASE_HOTEL_IMAGE =
      "http://photos.hotelbeds.com/giata/bigger/";
  static const String BASE_URL = "https://soulfood.thesupportonline.net/api/";
  static const String HOTELS =
      "https://api.test.hotelbeds.com/hotel-api/1.0/hotels";
  static const String HOTEL_CONTENT =
      "https://api.test.hotelbeds.com/hotel-content-api/1.0/hotels";
  static const String HOTEL_DETAIL_CONTENT =
      "https://api.test.hotelbeds.com/hotel-content-api/1.0/hotels/{hotelCode}/details?language=ENG";
  static const String HOTEL_BOOKINGS =
      "https://api.test.hotelbeds.com/hotel-api/1.0/bookings";
  static const String EVENTS ="https://app.ticketmaster.com/discovery/v2/events.json";

  static const String API_LOGIN = BASE_URL + "login";
  static const String API_SIGN_UP = BASE_URL + "register";
  static const String IS_NUTRIONT_CORRECT = BASE_URL + "api/add-product/step2b";
  static const String IS_INGRIDENT_CORRECT =
      BASE_URL + "api/add-product/step3b";
  static const String STEP1 = BASE_URL + "api/add-product/step1";
  static const String STEP2 = BASE_URL + "api/add-product/step2a";
  static const String STEP3 = BASE_URL + "api/add-product/step3a";
  static const String TAGS = BASE_URL + "api/get-tags";
  static const String STORE_LOCATION = BASE_URL + "api/get-locations";
  static const String CHECK_DEVICE_EXISTS = BASE_URL + "api/app-user";
  static const String CATEGORY = BASE_URL + "api/get-categories";
  static const String STEP4TAGS = BASE_URL + "api/add-product/step4";
  static const String GET_PRODUCTS = BASE_URL + "api/get-products";
  static const String ADD_REMOVE_FROM_FAVOURITES =
      BASE_URL + "api/toggle-favourite";
  static const String ADD_RESEARCHER_PROGRESS1 =
      BASE_URL + "api/researcher-inprogress";

  static const String STORE_CATEGORIES = BASE_URL + "api/get-store-categories";
  static const String ADD_STORE = BASE_URL + "api/add-location";
  static const String PUBLISH = BASE_URL + "api/add-product/step5";
  static const String GET_FOOD_TYPES = BASE_URL + "api/get-types";
}
