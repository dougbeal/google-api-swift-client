// Package youtube provides access to the YouTube Data API.
//
// See https://developers.google.com/youtube/v3
//
// Usage example:
//
//   import "google.golang.org/api/youtube/v3"
//   ...
//   youtubeService, err := youtube.New(oauthHttpClient)
import Foundation
import Alamofire


// Package youtube provides access to the YouTube Data API.
//
// See https://developers.google.com/youtube/v3
//
// Usage example:
//
//   import "google.golang.org/api/youtube/v3"
//   ...
//   youtubeService, err := youtube.New(oauthHttpClient)
import SwiftyJSON

public struct youtube {
    static let apiId = "youtube:v3"
    static let apiName = "youtube"
    static let apiVersion = "v3"
    static let basePath = "https://www.googleapis.com/youtube/v3/"

// MARK: scope constants
    // OAuth2 scopes used by this API.
    struct scope {
        // Manage your YouTube account
        static let YoutubeScope = "https://www.googleapis.com/auth/youtube"

        // Manage your YouTube account
        static let YoutubeForceSslScope = "https://www.googleapis.com/auth/youtube.force-ssl"

        // View your YouTube account
        static let YoutubeReadonlyScope = "https://www.googleapis.com/auth/youtube.readonly"

        // Manage your YouTube videos
        static let YoutubeUploadScope = "https://www.googleapis.com/auth/youtube.upload"

        // View and manage your assets and associated content on YouTube
        static let YoutubepartnerScope = "https://www.googleapis.com/auth/youtubepartner"

        // View private information of your YouTube channel relevant during the
        // audit process with a YouTube partner
        static let YoutubepartnerChannelAuditScope = "https://www.googleapis.com/auth/youtubepartner-channel-audit"
    }


    static func New(client: Alamofire.Manager) -> Service {
        return Service( client: client, BasePath: youtube.basePath)
    }
}
//service

struct Service {
    init(client: Alamofire.Manager, BasePath: String) {
        self.client = client
        self.BasePath = BasePath
        self.Activities = ActivitiesService(s: self)
        self.ChannelBanners = ChannelBannersService(s: self)
        self.ChannelSections = ChannelSectionsService(s: self)
        self.Channels = ChannelsService(s: self)
        self.GuideCategories = GuideCategoriesService(s: self)
        self.I18nLanguages = I18nLanguagesService(s: self)
        self.I18nRegions = I18nRegionsService(s: self)
        self.LiveBroadcasts = LiveBroadcastsService(s: self)
        self.LiveStreams = LiveStreamsService(s: self)
        self.PlaylistItems = PlaylistItemsService(s: self)
        self.Playlists = PlaylistsService(s: self)
        self.Search = SearchService(s: self)
        self.Subscriptions = SubscriptionsService(s: self)
        self.Thumbnails = ThumbnailsService(s: self)
        self.VideoCategories = VideoCategoriesService(s: self)
        self.Videos = VideosService(s: self)
        self.Watermarks = WatermarksService(s: self)
    }
    let client: Alamofire.Manager
    let BasePath: String // API endpoint base URL
    let Activities: ActivitiesService
    let ChannelBanners: ChannelBannersService
    let ChannelSections: ChannelSectionsService
    let Channels: ChannelsService
    let GuideCategories: GuideCategoriesService
    let I18nLanguages: I18nLanguagesService
    let I18nRegions: I18nRegionsService
    let LiveBroadcasts: LiveBroadcastsService
    let LiveStreams: LiveStreamsService
    let PlaylistItems: PlaylistItemsService
    let Playlists: PlaylistsService
    let Search: SearchService
    let Subscriptions: SubscriptionsService
    let Thumbnails: ThumbnailsService
    let VideoCategories: VideoCategoriesService
    let Videos: VideosService
    let Watermarks: WatermarksService

}
// MARK: res generatetype
struct ActivitiesService {
    let s: Service
    var rs: ActivitiesService { get { return self } }
}
struct ChannelBannersService {
    let s: Service
    var rs: ChannelBannersService { get { return self } }
}
struct ChannelSectionsService {
    let s: Service
    var rs: ChannelSectionsService { get { return self } }
}
struct ChannelsService {
    let s: Service
    var rs: ChannelsService { get { return self } }
}
struct GuideCategoriesService {
    let s: Service
    var rs: GuideCategoriesService { get { return self } }
}
struct I18nLanguagesService {
    let s: Service
    var rs: I18nLanguagesService { get { return self } }
}
struct I18nRegionsService {
    let s: Service
    var rs: I18nRegionsService { get { return self } }
}
struct LiveBroadcastsService {
    let s: Service
    var rs: LiveBroadcastsService { get { return self } }
}
struct LiveStreamsService {
    let s: Service
    var rs: LiveStreamsService { get { return self } }
}
struct PlaylistItemsService {
    let s: Service
    var rs: PlaylistItemsService { get { return self } }
}
struct PlaylistsService {
    let s: Service
    var rs: PlaylistsService { get { return self } }
}
struct SearchService {
    let s: Service
    var rs: SearchService { get { return self } }
}
struct SubscriptionsService {
    let s: Service
    var rs: SubscriptionsService { get { return self } }
}
struct ThumbnailsService {
    let s: Service
    var rs: ThumbnailsService { get { return self } }
}
struct VideoCategoriesService {
    let s: Service
    var rs: VideoCategoriesService { get { return self } }
}
struct VideosService {
    let s: Service
    var rs: VideosService { get { return self } }
}
struct WatermarksService {
    let s: Service
    var rs: WatermarksService { get { return self } }
}
// MARK: schema code
// writeSchemaCode

// writeSchemaStruct

struct AccessPolicy {
    // allowed: The value of allowed indicates whether the access to the
    // policy is allowed or denied by default.
    let allowed: Bool //  json:"allowed,omitempty" 

    // exception: A list of region codes that identify countries where the
    // default policy do not apply.
    let exception: [String] //  json:"exception,omitempty" 

    static func decode (j: JSON) -> AccessPolicy {
        return AccessPolicy(
            allowed: j["allowed"].boolValue,
            exception: map( j["exception"].arrayValue, { $0.stringValue } )
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct Activity {
    // contentDetails: The contentDetails object contains information about
    // the content associated with the activity. For example, if the
    // snippet.type value is videoRated, then the contentDetails object's
    // content identifies the rated video.
    let contentDetails: ActivityContentDetails //  json:"contentDetails,omitempty" 

    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // id: The ID that YouTube uses to uniquely identify the activity.
    let id: String //  json:"id,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#activity".
    let kind: String //  json:"kind,omitempty" 

    // snippet: The snippet object contains basic details about the
    // activity, including the activity's type and group ID.
    let snippet: ActivitySnippet //  json:"snippet,omitempty" 

    static func decode (j: JSON) -> Activity {
        return Activity(
            contentDetails: ActivityContentDetails.decode(j["contentDetails"]),
            etag: j["etag"].stringValue,
            id: j["id"].stringValue,
            kind: j["kind"].stringValue,
            snippet: ActivitySnippet.decode(j["snippet"])
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct ActivityContentDetails {
    // bulletin: The bulletin object contains details about a channel
    // bulletin post. This object is only present if the snippet.type is
    // bulletin.
    let bulletin: ActivityContentDetailsBulletin //  json:"bulletin,omitempty" 

    // channelItem: The channelItem object contains details about a resource
    // which was added to a channel. This property is only present if the
    // snippet.type is channelItem.
    let channelItem: ActivityContentDetailsChannelItem //  json:"channelItem,omitempty" 

    // comment: The comment object contains information about a resource
    // that received a comment. This property is only present if the
    // snippet.type is comment.
    let comment: ActivityContentDetailsComment //  json:"comment,omitempty" 

    // favorite: The favorite object contains information about a video that
    // was marked as a favorite video. This property is only present if the
    // snippet.type is favorite.
    let favorite: ActivityContentDetailsFavorite //  json:"favorite,omitempty" 

    // like: The like object contains information about a resource that
    // received a positive (like) rating. This property is only present if
    // the snippet.type is like.
    let like: ActivityContentDetailsLike //  json:"like,omitempty" 

    // playlistItem: The playlistItem object contains information about a
    // new playlist item. This property is only present if the snippet.type
    // is playlistItem.
    let playlistItem: ActivityContentDetailsPlaylistItem //  json:"playlistItem,omitempty" 

    // promotedItem: The promotedItem object contains details about a
    // resource which is being promoted. This property is only present if
    // the snippet.type is promotedItem.
    let promotedItem: ActivityContentDetailsPromotedItem //  json:"promotedItem,omitempty" 

    // recommendation: The recommendation object contains information about
    // a recommended resource. This property is only present if the
    // snippet.type is recommendation.
    let recommendation: ActivityContentDetailsRecommendation //  json:"recommendation,omitempty" 

    // social: The social object contains details about a social network
    // post. This property is only present if the snippet.type is social.
    let social: ActivityContentDetailsSocial //  json:"social,omitempty" 

    // subscription: The subscription object contains information about a
    // channel that a user subscribed to. This property is only present if
    // the snippet.type is subscription.
    let subscription: ActivityContentDetailsSubscription //  json:"subscription,omitempty" 

    // upload: The upload object contains information about the uploaded
    // video. This property is only present if the snippet.type is upload.
    let upload: ActivityContentDetailsUpload //  json:"upload,omitempty" 

    static func decode (j: JSON) -> ActivityContentDetails {
        return ActivityContentDetails(
            bulletin: ActivityContentDetailsBulletin.decode(j["bulletin"]),
            channelItem: ActivityContentDetailsChannelItem.decode(j["channelItem"]),
            comment: ActivityContentDetailsComment.decode(j["comment"]),
            favorite: ActivityContentDetailsFavorite.decode(j["favorite"]),
            like: ActivityContentDetailsLike.decode(j["like"]),
            playlistItem: ActivityContentDetailsPlaylistItem.decode(j["playlistItem"]),
            promotedItem: ActivityContentDetailsPromotedItem.decode(j["promotedItem"]),
            recommendation: ActivityContentDetailsRecommendation.decode(j["recommendation"]),
            social: ActivityContentDetailsSocial.decode(j["social"]),
            subscription: ActivityContentDetailsSubscription.decode(j["subscription"]),
            upload: ActivityContentDetailsUpload.decode(j["upload"])
        )
    }
}
// writeSchemaCode

// writeSchemaCode

// writeSchemaStruct

struct GeoPoint {
    // altitude: Altitude above the reference ellipsoid, in meters.
    let altitude: Double //  json:"altitude,omitempty" 

    // latitude: Latitude in degrees.
    let latitude: Double //  json:"latitude,omitempty" 

    // longitude: Longitude in degrees.
    let longitude: Double //  json:"longitude,omitempty" 

    static func decode (j: JSON) -> GeoPoint {
        return GeoPoint(
            altitude: j["altitude"].doubleValue,
            latitude: j["latitude"].doubleValue,
            longitude: j["longitude"].doubleValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct GuideCategory {
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // id: The ID that YouTube uses to uniquely identify the guide category.
    let id: String //  json:"id,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#guideCategory".
    let kind: String //  json:"kind,omitempty" 

    // snippet: The snippet object contains basic details about the
    // category, such as its title.
    let snippet: GuideCategorySnippet //  json:"snippet,omitempty" 

    static func decode (j: JSON) -> GuideCategory {
        return GuideCategory(
            etag: j["etag"].stringValue,
            id: j["id"].stringValue,
            kind: j["kind"].stringValue,
            snippet: GuideCategorySnippet.decode(j["snippet"])
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct GuideCategoryListResponse {
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // eventId: Serialized EventId of the request which produced this
    // response.
    let eventId: String //  json:"eventId,omitempty" 

    // items: A list of categories that can be associated with YouTube
    // channels. In this map, the category ID is the map key, and its value
    // is the corresponding guideCategory resource.
    let items: [GuideCategory] //  json:"items,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#guideCategoryListResponse".
    let kind: String //  json:"kind,omitempty" 

    // nextPageToken: The token that can be used as the value of the
    // pageToken parameter to retrieve the next page in the result set.
    let nextPageToken: String //  json:"nextPageToken,omitempty" 

    let pageInfo: PageInfo //  json:"pageInfo,omitempty" 

    // prevPageToken: The token that can be used as the value of the
    // pageToken parameter to retrieve the previous page in the result set.
    let prevPageToken: String //  json:"prevPageToken,omitempty" 

    let tokenPagination: TokenPagination //  json:"tokenPagination,omitempty" 

    // visitorId: The visitorId identifies the visitor.
    let visitorId: String //  json:"visitorId,omitempty" 

    static func decode (j: JSON) -> GuideCategoryListResponse {
        return GuideCategoryListResponse(
            etag: j["etag"].stringValue,
            eventId: j["eventId"].stringValue,
            items: map( j["items"].arrayValue, { (json: JSON) -> GuideCategory in GuideCategory.decode(j["$0"]) } ),
            kind: j["kind"].stringValue,
            nextPageToken: j["nextPageToken"].stringValue,
            pageInfo: PageInfo.decode(j["pageInfo"]),
            prevPageToken: j["prevPageToken"].stringValue,
            tokenPagination: TokenPagination.decode(j["tokenPagination"]),
            visitorId: j["visitorId"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct GuideCategorySnippet {
    let channelId: String //  json:"channelId,omitempty" 

    // title: Description of the guide category.
    let title: String //  json:"title,omitempty" 

    static func decode (j: JSON) -> GuideCategorySnippet {
        return GuideCategorySnippet(
            channelId: j["channelId"].stringValue,
            title: j["title"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct I18nLanguage {
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // id: The ID that YouTube uses to uniquely identify the i18n language.
    let id: String //  json:"id,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#i18nLanguage".
    let kind: String //  json:"kind,omitempty" 

    // snippet: The snippet object contains basic details about the i18n
    // language, such as language code and human-readable name.
    let snippet: I18nLanguageSnippet //  json:"snippet,omitempty" 

    static func decode (j: JSON) -> I18nLanguage {
        return I18nLanguage(
            etag: j["etag"].stringValue,
            id: j["id"].stringValue,
            kind: j["kind"].stringValue,
            snippet: I18nLanguageSnippet.decode(j["snippet"])
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct I18nLanguageListResponse {
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // eventId: Serialized EventId of the request which produced this
    // response.
    let eventId: String //  json:"eventId,omitempty" 

    // items: A list of supported i18n languages. In this map, the i18n
    // language ID is the map key, and its value is the corresponding
    // i18nLanguage resource.
    let items: [I18nLanguage] //  json:"items,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#i18nLanguageListResponse".
    let kind: String //  json:"kind,omitempty" 

    // visitorId: The visitorId identifies the visitor.
    let visitorId: String //  json:"visitorId,omitempty" 

    static func decode (j: JSON) -> I18nLanguageListResponse {
        return I18nLanguageListResponse(
            etag: j["etag"].stringValue,
            eventId: j["eventId"].stringValue,
            items: map( j["items"].arrayValue, { (json: JSON) -> I18nLanguage in I18nLanguage.decode(j["$0"]) } ),
            kind: j["kind"].stringValue,
            visitorId: j["visitorId"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct I18nLanguageSnippet {
    // hl: A short BCP-47 code that uniquely identifies a language.
    let hl: String //  json:"hl,omitempty" 

    // name: The human-readable name of the language in the language itself.
    let name: String //  json:"name,omitempty" 

    static func decode (j: JSON) -> I18nLanguageSnippet {
        return I18nLanguageSnippet(
            hl: j["hl"].stringValue,
            name: j["name"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct I18nRegion {
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // id: The ID that YouTube uses to uniquely identify the i18n region.
    let id: String //  json:"id,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#i18nRegion".
    let kind: String //  json:"kind,omitempty" 

    // snippet: The snippet object contains basic details about the i18n
    // region, such as region code and human-readable name.
    let snippet: I18nRegionSnippet //  json:"snippet,omitempty" 

    static func decode (j: JSON) -> I18nRegion {
        return I18nRegion(
            etag: j["etag"].stringValue,
            id: j["id"].stringValue,
            kind: j["kind"].stringValue,
            snippet: I18nRegionSnippet.decode(j["snippet"])
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct I18nRegionListResponse {
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // eventId: Serialized EventId of the request which produced this
    // response.
    let eventId: String //  json:"eventId,omitempty" 

    // items: A list of regions where YouTube is available. In this map, the
    // i18n region ID is the map key, and its value is the corresponding
    // i18nRegion resource.
    let items: [I18nRegion] //  json:"items,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#i18nRegionListResponse".
    let kind: String //  json:"kind,omitempty" 

    // visitorId: The visitorId identifies the visitor.
    let visitorId: String //  json:"visitorId,omitempty" 

    static func decode (j: JSON) -> I18nRegionListResponse {
        return I18nRegionListResponse(
            etag: j["etag"].stringValue,
            eventId: j["eventId"].stringValue,
            items: map( j["items"].arrayValue, { (json: JSON) -> I18nRegion in I18nRegion.decode(j["$0"]) } ),
            kind: j["kind"].stringValue,
            visitorId: j["visitorId"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct I18nRegionSnippet {
    // gl: The region code as a 2-letter ISO country code.
    let gl: String //  json:"gl,omitempty" 

    // name: The human-readable name of the region.
    let name: String //  json:"name,omitempty" 

    static func decode (j: JSON) -> I18nRegionSnippet {
        return I18nRegionSnippet(
            gl: j["gl"].stringValue,
            name: j["name"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct ImageSettings {
    // backgroundImageUrl: The URL for the background image shown on the
    // video watch page. The image should be 1200px by 615px, with a maximum
    // file size of 128k.
    let backgroundImageUrl: LocalizedProperty //  json:"backgroundImageUrl,omitempty" 

    // bannerExternalUrl: This is used only in update requests; if it's set,
    // we use this URL to generate all of the above banner URLs.
    let bannerExternalUrl: String //  json:"bannerExternalUrl,omitempty" 

    // bannerImageUrl: Banner image. Desktop size (1060x175).
    let bannerImageUrl: String //  json:"bannerImageUrl,omitempty" 

    // bannerMobileExtraHdImageUrl: Banner image. Mobile size high
    // resolution (1440x395).
    let bannerMobileExtraHdImageUrl: String //  json:"bannerMobileExtraHdImageUrl,omitempty" 

    // bannerMobileHdImageUrl: Banner image. Mobile size high resolution
    // (1280x360).
    let bannerMobileHdImageUrl: String //  json:"bannerMobileHdImageUrl,omitempty" 

    // bannerMobileImageUrl: Banner image. Mobile size (640x175).
    let bannerMobileImageUrl: String //  json:"bannerMobileImageUrl,omitempty" 

    // bannerMobileLowImageUrl: Banner image. Mobile size low resolution
    // (320x88).
    let bannerMobileLowImageUrl: String //  json:"bannerMobileLowImageUrl,omitempty" 

    // bannerMobileMediumHdImageUrl: Banner image. Mobile size medium/high
    // resolution (960x263).
    let bannerMobileMediumHdImageUrl: String //  json:"bannerMobileMediumHdImageUrl,omitempty" 

    // bannerTabletExtraHdImageUrl: Banner image. Tablet size extra high
    // resolution (2560x424).
    let bannerTabletExtraHdImageUrl: String //  json:"bannerTabletExtraHdImageUrl,omitempty" 

    // bannerTabletHdImageUrl: Banner image. Tablet size high resolution
    // (2276x377).
    let bannerTabletHdImageUrl: String //  json:"bannerTabletHdImageUrl,omitempty" 

    // bannerTabletImageUrl: Banner image. Tablet size (1707x283).
    let bannerTabletImageUrl: String //  json:"bannerTabletImageUrl,omitempty" 

    // bannerTabletLowImageUrl: Banner image. Tablet size low resolution
    // (1138x188).
    let bannerTabletLowImageUrl: String //  json:"bannerTabletLowImageUrl,omitempty" 

    // bannerTvHighImageUrl: Banner image. TV size high resolution
    // (1920x1080).
    let bannerTvHighImageUrl: String //  json:"bannerTvHighImageUrl,omitempty" 

    // bannerTvImageUrl: Banner image. TV size extra high resolution
    // (2120x1192).
    let bannerTvImageUrl: String //  json:"bannerTvImageUrl,omitempty" 

    // bannerTvLowImageUrl: Banner image. TV size low resolution (854x480).
    let bannerTvLowImageUrl: String //  json:"bannerTvLowImageUrl,omitempty" 

    // bannerTvMediumImageUrl: Banner image. TV size medium resolution
    // (1280x720).
    let bannerTvMediumImageUrl: String //  json:"bannerTvMediumImageUrl,omitempty" 

    // largeBrandedBannerImageImapScript: The image map script for the large
    // banner image.
    let largeBrandedBannerImageImapScript: LocalizedProperty //  json:"largeBrandedBannerImageImapScript,omitempty" 

    // largeBrandedBannerImageUrl: The URL for the 854px by 70px image that
    // appears below the video player in the expanded video view of the
    // video watch page.
    let largeBrandedBannerImageUrl: LocalizedProperty //  json:"largeBrandedBannerImageUrl,omitempty" 

    // smallBrandedBannerImageImapScript: The image map script for the small
    // banner image.
    let smallBrandedBannerImageImapScript: LocalizedProperty //  json:"smallBrandedBannerImageImapScript,omitempty" 

    // smallBrandedBannerImageUrl: The URL for the 640px by 70px banner
    // image that appears below the video player in the default view of the
    // video watch page.
    let smallBrandedBannerImageUrl: LocalizedProperty //  json:"smallBrandedBannerImageUrl,omitempty" 

    // trackingImageUrl: The URL for a 1px by 1px tracking pixel that can be
    // used to collect statistics for views of the channel or video pages.
    let trackingImageUrl: String //  json:"trackingImageUrl,omitempty" 

    // watchIconImageUrl: The URL for the image that appears above the
    // top-left corner of the video player. This is a 25-pixel-high image
    // with a flexible width that cannot exceed 170 pixels.
    let watchIconImageUrl: String //  json:"watchIconImageUrl,omitempty" 

    static func decode (j: JSON) -> ImageSettings {
        return ImageSettings(
            backgroundImageUrl: LocalizedProperty.decode(j["backgroundImageUrl"]),
            bannerExternalUrl: j["bannerExternalUrl"].stringValue,
            bannerImageUrl: j["bannerImageUrl"].stringValue,
            bannerMobileExtraHdImageUrl: j["bannerMobileExtraHdImageUrl"].stringValue,
            bannerMobileHdImageUrl: j["bannerMobileHdImageUrl"].stringValue,
            bannerMobileImageUrl: j["bannerMobileImageUrl"].stringValue,
            bannerMobileLowImageUrl: j["bannerMobileLowImageUrl"].stringValue,
            bannerMobileMediumHdImageUrl: j["bannerMobileMediumHdImageUrl"].stringValue,
            bannerTabletExtraHdImageUrl: j["bannerTabletExtraHdImageUrl"].stringValue,
            bannerTabletHdImageUrl: j["bannerTabletHdImageUrl"].stringValue,
            bannerTabletImageUrl: j["bannerTabletImageUrl"].stringValue,
            bannerTabletLowImageUrl: j["bannerTabletLowImageUrl"].stringValue,
            bannerTvHighImageUrl: j["bannerTvHighImageUrl"].stringValue,
            bannerTvImageUrl: j["bannerTvImageUrl"].stringValue,
            bannerTvLowImageUrl: j["bannerTvLowImageUrl"].stringValue,
            bannerTvMediumImageUrl: j["bannerTvMediumImageUrl"].stringValue,
            largeBrandedBannerImageImapScript: LocalizedProperty.decode(j["largeBrandedBannerImageImapScript"]),
            largeBrandedBannerImageUrl: LocalizedProperty.decode(j["largeBrandedBannerImageUrl"]),
            smallBrandedBannerImageImapScript: LocalizedProperty.decode(j["smallBrandedBannerImageImapScript"]),
            smallBrandedBannerImageUrl: LocalizedProperty.decode(j["smallBrandedBannerImageUrl"]),
            trackingImageUrl: j["trackingImageUrl"].stringValue,
            watchIconImageUrl: j["watchIconImageUrl"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct IngestionInfo {
    // backupIngestionAddress: The backup ingestion URL that you should use
    // to stream video to YouTube. You have the option of simultaneously
    // streaming the content that you are sending to the ingestionAddress to
    // this URL.
    let backupIngestionAddress: String //  json:"backupIngestionAddress,omitempty" 

    // ingestionAddress: The primary ingestion URL that you should use to
    // stream video to YouTube. You must stream video to this
    // URL.
    // 
    // Depending on which application or tool you use to encode your
    // video stream, you may need to enter the stream URL and stream name
    // separately or you may need to concatenate them in the following
    // format:
    // 
    // STREAM_URL/STREAM_NAME
    let ingestionAddress: String //  json:"ingestionAddress,omitempty" 

    // streamName: The HTTP or RTMP stream name that YouTube assigns to the
    // video stream.
    let streamName: String //  json:"streamName,omitempty" 

    static func decode (j: JSON) -> IngestionInfo {
        return IngestionInfo(
            backupIngestionAddress: j["backupIngestionAddress"].stringValue,
            ingestionAddress: j["ingestionAddress"].stringValue,
            streamName: j["streamName"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct InvideoBranding {
    let imageBytes: String //  json:"imageBytes,omitempty" 

    let imageUrl: String //  json:"imageUrl,omitempty" 

    let position: InvideoPosition //  json:"position,omitempty" 

    let targetChannelId: String //  json:"targetChannelId,omitempty" 

    let timing: InvideoTiming //  json:"timing,omitempty" 

    static func decode (j: JSON) -> InvideoBranding {
        return InvideoBranding(
            imageBytes: j["imageBytes"].stringValue,
            imageUrl: j["imageUrl"].stringValue,
            position: InvideoPosition.decode(j["position"]),
            targetChannelId: j["targetChannelId"].stringValue,
            timing: InvideoTiming.decode(j["timing"])
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct InvideoPosition {
    // cornerPosition: Describes in which corner of the video the visual
    // widget will appear.
    let cornerPosition: String //  json:"cornerPosition,omitempty" 

    // type_: Defines the position type.
    let type_: String //  json:"type,omitempty" 

    static func decode (j: JSON) -> InvideoPosition {
        return InvideoPosition(
            cornerPosition: j["cornerPosition"].stringValue,
            type_: j["type"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct InvideoPromotion {
    // defaultTiming: The default temporal position within the video where
    // the promoted item will be displayed. Can be overriden by more
    // specific timing in the item.
    let defaultTiming: InvideoTiming //  json:"defaultTiming,omitempty" 

    // items: List of promoted items in decreasing priority.
    let items: [PromotedItem] //  json:"items,omitempty" 

    // position: The spatial position within the video where the promoted
    // item will be displayed.
    let position: InvideoPosition //  json:"position,omitempty" 

    // useSmartTiming: Indicates whether the channel's promotional campaign
    // uses "smart timing." This feature attempts to show promotions at a
    // point in the video when they are more likely to be clicked and less
    // likely to disrupt the viewing experience. This feature also picks up
    // a single promotion to show on each video.
    let useSmartTiming: Bool //  json:"useSmartTiming,omitempty" 

    static func decode (j: JSON) -> InvideoPromotion {
        return InvideoPromotion(
            defaultTiming: InvideoTiming.decode(j["defaultTiming"]),
            items: map( j["items"].arrayValue, { (json: JSON) -> PromotedItem in PromotedItem.decode(j["$0"]) } ),
            position: InvideoPosition.decode(j["position"]),
            useSmartTiming: j["useSmartTiming"].boolValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct InvideoTiming {
    // durationMs: Defines the duration in milliseconds for which the
    // promotion should be displayed. If missing, the client should use the
    // default.
    let durationMs: UInt64 //  json:"durationMs,omitempty,string" 

    // offsetMs: Defines the time at which the promotion will appear.
    // Depending on the value of type the value of the offsetMs field will
    // represent a time offset from the start or from the end of the video,
    // expressed in milliseconds.
    let offsetMs: UInt64 //  json:"offsetMs,omitempty,string" 

    // type_: Describes a timing type. If the value is offsetFromStart, then
    // the offsetMs field represents an offset from the start of the video.
    // If the value is offsetFromEnd, then the offsetMs field represents an
    // offset from the end of the video.
    let type_: String //  json:"type,omitempty" 

    static func decode (j: JSON) -> InvideoTiming {
        return InvideoTiming(
            durationMs: j["durationMs"].uint64Value,
            offsetMs: j["offsetMs"].uint64Value,
            type_: j["type"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct LanguageTag {
    let value: String //  json:"value,omitempty" 

    static func decode (j: JSON) -> LanguageTag {
        return LanguageTag(
            value: j["value"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct LiveBroadcast {
    // contentDetails: The contentDetails object contains information about
    // the event's video content, such as whether the content can be shown
    // in an embedded video player or if it will be archived and therefore
    // available for viewing after the event has concluded.
    let contentDetails: LiveBroadcastContentDetails //  json:"contentDetails,omitempty" 

    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // id: The ID that YouTube assigns to uniquely identify the broadcast.
    let id: String //  json:"id,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#liveBroadcast".
    let kind: String //  json:"kind,omitempty" 

    // snippet: The snippet object contains basic details about the event,
    // including its title, description, start time, and end time.
    let snippet: LiveBroadcastSnippet //  json:"snippet,omitempty" 

    // status: The status object contains information about the event's
    // status.
    let status: LiveBroadcastStatus //  json:"status,omitempty" 

    static func decode (j: JSON) -> LiveBroadcast {
        return LiveBroadcast(
            contentDetails: LiveBroadcastContentDetails.decode(j["contentDetails"]),
            etag: j["etag"].stringValue,
            id: j["id"].stringValue,
            kind: j["kind"].stringValue,
            snippet: LiveBroadcastSnippet.decode(j["snippet"]),
            status: LiveBroadcastStatus.decode(j["status"])
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct LiveBroadcastContentDetails {
    // boundStreamId: This value uniquely identifies the live stream bound
    // to the broadcast.
    let boundStreamId: String //  json:"boundStreamId,omitempty" 

    // enableClosedCaptions: This setting indicates whether closed
    // captioning is enabled for this broadcast. The ingestion URL of the
    // closed captions is returned through the liveStreams API.
    let enableClosedCaptions: Bool //  json:"enableClosedCaptions,omitempty" 

    // enableContentEncryption: This setting indicates whether YouTube
    // should enable content encryption for the broadcast.
    let enableContentEncryption: Bool //  json:"enableContentEncryption,omitempty" 

    // enableDvr: This setting determines whether viewers can access DVR
    // controls while watching the video. DVR controls enable the viewer to
    // control the video playback experience by pausing, rewinding, or fast
    // forwarding content. The default value for this property is
    // true.
    // 
    // 
    // 
    // Important: You must set the value to true and also set the
    // enableArchive property's value to true if you want to make playback
    // available immediately after the broadcast ends.
    let enableDvr: Bool //  json:"enableDvr,omitempty" 

    // enableEmbed: This setting indicates whether the broadcast video can
    // be played in an embedded player. If you choose to archive the video
    // (using the enableArchive property), this setting will also apply to
    // the archived video.
    let enableEmbed: Bool //  json:"enableEmbed,omitempty" 

    // monitorStream: The monitorStream object contains information about
    // the monitor stream, which the broadcaster can use to review the event
    // content before the broadcast stream is shown publicly.
    let monitorStream: MonitorStreamInfo //  json:"monitorStream,omitempty" 

    // recordFromStart: Automatically start recording after the event goes
    // live. The default value for this property is true.
    // 
    // 
    // 
    // Important: You
    // must also set the enableDvr property's value to true if you want the
    // playback to be available immediately after the broadcast ends. If you
    // set this property's value to true but do not also set the enableDvr
    // property to true, there may be a delay of around one day before the
    // archived video will be available for playback.
    let recordFromStart: Bool //  json:"recordFromStart,omitempty" 

    // startWithSlate: This setting indicates whether the broadcast should
    // automatically begin with an in-stream slate when you update the
    // broadcast's status to live. After updating the status, you then need
    // to send a liveCuepoints.insert request that sets the cuepoint's
    // eventState to end to remove the in-stream slate and make your
    // broadcast stream visible to viewers.
    let startWithSlate: Bool //  json:"startWithSlate,omitempty" 

    static func decode (j: JSON) -> LiveBroadcastContentDetails {
        return LiveBroadcastContentDetails(
            boundStreamId: j["boundStreamId"].stringValue,
            enableClosedCaptions: j["enableClosedCaptions"].boolValue,
            enableContentEncryption: j["enableContentEncryption"].boolValue,
            enableDvr: j["enableDvr"].boolValue,
            enableEmbed: j["enableEmbed"].boolValue,
            monitorStream: MonitorStreamInfo.decode(j["monitorStream"]),
            recordFromStart: j["recordFromStart"].boolValue,
            startWithSlate: j["startWithSlate"].boolValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct LiveBroadcastListResponse {
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // eventId: Serialized EventId of the request which produced this
    // response.
    let eventId: String //  json:"eventId,omitempty" 

    // items: A list of broadcasts that match the request criteria.
    let items: [LiveBroadcast] //  json:"items,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#liveBroadcastListResponse".
    let kind: String //  json:"kind,omitempty" 

    // nextPageToken: The token that can be used as the value of the
    // pageToken parameter to retrieve the next page in the result set.
    let nextPageToken: String //  json:"nextPageToken,omitempty" 

    let pageInfo: PageInfo //  json:"pageInfo,omitempty" 

    // prevPageToken: The token that can be used as the value of the
    // pageToken parameter to retrieve the previous page in the result set.
    let prevPageToken: String //  json:"prevPageToken,omitempty" 

    let tokenPagination: TokenPagination //  json:"tokenPagination,omitempty" 

    // visitorId: The visitorId identifies the visitor.
    let visitorId: String //  json:"visitorId,omitempty" 

    static func decode (j: JSON) -> LiveBroadcastListResponse {
        return LiveBroadcastListResponse(
            etag: j["etag"].stringValue,
            eventId: j["eventId"].stringValue,
            items: map( j["items"].arrayValue, { (json: JSON) -> LiveBroadcast in LiveBroadcast.decode(j["$0"]) } ),
            kind: j["kind"].stringValue,
            nextPageToken: j["nextPageToken"].stringValue,
            pageInfo: PageInfo.decode(j["pageInfo"]),
            prevPageToken: j["prevPageToken"].stringValue,
            tokenPagination: TokenPagination.decode(j["tokenPagination"]),
            visitorId: j["visitorId"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct LiveBroadcastSnippet {
    // actualEndTime: The date and time that the broadcast actually ended.
    // This information is only available once the broadcast's state is
    // complete. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ)
    // format.
    let actualEndTime: String //  json:"actualEndTime,omitempty" 

    // actualStartTime: The date and time that the broadcast actually
    // started. This information is only available once the broadcast's
    // state is live. The value is specified in ISO 8601
    // (YYYY-MM-DDThh:mm:ss.sZ) format.
    let actualStartTime: String //  json:"actualStartTime,omitempty" 

    // channelId: The ID that YouTube uses to uniquely identify the channel
    // that is publishing the broadcast.
    let channelId: String //  json:"channelId,omitempty" 

    // description: The broadcast's description. As with the title, you can
    // set this field by modifying the broadcast resource or by setting the
    // description field of the corresponding video resource.
    let description: String //  json:"description,omitempty" 

    // publishedAt: The date and time that the broadcast was added to
    // YouTube's live broadcast schedule. The value is specified in ISO 8601
    // (YYYY-MM-DDThh:mm:ss.sZ) format.
    let publishedAt: String //  json:"publishedAt,omitempty" 

    // scheduledEndTime: The date and time that the broadcast is scheduled
    // to end. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ)
    // format.
    let scheduledEndTime: String //  json:"scheduledEndTime,omitempty" 

    // scheduledStartTime: The date and time that the broadcast is scheduled
    // to start. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ)
    // format.
    let scheduledStartTime: String //  json:"scheduledStartTime,omitempty" 

    // thumbnails: A map of thumbnail images associated with the broadcast.
    // For each nested object in this object, the key is the name of the
    // thumbnail image, and the value is an object that contains other
    // information about the thumbnail.
    let thumbnails: ThumbnailDetails //  json:"thumbnails,omitempty" 

    // title: The broadcast's title. Note that the broadcast represents
    // exactly one YouTube video. You can set this field by modifying the
    // broadcast resource or by setting the title field of the corresponding
    // video resource.
    let title: String //  json:"title,omitempty" 

    static func decode (j: JSON) -> LiveBroadcastSnippet {
        return LiveBroadcastSnippet(
            actualEndTime: j["actualEndTime"].stringValue,
            actualStartTime: j["actualStartTime"].stringValue,
            channelId: j["channelId"].stringValue,
            description: j["description"].stringValue,
            publishedAt: j["publishedAt"].stringValue,
            scheduledEndTime: j["scheduledEndTime"].stringValue,
            scheduledStartTime: j["scheduledStartTime"].stringValue,
            thumbnails: ThumbnailDetails.decode(j["thumbnails"]),
            title: j["title"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct LiveBroadcastStatus {
    // lifeCycleStatus: The broadcast's status. The status can be updated
    // using the API's liveBroadcasts.transition method.
    let lifeCycleStatus: String //  json:"lifeCycleStatus,omitempty" 

    // liveBroadcastPriority: Priority of the live broadcast event (internal
    // state).
    let liveBroadcastPriority: String //  json:"liveBroadcastPriority,omitempty" 

    // privacyStatus: The broadcast's privacy status. Note that the
    // broadcast represents exactly one YouTube video, so the privacy
    // settings are identical to those supported for videos. In addition,
    // you can set this field by modifying the broadcast resource or by
    // setting the privacyStatus field of the corresponding video resource.
    let privacyStatus: String //  json:"privacyStatus,omitempty" 

    // recordingStatus: The broadcast's recording status.
    let recordingStatus: String //  json:"recordingStatus,omitempty" 

    static func decode (j: JSON) -> LiveBroadcastStatus {
        return LiveBroadcastStatus(
            lifeCycleStatus: j["lifeCycleStatus"].stringValue,
            liveBroadcastPriority: j["liveBroadcastPriority"].stringValue,
            privacyStatus: j["privacyStatus"].stringValue,
            recordingStatus: j["recordingStatus"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct LiveStream {
    // cdn: The cdn object defines the live stream's content delivery
    // network (CDN) settings. These settings provide details about the
    // manner in which you stream your content to YouTube.
    let cdn: CdnSettings //  json:"cdn,omitempty" 

    // contentDetails: The content_details object contains information about
    // the stream, including the closed captions ingestion URL.
    let contentDetails: LiveStreamContentDetails //  json:"contentDetails,omitempty" 

    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // id: The ID that YouTube assigns to uniquely identify the stream.
    let id: String //  json:"id,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#liveStream".
    let kind: String //  json:"kind,omitempty" 

    // snippet: The snippet object contains basic details about the stream,
    // including its channel, title, and description.
    let snippet: LiveStreamSnippet //  json:"snippet,omitempty" 

    // status: The status object contains information about live stream's
    // status.
    let status: LiveStreamStatus //  json:"status,omitempty" 

    static func decode (j: JSON) -> LiveStream {
        return LiveStream(
            cdn: CdnSettings.decode(j["cdn"]),
            contentDetails: LiveStreamContentDetails.decode(j["contentDetails"]),
            etag: j["etag"].stringValue,
            id: j["id"].stringValue,
            kind: j["kind"].stringValue,
            snippet: LiveStreamSnippet.decode(j["snippet"]),
            status: LiveStreamStatus.decode(j["status"])
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct LiveStreamContentDetails {
    // closedCaptionsIngestionUrl: The ingestion URL where the closed
    // captions of this stream are sent.
    let closedCaptionsIngestionUrl: String //  json:"closedCaptionsIngestionUrl,omitempty" 

    // isReusable: Indicates whether the stream is reusable, which means
    // that it can be bound to multiple broadcasts. It is common for
    // broadcasters to reuse the same stream for many different broadcasts
    // if those broadcasts occur at different times.
    // 
    // If you set this value
    // to false, then the stream will not be reusable, which means that it
    // can only be bound to one broadcast. Non-reusable streams differ from
    // reusable streams in the following ways:  
    // - A non-reusable stream can
    // only be bound to one broadcast. 
    // - A non-reusable stream might be
    // deleted by an automated process after the broadcast ends. 
    // - The 
    // liveStreams.list method does not list non-reusable streams if you
    // call the method and set the mine parameter to true. The only way to
    // use that method to retrieve the resource for a non-reusable stream is
    // to use the id parameter to identify the stream.
    let isReusable: Bool //  json:"isReusable,omitempty" 

    static func decode (j: JSON) -> LiveStreamContentDetails {
        return LiveStreamContentDetails(
            closedCaptionsIngestionUrl: j["closedCaptionsIngestionUrl"].stringValue,
            isReusable: j["isReusable"].boolValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct LiveStreamListResponse {
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // eventId: Serialized EventId of the request which produced this
    // response.
    let eventId: String //  json:"eventId,omitempty" 

    // items: A list of live streams that match the request criteria.
    let items: [LiveStream] //  json:"items,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#liveStreamListResponse".
    let kind: String //  json:"kind,omitempty" 

    // nextPageToken: The token that can be used as the value of the
    // pageToken parameter to retrieve the next page in the result set.
    let nextPageToken: String //  json:"nextPageToken,omitempty" 

    let pageInfo: PageInfo //  json:"pageInfo,omitempty" 

    // prevPageToken: The token that can be used as the value of the
    // pageToken parameter to retrieve the previous page in the result set.
    let prevPageToken: String //  json:"prevPageToken,omitempty" 

    let tokenPagination: TokenPagination //  json:"tokenPagination,omitempty" 

    // visitorId: The visitorId identifies the visitor.
    let visitorId: String //  json:"visitorId,omitempty" 

    static func decode (j: JSON) -> LiveStreamListResponse {
        return LiveStreamListResponse(
            etag: j["etag"].stringValue,
            eventId: j["eventId"].stringValue,
            items: map( j["items"].arrayValue, { (json: JSON) -> LiveStream in LiveStream.decode(j["$0"]) } ),
            kind: j["kind"].stringValue,
            nextPageToken: j["nextPageToken"].stringValue,
            pageInfo: PageInfo.decode(j["pageInfo"]),
            prevPageToken: j["prevPageToken"].stringValue,
            tokenPagination: TokenPagination.decode(j["tokenPagination"]),
            visitorId: j["visitorId"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct LiveStreamSnippet {
    // channelId: The ID that YouTube uses to uniquely identify the channel
    // that is transmitting the stream.
    let channelId: String //  json:"channelId,omitempty" 

    // description: The stream's description. The value cannot be longer
    // than 10000 characters.
    let description: String //  json:"description,omitempty" 

    // publishedAt: The date and time that the stream was created. The value
    // is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
    let publishedAt: String //  json:"publishedAt,omitempty" 

    // title: The stream's title. The value must be between 1 and 128
    // characters long.
    let title: String //  json:"title,omitempty" 

    static func decode (j: JSON) -> LiveStreamSnippet {
        return LiveStreamSnippet(
            channelId: j["channelId"].stringValue,
            description: j["description"].stringValue,
            publishedAt: j["publishedAt"].stringValue,
            title: j["title"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct LiveStreamStatus {
    let streamStatus: String //  json:"streamStatus,omitempty" 

    static func decode (j: JSON) -> LiveStreamStatus {
        return LiveStreamStatus(
            streamStatus: j["streamStatus"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct LocalizedProperty {
    let default_: String //  json:"default,omitempty" 

    // defaultLanguage: The language of the default property.
    let defaultLanguage: LanguageTag //  json:"defaultLanguage,omitempty" 

    let localized: [LocalizedString] //  json:"localized,omitempty" 

    static func decode (j: JSON) -> LocalizedProperty {
        return LocalizedProperty(
            default_: j["default"].stringValue,
            defaultLanguage: LanguageTag.decode(j["defaultLanguage"]),
            localized: map( j["localized"].arrayValue, { (json: JSON) -> LocalizedString in LocalizedString.decode(j["$0"]) } )
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct LocalizedString {
    let language: String //  json:"language,omitempty" 

    let value: String //  json:"value,omitempty" 

    static func decode (j: JSON) -> LocalizedString {
        return LocalizedString(
            language: j["language"].stringValue,
            value: j["value"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct MonitorStreamInfo {
    // broadcastStreamDelayMs: If you have set the enableMonitorStream
    // property to true, then this property determines the length of the
    // live broadcast delay.
    let broadcastStreamDelayMs: Int64 //  json:"broadcastStreamDelayMs,omitempty" 

    // embedHtml: HTML code that embeds a player that plays the monitor
    // stream.
    let embedHtml: String //  json:"embedHtml,omitempty" 

    // enableMonitorStream: This value determines whether the monitor stream
    // is enabled for the broadcast. If the monitor stream is enabled, then
    // YouTube will broadcast the event content on a special stream intended
    // only for the broadcaster's consumption. The broadcaster can use the
    // stream to review the event content and also to identify the optimal
    // times to insert cuepoints.
    // 
    // You need to set this value to true if you
    // intend to have a broadcast delay for your event.
    // 
    // Note: This property
    // cannot be updated once the broadcast is in the testing or live state.
    let enableMonitorStream: Bool //  json:"enableMonitorStream,omitempty" 

    static func decode (j: JSON) -> MonitorStreamInfo {
        return MonitorStreamInfo(
            broadcastStreamDelayMs: j["broadcastStreamDelayMs"].int64Value,
            embedHtml: j["embedHtml"].stringValue,
            enableMonitorStream: j["enableMonitorStream"].boolValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PageInfo {
    // resultsPerPage: The number of results included in the API response.
    let resultsPerPage: Int64 //  json:"resultsPerPage,omitempty" 

    // totalResults: The total number of results in the result set.
    let totalResults: Int64 //  json:"totalResults,omitempty" 

    static func decode (j: JSON) -> PageInfo {
        return PageInfo(
            resultsPerPage: j["resultsPerPage"].int64Value,
            totalResults: j["totalResults"].int64Value
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct Playlist {
    // contentDetails: The contentDetails object contains information like
    // video count.
    let contentDetails: PlaylistContentDetails //  json:"contentDetails,omitempty" 

    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // id: The ID that YouTube uses to uniquely identify the playlist.
    let id: String //  json:"id,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#playlist".
    let kind: String //  json:"kind,omitempty" 

    // localizations: Localizations for different languages
    let localizations: [String: PlaylistLocalization] //  json:"localizations,omitempty" 

    // player: The player object contains information that you would use to
    // play the playlist in an embedded player.
    let player: PlaylistPlayer //  json:"player,omitempty" 

    // snippet: The snippet object contains basic details about the
    // playlist, such as its title and description.
    let snippet: PlaylistSnippet //  json:"snippet,omitempty" 

    // status: The status object contains status information for the
    // playlist.
    let status: PlaylistStatus //  json:"status,omitempty" 

    static func decode (j: JSON) -> Playlist {
        return Playlist(
            contentDetails: PlaylistContentDetails.decode(j["contentDetails"]),
            etag: j["etag"].stringValue,
            id: j["id"].stringValue,
            kind: j["kind"].stringValue,
            localizations: reduce( map( j["localizations"].dictionaryValue, { return ($0, PlaylistLocalization.decode($1)) }),[String: PlaylistLocalization](), { (dict, pair: (String, PlaylistLocalization)) -> (dict) in dict[pair.0] = pair.1 } ),
            player: PlaylistPlayer.decode(j["player"]),
            snippet: PlaylistSnippet.decode(j["snippet"]),
            status: PlaylistStatus.decode(j["status"])
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PlaylistContentDetails {
    // itemCount: The number of videos in the playlist.
    let itemCount: Int64 //  json:"itemCount,omitempty" 

    static func decode (j: JSON) -> PlaylistContentDetails {
        return PlaylistContentDetails(
            itemCount: j["itemCount"].int64Value
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PlaylistItem {
    // contentDetails: The contentDetails object is included in the resource
    // if the included item is a YouTube video. The object contains
    // additional information about the video.
    let contentDetails: PlaylistItemContentDetails //  json:"contentDetails,omitempty" 

    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // id: The ID that YouTube uses to uniquely identify the playlist item.
    let id: String //  json:"id,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#playlistItem".
    let kind: String //  json:"kind,omitempty" 

    // snippet: The snippet object contains basic details about the playlist
    // item, such as its title and position in the playlist.
    let snippet: PlaylistItemSnippet //  json:"snippet,omitempty" 

    // status: The status object contains information about the playlist
    // item's privacy status.
    let status: PlaylistItemStatus //  json:"status,omitempty" 

    static func decode (j: JSON) -> PlaylistItem {
        return PlaylistItem(
            contentDetails: PlaylistItemContentDetails.decode(j["contentDetails"]),
            etag: j["etag"].stringValue,
            id: j["id"].stringValue,
            kind: j["kind"].stringValue,
            snippet: PlaylistItemSnippet.decode(j["snippet"]),
            status: PlaylistItemStatus.decode(j["status"])
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PlaylistItemContentDetails {
    // endAt: The time, measured in seconds from the start of the video,
    // when the video should stop playing. (The playlist owner can specify
    // the times when the video should start and stop playing when the video
    // is played in the context of the playlist.) By default, assume that
    // the video.endTime is the end of the video.
    let endAt: String //  json:"endAt,omitempty" 

    // note: A user-generated note for this item.
    let note: String //  json:"note,omitempty" 

    // startAt: The time, measured in seconds from the start of the video,
    // when the video should start playing. (The playlist owner can specify
    // the times when the video should start and stop playing when the video
    // is played in the context of the playlist.) The default value is 0.
    let startAt: String //  json:"startAt,omitempty" 

    // videoId: The ID that YouTube uses to uniquely identify a video. To
    // retrieve the video resource, set the id query parameter to this value
    // in your API request.
    let videoId: String //  json:"videoId,omitempty" 

    static func decode (j: JSON) -> PlaylistItemContentDetails {
        return PlaylistItemContentDetails(
            endAt: j["endAt"].stringValue,
            note: j["note"].stringValue,
            startAt: j["startAt"].stringValue,
            videoId: j["videoId"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PlaylistItemListResponse {
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // eventId: Serialized EventId of the request which produced this
    // response.
    let eventId: String //  json:"eventId,omitempty" 

    // items: A list of playlist items that match the request criteria.
    let items: [PlaylistItem] //  json:"items,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#playlistItemListResponse".
    let kind: String //  json:"kind,omitempty" 

    // nextPageToken: The token that can be used as the value of the
    // pageToken parameter to retrieve the next page in the result set.
    let nextPageToken: String //  json:"nextPageToken,omitempty" 

    let pageInfo: PageInfo //  json:"pageInfo,omitempty" 

    // prevPageToken: The token that can be used as the value of the
    // pageToken parameter to retrieve the previous page in the result set.
    let prevPageToken: String //  json:"prevPageToken,omitempty" 

    let tokenPagination: TokenPagination //  json:"tokenPagination,omitempty" 

    // visitorId: The visitorId identifies the visitor.
    let visitorId: String //  json:"visitorId,omitempty" 

    static func decode (j: JSON) -> PlaylistItemListResponse {
        return PlaylistItemListResponse(
            etag: j["etag"].stringValue,
            eventId: j["eventId"].stringValue,
            items: map( j["items"].arrayValue, { (json: JSON) -> PlaylistItem in PlaylistItem.decode(j["$0"]) } ),
            kind: j["kind"].stringValue,
            nextPageToken: j["nextPageToken"].stringValue,
            pageInfo: PageInfo.decode(j["pageInfo"]),
            prevPageToken: j["prevPageToken"].stringValue,
            tokenPagination: TokenPagination.decode(j["tokenPagination"]),
            visitorId: j["visitorId"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PlaylistItemSnippet {
    // channelId: The ID that YouTube uses to uniquely identify the user
    // that added the item to the playlist.
    let channelId: String //  json:"channelId,omitempty" 

    // channelTitle: Channel title for the channel that the playlist item
    // belongs to.
    let channelTitle: String //  json:"channelTitle,omitempty" 

    // description: The item's description.
    let description: String //  json:"description,omitempty" 

    // playlistId: The ID that YouTube uses to uniquely identify the
    // playlist that the playlist item is in.
    let playlistId: String //  json:"playlistId,omitempty" 

    // position: The order in which the item appears in the playlist. The
    // value uses a zero-based index, so the first item has a position of 0,
    // the second item has a position of 1, and so forth.
    let position: Int64 //  json:"position,omitempty" 

    // publishedAt: The date and time that the item was added to the
    // playlist. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ)
    // format.
    let publishedAt: String //  json:"publishedAt,omitempty" 

    // resourceId: The id object contains information that can be used to
    // uniquely identify the resource that is included in the playlist as
    // the playlist item.
    let resourceId: ResourceId //  json:"resourceId,omitempty" 

    // thumbnails: A map of thumbnail images associated with the playlist
    // item. For each object in the map, the key is the name of the
    // thumbnail image, and the value is an object that contains other
    // information about the thumbnail.
    let thumbnails: ThumbnailDetails //  json:"thumbnails,omitempty" 

    // title: The item's title.
    let title: String //  json:"title,omitempty" 

    static func decode (j: JSON) -> PlaylistItemSnippet {
        return PlaylistItemSnippet(
            channelId: j["channelId"].stringValue,
            channelTitle: j["channelTitle"].stringValue,
            description: j["description"].stringValue,
            playlistId: j["playlistId"].stringValue,
            position: j["position"].int64Value,
            publishedAt: j["publishedAt"].stringValue,
            resourceId: ResourceId.decode(j["resourceId"]),
            thumbnails: ThumbnailDetails.decode(j["thumbnails"]),
            title: j["title"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PlaylistItemStatus {
    // privacyStatus: This resource's privacy status.
    let privacyStatus: String //  json:"privacyStatus,omitempty" 

    static func decode (j: JSON) -> PlaylistItemStatus {
        return PlaylistItemStatus(
            privacyStatus: j["privacyStatus"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PlaylistListResponse {
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // eventId: Serialized EventId of the request which produced this
    // response.
    let eventId: String //  json:"eventId,omitempty" 

    // items: A list of playlists that match the request criteria.
    let items: [Playlist] //  json:"items,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#playlistListResponse".
    let kind: String //  json:"kind,omitempty" 

    // nextPageToken: The token that can be used as the value of the
    // pageToken parameter to retrieve the next page in the result set.
    let nextPageToken: String //  json:"nextPageToken,omitempty" 

    let pageInfo: PageInfo //  json:"pageInfo,omitempty" 

    // prevPageToken: The token that can be used as the value of the
    // pageToken parameter to retrieve the previous page in the result set.
    let prevPageToken: String //  json:"prevPageToken,omitempty" 

    let tokenPagination: TokenPagination //  json:"tokenPagination,omitempty" 

    // visitorId: The visitorId identifies the visitor.
    let visitorId: String //  json:"visitorId,omitempty" 

    static func decode (j: JSON) -> PlaylistListResponse {
        return PlaylistListResponse(
            etag: j["etag"].stringValue,
            eventId: j["eventId"].stringValue,
            items: map( j["items"].arrayValue, { (json: JSON) -> Playlist in Playlist.decode(j["$0"]) } ),
            kind: j["kind"].stringValue,
            nextPageToken: j["nextPageToken"].stringValue,
            pageInfo: PageInfo.decode(j["pageInfo"]),
            prevPageToken: j["prevPageToken"].stringValue,
            tokenPagination: TokenPagination.decode(j["tokenPagination"]),
            visitorId: j["visitorId"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PlaylistLocalization {
    // description: The localized strings for playlist's description.
    let description: String //  json:"description,omitempty" 

    // title: The localized strings for playlist's title.
    let title: String //  json:"title,omitempty" 

    static func decode (j: JSON) -> PlaylistLocalization {
        return PlaylistLocalization(
            description: j["description"].stringValue,
            title: j["title"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PlaylistPlayer {
    // embedHtml: An <iframe> tag that embeds a player that will play the
    // playlist.
    let embedHtml: String //  json:"embedHtml,omitempty" 

    static func decode (j: JSON) -> PlaylistPlayer {
        return PlaylistPlayer(
            embedHtml: j["embedHtml"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PlaylistSnippet {
    // channelId: The ID that YouTube uses to uniquely identify the channel
    // that published the playlist.
    let channelId: String //  json:"channelId,omitempty" 

    // channelTitle: The channel title of the channel that the video belongs
    // to.
    let channelTitle: String //  json:"channelTitle,omitempty" 

    // defaultLanguage: The language of the playlist's default title and
    // description.
    let defaultLanguage: String //  json:"defaultLanguage,omitempty" 

    // description: The playlist's description.
    let description: String //  json:"description,omitempty" 

    // localized: Localized title and description, read-only.
    let localized: PlaylistLocalization //  json:"localized,omitempty" 

    // publishedAt: The date and time that the playlist was created. The
    // value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
    let publishedAt: String //  json:"publishedAt,omitempty" 

    // tags: Keyword tags associated with the playlist.
    let tags: [String] //  json:"tags,omitempty" 

    // thumbnails: A map of thumbnail images associated with the playlist.
    // For each object in the map, the key is the name of the thumbnail
    // image, and the value is an object that contains other information
    // about the thumbnail.
    let thumbnails: ThumbnailDetails //  json:"thumbnails,omitempty" 

    // title: The playlist's title.
    let title: String //  json:"title,omitempty" 

    static func decode (j: JSON) -> PlaylistSnippet {
        return PlaylistSnippet(
            channelId: j["channelId"].stringValue,
            channelTitle: j["channelTitle"].stringValue,
            defaultLanguage: j["defaultLanguage"].stringValue,
            description: j["description"].stringValue,
            localized: PlaylistLocalization.decode(j["localized"]),
            publishedAt: j["publishedAt"].stringValue,
            tags: map( j["tags"].arrayValue, { $0.stringValue } ),
            thumbnails: ThumbnailDetails.decode(j["thumbnails"]),
            title: j["title"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PlaylistStatus {
    // privacyStatus: The playlist's privacy status.
    let privacyStatus: String //  json:"privacyStatus,omitempty" 

    static func decode (j: JSON) -> PlaylistStatus {
        return PlaylistStatus(
            privacyStatus: j["privacyStatus"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PromotedItem {
    // customMessage: A custom message to display for this promotion. This
    // field is currently ignored unless the promoted item is a website.
    let customMessage: String //  json:"customMessage,omitempty" 

    // id: Identifies the promoted item.
    let id: PromotedItemId //  json:"id,omitempty" 

    // promotedByContentOwner: If true, the content owner's name will be
    // used when displaying the promotion. This field can only be set when
    // the update is made on behalf of the content owner.
    let promotedByContentOwner: Bool //  json:"promotedByContentOwner,omitempty" 

    // timing: The temporal position within the video where the promoted
    // item will be displayed. If present, it overrides the default timing.
    let timing: InvideoTiming //  json:"timing,omitempty" 

    static func decode (j: JSON) -> PromotedItem {
        return PromotedItem(
            customMessage: j["customMessage"].stringValue,
            id: PromotedItemId.decode(j["id"]),
            promotedByContentOwner: j["promotedByContentOwner"].boolValue,
            timing: InvideoTiming.decode(j["timing"])
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PromotedItemId {
    // recentlyUploadedBy: If type is recentUpload, this field identifies
    // the channel from which to take the recent upload. If missing, the
    // channel is assumed to be the same channel for which the
    // invideoPromotion is set.
    let recentlyUploadedBy: String //  json:"recentlyUploadedBy,omitempty" 

    // type_: Describes the type of the promoted item.
    let type_: String //  json:"type,omitempty" 

    // videoId: If the promoted item represents a video, this field
    // represents the unique YouTube ID identifying it. This field will be
    // present only if type has the value video.
    let videoId: String //  json:"videoId,omitempty" 

    // websiteUrl: If the promoted item represents a website, this field
    // represents the url pointing to the website. This field will be
    // present only if type has the value website.
    let websiteUrl: String //  json:"websiteUrl,omitempty" 

    static func decode (j: JSON) -> PromotedItemId {
        return PromotedItemId(
            recentlyUploadedBy: j["recentlyUploadedBy"].stringValue,
            type_: j["type"].stringValue,
            videoId: j["videoId"].stringValue,
            websiteUrl: j["websiteUrl"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct PropertyValue {
    // property: A property.
    let property: String //  json:"property,omitempty" 

    // value: The property's value.
    let value: String //  json:"value,omitempty" 

    static func decode (j: JSON) -> PropertyValue {
        return PropertyValue(
            property: j["property"].stringValue,
            value: j["value"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct ResourceId {
    // channelId: The ID that YouTube uses to uniquely identify the referred
    // resource, if that resource is a channel. This property is only
    // present if the resourceId.kind value is youtube#channel.
    let channelId: String //  json:"channelId,omitempty" 

    // kind: The type of the API resource.
    let kind: String //  json:"kind,omitempty" 

    // playlistId: The ID that YouTube uses to uniquely identify the
    // referred resource, if that resource is a playlist. This property is
    // only present if the resourceId.kind value is youtube#playlist.
    let playlistId: String //  json:"playlistId,omitempty" 

    // videoId: The ID that YouTube uses to uniquely identify the referred
    // resource, if that resource is a video. This property is only present
    // if the resourceId.kind value is youtube#video.
    let videoId: String //  json:"videoId,omitempty" 

    static func decode (j: JSON) -> ResourceId {
        return ResourceId(
            channelId: j["channelId"].stringValue,
            kind: j["kind"].stringValue,
            playlistId: j["playlistId"].stringValue,
            videoId: j["videoId"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct SearchListResponse {
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // eventId: Serialized EventId of the request which produced this
    // response.
    let eventId: String //  json:"eventId,omitempty" 

    // items: A list of results that match the search criteria.
    let items: [SearchResult] //  json:"items,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#searchListResponse".
    let kind: String //  json:"kind,omitempty" 

    // nextPageToken: The token that can be used as the value of the
    // pageToken parameter to retrieve the next page in the result set.
    let nextPageToken: String //  json:"nextPageToken,omitempty" 

    let pageInfo: PageInfo //  json:"pageInfo,omitempty" 

    // prevPageToken: The token that can be used as the value of the
    // pageToken parameter to retrieve the previous page in the result set.
    let prevPageToken: String //  json:"prevPageToken,omitempty" 

    let tokenPagination: TokenPagination //  json:"tokenPagination,omitempty" 

    // visitorId: The visitorId identifies the visitor.
    let visitorId: String //  json:"visitorId,omitempty" 

    static func decode (j: JSON) -> SearchListResponse {
        return SearchListResponse(
            etag: j["etag"].stringValue,
            eventId: j["eventId"].stringValue,
            items: map( j["items"].arrayValue, { (json: JSON) -> SearchResult in SearchResult.decode(j["$0"]) } ),
            kind: j["kind"].stringValue,
            nextPageToken: j["nextPageToken"].stringValue,
            pageInfo: PageInfo.decode(j["pageInfo"]),
            prevPageToken: j["prevPageToken"].stringValue,
            tokenPagination: TokenPagination.decode(j["tokenPagination"]),
            visitorId: j["visitorId"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct SearchResult {
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // id: The id object contains information that can be used to uniquely
    // identify the resource that matches the search request.
    let id: ResourceId //  json:"id,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#searchResult".
    let kind: String //  json:"kind,omitempty" 

    // snippet: The snippet object contains basic details about a search
    // result, such as its title or description. For example, if the search
    // result is a video, then the title will be the video's title and the
    // description will be the video's description.
    let snippet: SearchResultSnippet //  json:"snippet,omitempty" 

    static func decode (j: JSON) -> SearchResult {
        return SearchResult(
            etag: j["etag"].stringValue,
            id: ResourceId.decode(j["id"]),
            kind: j["kind"].stringValue,
            snippet: SearchResultSnippet.decode(j["snippet"])
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct SearchResultSnippet {
    // channelId: The value that YouTube uses to uniquely identify the
    // channel that published the resource that the search result
    // identifies.
    let channelId: String //  json:"channelId,omitempty" 

    // channelTitle: The title of the channel that published the resource
    // that the search result identifies.
    let channelTitle: String //  json:"channelTitle,omitempty" 

    // description: A description of the search result.
    let description: String //  json:"description,omitempty" 

    // liveBroadcastContent: It indicates if the resource (video or channel)
    // has upcoming/active live broadcast content. Or it's "none" if there
    // is not any upcoming/active live broadcasts.
    let liveBroadcastContent: String //  json:"liveBroadcastContent,omitempty" 

    // publishedAt: The creation date and time of the resource that the
    // search result identifies. The value is specified in ISO 8601
    // (YYYY-MM-DDThh:mm:ss.sZ) format.
    let publishedAt: String //  json:"publishedAt,omitempty" 

    // thumbnails: A map of thumbnail images associated with the search
    // result. For each object in the map, the key is the name of the
    // thumbnail image, and the value is an object that contains other
    // information about the thumbnail.
    let thumbnails: ThumbnailDetails //  json:"thumbnails,omitempty" 

    // title: The title of the search result.
    let title: String //  json:"title,omitempty" 

    static func decode (j: JSON) -> SearchResultSnippet {
        return SearchResultSnippet(
            channelId: j["channelId"].stringValue,
            channelTitle: j["channelTitle"].stringValue,
            description: j["description"].stringValue,
            liveBroadcastContent: j["liveBroadcastContent"].stringValue,
            publishedAt: j["publishedAt"].stringValue,
            thumbnails: ThumbnailDetails.decode(j["thumbnails"]),
            title: j["title"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct Subscription {
    // contentDetails: The contentDetails object contains basic statistics
    // about the subscription.
    let contentDetails: SubscriptionContentDetails //  json:"contentDetails,omitempty" 

    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // id: The ID that YouTube uses to uniquely identify the subscription.
    let id: String //  json:"id,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#subscription".
    let kind: String //  json:"kind,omitempty" 

    // snippet: The snippet object contains basic details about the
    // subscription, including its title and the channel that the user
    // subscribed to.
    let snippet: SubscriptionSnippet //  json:"snippet,omitempty" 

    // subscriberSnippet: The subscriberSnippet object contains basic
    // details about the sbuscriber.
    let subscriberSnippet: SubscriptionSubscriberSnippet //  json:"subscriberSnippet,omitempty" 

    static func decode (j: JSON) -> Subscription {
        return Subscription(
            contentDetails: SubscriptionContentDetails.decode(j["contentDetails"]),
            etag: j["etag"].stringValue,
            id: j["id"].stringValue,
            kind: j["kind"].stringValue,
            snippet: SubscriptionSnippet.decode(j["snippet"]),
            subscriberSnippet: SubscriptionSubscriberSnippet.decode(j["subscriberSnippet"])
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct SubscriptionContentDetails {
    // activityType: The type of activity this subscription is for (only
    // uploads, everything).
    let activityType: String //  json:"activityType,omitempty" 

    // newItemCount: The number of new items in the subscription since its
    // content was last read.
    let newItemCount: Int64 //  json:"newItemCount,omitempty" 

    // totalItemCount: The approximate number of items that the subscription
    // points to.
    let totalItemCount: Int64 //  json:"totalItemCount,omitempty" 

    static func decode (j: JSON) -> SubscriptionContentDetails {
        return SubscriptionContentDetails(
            activityType: j["activityType"].stringValue,
            newItemCount: j["newItemCount"].int64Value,
            totalItemCount: j["totalItemCount"].int64Value
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct SubscriptionListResponse {
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // eventId: Serialized EventId of the request which produced this
    // response.
    let eventId: String //  json:"eventId,omitempty" 

    // items: A list of subscriptions that match the request criteria.
    let items: [Subscription] //  json:"items,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#subscriptionListResponse".
    let kind: String //  json:"kind,omitempty" 

    // nextPageToken: The token that can be used as the value of the
    // pageToken parameter to retrieve the next page in the result set.
    let nextPageToken: String //  json:"nextPageToken,omitempty" 

    let pageInfo: PageInfo //  json:"pageInfo,omitempty" 

    // prevPageToken: The token that can be used as the value of the
    // pageToken parameter to retrieve the previous page in the result set.
    let prevPageToken: String //  json:"prevPageToken,omitempty" 

    let tokenPagination: TokenPagination //  json:"tokenPagination,omitempty" 

    // visitorId: The visitorId identifies the visitor.
    let visitorId: String //  json:"visitorId,omitempty" 

    static func decode (j: JSON) -> SubscriptionListResponse {
        return SubscriptionListResponse(
            etag: j["etag"].stringValue,
            eventId: j["eventId"].stringValue,
            items: map( j["items"].arrayValue, { (json: JSON) -> Subscription in Subscription.decode(j["$0"]) } ),
            kind: j["kind"].stringValue,
            nextPageToken: j["nextPageToken"].stringValue,
            pageInfo: PageInfo.decode(j["pageInfo"]),
            prevPageToken: j["prevPageToken"].stringValue,
            tokenPagination: TokenPagination.decode(j["tokenPagination"]),
            visitorId: j["visitorId"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct SubscriptionSnippet {
    // channelId: The ID that YouTube uses to uniquely identify the
    // subscriber's channel.
    let channelId: String //  json:"channelId,omitempty" 

    // channelTitle: Channel title for the channel that the subscription
    // belongs to.
    let channelTitle: String //  json:"channelTitle,omitempty" 

    // description: The subscription's details.
    let description: String //  json:"description,omitempty" 

    // publishedAt: The date and time that the subscription was created. The
    // value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
    let publishedAt: String //  json:"publishedAt,omitempty" 

    // resourceId: The id object contains information about the channel that
    // the user subscribed to.
    let resourceId: ResourceId //  json:"resourceId,omitempty" 

    // thumbnails: A map of thumbnail images associated with the video. For
    // each object in the map, the key is the name of the thumbnail image,
    // and the value is an object that contains other information about the
    // thumbnail.
    let thumbnails: ThumbnailDetails //  json:"thumbnails,omitempty" 

    // title: The subscription's title.
    let title: String //  json:"title,omitempty" 

    static func decode (j: JSON) -> SubscriptionSnippet {
        return SubscriptionSnippet(
            channelId: j["channelId"].stringValue,
            channelTitle: j["channelTitle"].stringValue,
            description: j["description"].stringValue,
            publishedAt: j["publishedAt"].stringValue,
            resourceId: ResourceId.decode(j["resourceId"]),
            thumbnails: ThumbnailDetails.decode(j["thumbnails"]),
            title: j["title"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct SubscriptionSubscriberSnippet {
    // channelId: The channel ID of the subscriber.
    let channelId: String //  json:"channelId,omitempty" 

    // description: The description of the subscriber.
    let description: String //  json:"description,omitempty" 

    // thumbnails: Thumbnails for this subscriber.
    let thumbnails: ThumbnailDetails //  json:"thumbnails,omitempty" 

    // title: The title of the subscriber.
    let title: String //  json:"title,omitempty" 

    static func decode (j: JSON) -> SubscriptionSubscriberSnippet {
        return SubscriptionSubscriberSnippet(
            channelId: j["channelId"].stringValue,
            description: j["description"].stringValue,
            thumbnails: ThumbnailDetails.decode(j["thumbnails"]),
            title: j["title"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct Thumbnail {
    // height: (Optional) Height of the thumbnail image.
    let height: Int64 //  json:"height,omitempty" 

    // url: The thumbnail image's URL.
    let url: String //  json:"url,omitempty" 

    // width: (Optional) Width of the thumbnail image.
    let width: Int64 //  json:"width,omitempty" 

    static func decode (j: JSON) -> Thumbnail {
        return Thumbnail(
            height: j["height"].int64Value,
            url: j["url"].stringValue,
            width: j["width"].int64Value
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct ThumbnailDetails {
    // default_: The default image for this resource.
    let default_: Thumbnail //  json:"default,omitempty" 

    // high: The high quality image for this resource.
    let high: Thumbnail //  json:"high,omitempty" 

    // maxres: The maximum resolution quality image for this resource.
    let maxres: Thumbnail //  json:"maxres,omitempty" 

    // medium: The medium quality image for this resource.
    let medium: Thumbnail //  json:"medium,omitempty" 

    // standard: The standard quality image for this resource.
    let standard: Thumbnail //  json:"standard,omitempty" 

    static func decode (j: JSON) -> ThumbnailDetails {
        return ThumbnailDetails(
            default_: Thumbnail.decode(j["default"]),
            high: Thumbnail.decode(j["high"]),
            maxres: Thumbnail.decode(j["maxres"]),
            medium: Thumbnail.decode(j["medium"]),
            standard: Thumbnail.decode(j["standard"])
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct ThumbnailSetResponse {
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // eventId: Serialized EventId of the request which produced this
    // response.
    let eventId: String //  json:"eventId,omitempty" 

    // items: A list of thumbnails.
    let items: [ThumbnailDetails] //  json:"items,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#thumbnailSetResponse".
    let kind: String //  json:"kind,omitempty" 

    // visitorId: The visitorId identifies the visitor.
    let visitorId: String //  json:"visitorId,omitempty" 

    static func decode (j: JSON) -> ThumbnailSetResponse {
        return ThumbnailSetResponse(
            etag: j["etag"].stringValue,
            eventId: j["eventId"].stringValue,
            items: map( j["items"].arrayValue, { (json: JSON) -> ThumbnailDetails in ThumbnailDetails.decode(j["$0"]) } ),
            kind: j["kind"].stringValue,
            visitorId: j["visitorId"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct TokenPagination {

    static func decode (j: JSON) -> TokenPagination {
        return TokenPagination(

        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct Video {
    // ageGating: Age restriction details related to a video.
    let ageGating: VideoAgeGating //  json:"ageGating,omitempty" 

    // contentDetails: The contentDetails object contains information about
    // the video content, including the length of the video and its aspect
    // ratio.
    let contentDetails: VideoContentDetails //  json:"contentDetails,omitempty" 

    // conversionPings: The conversionPings object encapsulates information
    // about url pings that need to be respected by the App in different
    // video contexts.
    let conversionPings: VideoConversionPings //  json:"conversionPings,omitempty" 

    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // fileDetails: The fileDetails object encapsulates information about
    // the video file that was uploaded to YouTube, including the file's
    // resolution, duration, audio and video codecs, stream bitrates, and
    // more. This data can only be retrieved by the video owner.
    let fileDetails: VideoFileDetails //  json:"fileDetails,omitempty" 

    // id: The ID that YouTube uses to uniquely identify the video.
    let id: String //  json:"id,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#video".
    let kind: String //  json:"kind,omitempty" 

    // liveStreamingDetails: The liveStreamingDetails object contains
    // metadata about a live video broadcast. The object will only be
    // present in a video resource if the video is an upcoming, live, or
    // completed live broadcast.
    let liveStreamingDetails: VideoLiveStreamingDetails //  json:"liveStreamingDetails,omitempty" 

    // localizations: List with all localizations.
    let localizations: [String: VideoLocalization] //  json:"localizations,omitempty" 

    // monetizationDetails: The monetizationDetails object encapsulates
    // information about the monetization status of the video.
    let monetizationDetails: VideoMonetizationDetails //  json:"monetizationDetails,omitempty" 

    // player: The player object contains information that you would use to
    // play the video in an embedded player.
    let player: VideoPlayer //  json:"player,omitempty" 

    // processingDetails: The processingProgress object encapsulates
    // information about YouTube's progress in processing the uploaded video
    // file. The properties in the object identify the current processing
    // status and an estimate of the time remaining until YouTube finishes
    // processing the video. This part also indicates whether different
    // types of data or content, such as file details or thumbnail images,
    // are available for the video.
    // 
    // The processingProgress object is
    // designed to be polled so that the video uploaded can track the
    // progress that YouTube has made in processing the uploaded video file.
    // This data can only be retrieved by the video owner.
    let processingDetails: VideoProcessingDetails //  json:"processingDetails,omitempty" 

    // projectDetails: The projectDetails object contains information about
    // the project specific video metadata.
    let projectDetails: VideoProjectDetails //  json:"projectDetails,omitempty" 

    // recordingDetails: The recordingDetails object encapsulates
    // information about the location, date and address where the video was
    // recorded.
    let recordingDetails: VideoRecordingDetails //  json:"recordingDetails,omitempty" 

    // snippet: The snippet object contains basic details about the video,
    // such as its title, description, and category.
    let snippet: VideoSnippet //  json:"snippet,omitempty" 

    // statistics: The statistics object contains statistics about the
    // video.
    let statistics: VideoStatistics //  json:"statistics,omitempty" 

    // status: The status object contains information about the video's
    // uploading, processing, and privacy statuses.
    let status: VideoStatus //  json:"status,omitempty" 

    // suggestions: The suggestions object encapsulates suggestions that
    // identify opportunities to improve the video quality or the metadata
    // for the uploaded video. This data can only be retrieved by the video
    // owner.
    let suggestions: VideoSuggestions //  json:"suggestions,omitempty" 

    // topicDetails: The topicDetails object encapsulates information about
    // Freebase topics associated with the video.
    let topicDetails: VideoTopicDetails //  json:"topicDetails,omitempty" 

    static func decode (j: JSON) -> Video {
        return Video(
            ageGating: VideoAgeGating.decode(j["ageGating"]),
            contentDetails: VideoContentDetails.decode(j["contentDetails"]),
            conversionPings: VideoConversionPings.decode(j["conversionPings"]),
            etag: j["etag"].stringValue,
            fileDetails: VideoFileDetails.decode(j["fileDetails"]),
            id: j["id"].stringValue,
            kind: j["kind"].stringValue,
            liveStreamingDetails: VideoLiveStreamingDetails.decode(j["liveStreamingDetails"]),
            localizations: reduce( map( j["localizations"].dictionaryValue, { return ($0, VideoLocalization.decode($1)) }),[String: VideoLocalization](), { (dict, pair: (String, VideoLocalization)) -> (dict) in dict[pair.0] = pair.1 } ),
            monetizationDetails: VideoMonetizationDetails.decode(j["monetizationDetails"]),
            player: VideoPlayer.decode(j["player"]),
            processingDetails: VideoProcessingDetails.decode(j["processingDetails"]),
            projectDetails: VideoProjectDetails.decode(j["projectDetails"]),
            recordingDetails: VideoRecordingDetails.decode(j["recordingDetails"]),
            snippet: VideoSnippet.decode(j["snippet"]),
            statistics: VideoStatistics.decode(j["statistics"]),
            status: VideoStatus.decode(j["status"]),
            suggestions: VideoSuggestions.decode(j["suggestions"]),
            topicDetails: VideoTopicDetails.decode(j["topicDetails"])
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoAgeGating {
    // alcoholContent: Indicates whether or not the video has alcoholic
    // beverage content. Only users of legal purchasing age in a particular
    // country, as identified by ICAP, can view the content.
    let alcoholContent: Bool //  json:"alcoholContent,omitempty" 

    // restricted: Age-restricted trailers. For redband trailers and
    // adult-rated video-games. Only users aged 18+ can view the content.
    // The the field is true the content is restricted to viewers aged 18+.
    // Otherwise The field won't be present.
    let restricted: Bool //  json:"restricted,omitempty" 

    // videoGameRating: Video game rating, if any.
    let videoGameRating: String //  json:"videoGameRating,omitempty" 

    static func decode (j: JSON) -> VideoAgeGating {
        return VideoAgeGating(
            alcoholContent: j["alcoholContent"].boolValue,
            restricted: j["restricted"].boolValue,
            videoGameRating: j["videoGameRating"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoCategory {
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // id: The ID that YouTube uses to uniquely identify the video category.
    let id: String //  json:"id,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#videoCategory".
    let kind: String //  json:"kind,omitempty" 

    // snippet: The snippet object contains basic details about the video
    // category, including its title.
    let snippet: VideoCategorySnippet //  json:"snippet,omitempty" 

    static func decode (j: JSON) -> VideoCategory {
        return VideoCategory(
            etag: j["etag"].stringValue,
            id: j["id"].stringValue,
            kind: j["kind"].stringValue,
            snippet: VideoCategorySnippet.decode(j["snippet"])
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoCategoryListResponse {
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // eventId: Serialized EventId of the request which produced this
    // response.
    let eventId: String //  json:"eventId,omitempty" 

    // items: A list of video categories that can be associated with YouTube
    // videos. In this map, the video category ID is the map key, and its
    // value is the corresponding videoCategory resource.
    let items: [VideoCategory] //  json:"items,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#videoCategoryListResponse".
    let kind: String //  json:"kind,omitempty" 

    // nextPageToken: The token that can be used as the value of the
    // pageToken parameter to retrieve the next page in the result set.
    let nextPageToken: String //  json:"nextPageToken,omitempty" 

    let pageInfo: PageInfo //  json:"pageInfo,omitempty" 

    // prevPageToken: The token that can be used as the value of the
    // pageToken parameter to retrieve the previous page in the result set.
    let prevPageToken: String //  json:"prevPageToken,omitempty" 

    let tokenPagination: TokenPagination //  json:"tokenPagination,omitempty" 

    // visitorId: The visitorId identifies the visitor.
    let visitorId: String //  json:"visitorId,omitempty" 

    static func decode (j: JSON) -> VideoCategoryListResponse {
        return VideoCategoryListResponse(
            etag: j["etag"].stringValue,
            eventId: j["eventId"].stringValue,
            items: map( j["items"].arrayValue, { (json: JSON) -> VideoCategory in VideoCategory.decode(j["$0"]) } ),
            kind: j["kind"].stringValue,
            nextPageToken: j["nextPageToken"].stringValue,
            pageInfo: PageInfo.decode(j["pageInfo"]),
            prevPageToken: j["prevPageToken"].stringValue,
            tokenPagination: TokenPagination.decode(j["tokenPagination"]),
            visitorId: j["visitorId"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoCategorySnippet {
    let assignable: Bool //  json:"assignable,omitempty" 

    // channelId: The YouTube channel that created the video category.
    let channelId: String //  json:"channelId,omitempty" 

    // title: The video category's title.
    let title: String //  json:"title,omitempty" 

    static func decode (j: JSON) -> VideoCategorySnippet {
        return VideoCategorySnippet(
            assignable: j["assignable"].boolValue,
            channelId: j["channelId"].stringValue,
            title: j["title"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoContentDetails {
    // caption: The value of captions indicates whether the video has
    // captions or not.
    let caption: String //  json:"caption,omitempty" 

    // contentRating: Specifies the ratings that the video received under
    // various rating schemes.
    let contentRating: ContentRating //  json:"contentRating,omitempty" 

    // countryRestriction: The countryRestriction object contains
    // information about the countries where a video is (or is not)
    // viewable.
    let countryRestriction: AccessPolicy //  json:"countryRestriction,omitempty" 

    // definition: The value of definition indicates whether the video is
    // available in high definition or only in standard definition.
    let definition: String //  json:"definition,omitempty" 

    // dimension: The value of dimension indicates whether the video is
    // available in 3D or in 2D.
    let dimension: String //  json:"dimension,omitempty" 

    // duration: The length of the video. The tag value is an ISO 8601
    // duration in the format PT#M#S, in which the letters PT indicate that
    // the value specifies a period of time, and the letters M and S refer
    // to length in minutes and seconds, respectively. The # characters
    // preceding the M and S letters are both integers that specify the
    // number of minutes (or seconds) of the video. For example, a value of
    // PT15M51S indicates that the video is 15 minutes and 51 seconds long.
    let duration: String //  json:"duration,omitempty" 

    // licensedContent: The value of is_license_content indicates whether
    // the video is licensed content.
    let licensedContent: Bool //  json:"licensedContent,omitempty" 

    // regionRestriction: The regionRestriction object contains information
    // about the countries where a video is (or is not) viewable. The object
    // will contain either the contentDetails.regionRestriction.allowed
    // property or the contentDetails.regionRestriction.blocked property.
    let regionRestriction: VideoContentDetailsRegionRestriction //  json:"regionRestriction,omitempty" 

    static func decode (j: JSON) -> VideoContentDetails {
        return VideoContentDetails(
            caption: j["caption"].stringValue,
            contentRating: ContentRating.decode(j["contentRating"]),
            countryRestriction: AccessPolicy.decode(j["countryRestriction"]),
            definition: j["definition"].stringValue,
            dimension: j["dimension"].stringValue,
            duration: j["duration"].stringValue,
            licensedContent: j["licensedContent"].boolValue,
            regionRestriction: VideoContentDetailsRegionRestriction.decode(j["regionRestriction"])
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoContentDetailsRegionRestriction {
    // allowed: A list of region codes that identify countries where the
    // video is viewable. If this property is present and a country is not
    // listed in its value, then the video is blocked from appearing in that
    // country. If this property is present and contains an empty list, the
    // video is blocked in all countries.
    let allowed: [String] //  json:"allowed,omitempty" 

    // blocked: A list of region codes that identify countries where the
    // video is blocked. If this property is present and a country is not
    // listed in its value, then the video is viewable in that country. If
    // this property is present and contains an empty list, the video is
    // viewable in all countries.
    let blocked: [String] //  json:"blocked,omitempty" 

    static func decode (j: JSON) -> VideoContentDetailsRegionRestriction {
        return VideoContentDetailsRegionRestriction(
            allowed: map( j["allowed"].arrayValue, { $0.stringValue } ),
            blocked: map( j["blocked"].arrayValue, { $0.stringValue } )
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoConversionPing {
    // context: Defines the context of the ping.
    let context: String //  json:"context,omitempty" 

    // conversionUrl: The url (without the schema) that the app shall send
    // the ping to. It's at caller's descretion to decide which schema to
    // use (http vs https) Example of a returned url:
    // //googleads.g.doubleclick.net/pagead/
    // viewthroughconversion/962985656/?data=path%3DtHe_path%3Btype%3D
    // like%3Butuid%3DGISQtTNGYqaYl4sKxoVvKA%3Bytvid%3DUrIaJUvIQDg&labe=defau
    // lt The caller must append biscotti authentication (ms param in case
    // of mobile, for example) to this ping.
    let conversionUrl: String //  json:"conversionUrl,omitempty" 

    static func decode (j: JSON) -> VideoConversionPing {
        return VideoConversionPing(
            context: j["context"].stringValue,
            conversionUrl: j["conversionUrl"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoConversionPings {
    // pings: Pings that the app shall fire for a video (authenticated by
    // biscotti cookie). Each ping has a context, in which the app must fire
    // the ping, and a url identifying the ping.
    let pings: [VideoConversionPing] //  json:"pings,omitempty" 

    static func decode (j: JSON) -> VideoConversionPings {
        return VideoConversionPings(
            pings: map( j["pings"].arrayValue, { (json: JSON) -> VideoConversionPing in VideoConversionPing.decode(j["$0"]) } )
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoFileDetails {
    // audioStreams: A list of audio streams contained in the uploaded video
    // file. Each item in the list contains detailed metadata about an audio
    // stream.
    let audioStreams: [VideoFileDetailsAudioStream] //  json:"audioStreams,omitempty" 

    // bitrateBps: The uploaded video file's combined (video and audio)
    // bitrate in bits per second.
    let bitrateBps: UInt64 //  json:"bitrateBps,omitempty,string" 

    // container: The uploaded video file's container format.
    let container: String //  json:"container,omitempty" 

    // creationTime: The date and time when the uploaded video file was
    // created. The value is specified in ISO 8601 format. Currently, the
    // following ISO 8601 formats are supported:  
    // - Date only: YYYY-MM-DD
    // 
    // - Naive time: YYYY-MM-DDTHH:MM:SS 
    // - Time with timezone:
    // YYYY-MM-DDTHH:MM:SS+HH:MM
    let creationTime: String //  json:"creationTime,omitempty" 

    // durationMs: The length of the uploaded video in milliseconds.
    let durationMs: UInt64 //  json:"durationMs,omitempty,string" 

    // fileName: The uploaded file's name. This field is present whether a
    // video file or another type of file was uploaded.
    let fileName: String //  json:"fileName,omitempty" 

    // fileSize: The uploaded file's size in bytes. This field is present
    // whether a video file or another type of file was uploaded.
    let fileSize: UInt64 //  json:"fileSize,omitempty,string" 

    // fileType: The uploaded file's type as detected by YouTube's video
    // processing engine. Currently, YouTube only processes video files, but
    // this field is present whether a video file or another type of file
    // was uploaded.
    let fileType: String //  json:"fileType,omitempty" 

    // recordingLocation: Geographic coordinates that identify the place
    // where the uploaded video was recorded. Coordinates are defined using
    // WGS 84.
    let recordingLocation: GeoPoint //  json:"recordingLocation,omitempty" 

    // videoStreams: A list of video streams contained in the uploaded video
    // file. Each item in the list contains detailed metadata about a video
    // stream.
    let videoStreams: [VideoFileDetailsVideoStream] //  json:"videoStreams,omitempty" 

    static func decode (j: JSON) -> VideoFileDetails {
        return VideoFileDetails(
            audioStreams: map( j["audioStreams"].arrayValue, { (json: JSON) -> VideoFileDetailsAudioStream in VideoFileDetailsAudioStream.decode(j["$0"]) } ),
            bitrateBps: j["bitrateBps"].uint64Value,
            container: j["container"].stringValue,
            creationTime: j["creationTime"].stringValue,
            durationMs: j["durationMs"].uint64Value,
            fileName: j["fileName"].stringValue,
            fileSize: j["fileSize"].uint64Value,
            fileType: j["fileType"].stringValue,
            recordingLocation: GeoPoint.decode(j["recordingLocation"]),
            videoStreams: map( j["videoStreams"].arrayValue, { (json: JSON) -> VideoFileDetailsVideoStream in VideoFileDetailsVideoStream.decode(j["$0"]) } )
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoFileDetailsAudioStream {
    // bitrateBps: The audio stream's bitrate, in bits per second.
    let bitrateBps: UInt64 //  json:"bitrateBps,omitempty,string" 

    // channelCount: The number of audio channels that the stream contains.
    let channelCount: Int64 //  json:"channelCount,omitempty" 

    // codec: The audio codec that the stream uses.
    let codec: String //  json:"codec,omitempty" 

    // vendor: A value that uniquely identifies a video vendor. Typically,
    // the value is a four-letter vendor code.
    let vendor: String //  json:"vendor,omitempty" 

    static func decode (j: JSON) -> VideoFileDetailsAudioStream {
        return VideoFileDetailsAudioStream(
            bitrateBps: j["bitrateBps"].uint64Value,
            channelCount: j["channelCount"].int64Value,
            codec: j["codec"].stringValue,
            vendor: j["vendor"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoFileDetailsVideoStream {
    // aspectRatio: The video content's display aspect ratio, which
    // specifies the aspect ratio in which the video should be displayed.
    let aspectRatio: Double //  json:"aspectRatio,omitempty" 

    // bitrateBps: The video stream's bitrate, in bits per second.
    let bitrateBps: UInt64 //  json:"bitrateBps,omitempty,string" 

    // codec: The video codec that the stream uses.
    let codec: String //  json:"codec,omitempty" 

    // frameRateFps: The video stream's frame rate, in frames per second.
    let frameRateFps: Double //  json:"frameRateFps,omitempty" 

    // heightPixels: The encoded video content's height in pixels.
    let heightPixels: Int64 //  json:"heightPixels,omitempty" 

    // rotation: The amount that YouTube needs to rotate the original source
    // content to properly display the video.
    let rotation: String //  json:"rotation,omitempty" 

    // vendor: A value that uniquely identifies a video vendor. Typically,
    // the value is a four-letter vendor code.
    let vendor: String //  json:"vendor,omitempty" 

    // widthPixels: The encoded video content's width in pixels. You can
    // calculate the video's encoding aspect ratio as
    // width_pixels / height_pixels.
    let widthPixels: Int64 //  json:"widthPixels,omitempty" 

    static func decode (j: JSON) -> VideoFileDetailsVideoStream {
        return VideoFileDetailsVideoStream(
            aspectRatio: j["aspectRatio"].doubleValue,
            bitrateBps: j["bitrateBps"].uint64Value,
            codec: j["codec"].stringValue,
            frameRateFps: j["frameRateFps"].doubleValue,
            heightPixels: j["heightPixels"].int64Value,
            rotation: j["rotation"].stringValue,
            vendor: j["vendor"].stringValue,
            widthPixels: j["widthPixels"].int64Value
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoGetRatingResponse {
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // eventId: Serialized EventId of the request which produced this
    // response.
    let eventId: String //  json:"eventId,omitempty" 

    // items: A list of ratings that match the request criteria.
    let items: [VideoRating] //  json:"items,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#videoGetRatingResponse".
    let kind: String //  json:"kind,omitempty" 

    // visitorId: The visitorId identifies the visitor.
    let visitorId: String //  json:"visitorId,omitempty" 

    static func decode (j: JSON) -> VideoGetRatingResponse {
        return VideoGetRatingResponse(
            etag: j["etag"].stringValue,
            eventId: j["eventId"].stringValue,
            items: map( j["items"].arrayValue, { (json: JSON) -> VideoRating in VideoRating.decode(j["$0"]) } ),
            kind: j["kind"].stringValue,
            visitorId: j["visitorId"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoListResponse {
    // etag: Etag of this resource.
    let etag: String //  json:"etag,omitempty" 

    // eventId: Serialized EventId of the request which produced this
    // response.
    let eventId: String //  json:"eventId,omitempty" 

    // items: A list of videos that match the request criteria.
    let items: [Video] //  json:"items,omitempty" 

    // kind: Identifies what kind of resource this is. Value: the fixed
    // string "youtube#videoListResponse".
    let kind: String //  json:"kind,omitempty" 

    // nextPageToken: The token that can be used as the value of the
    // pageToken parameter to retrieve the next page in the result set.
    let nextPageToken: String //  json:"nextPageToken,omitempty" 

    let pageInfo: PageInfo //  json:"pageInfo,omitempty" 

    // prevPageToken: The token that can be used as the value of the
    // pageToken parameter to retrieve the previous page in the result set.
    let prevPageToken: String //  json:"prevPageToken,omitempty" 

    let tokenPagination: TokenPagination //  json:"tokenPagination,omitempty" 

    // visitorId: The visitorId identifies the visitor.
    let visitorId: String //  json:"visitorId,omitempty" 

    static func decode (j: JSON) -> VideoListResponse {
        return VideoListResponse(
            etag: j["etag"].stringValue,
            eventId: j["eventId"].stringValue,
            items: map( j["items"].arrayValue, { (json: JSON) -> Video in Video.decode(j["$0"]) } ),
            kind: j["kind"].stringValue,
            nextPageToken: j["nextPageToken"].stringValue,
            pageInfo: PageInfo.decode(j["pageInfo"]),
            prevPageToken: j["prevPageToken"].stringValue,
            tokenPagination: TokenPagination.decode(j["tokenPagination"]),
            visitorId: j["visitorId"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoLiveStreamingDetails {
    // actualEndTime: The time that the broadcast actually ended. The value
    // is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format. This value
    // will not be available until the broadcast is over.
    let actualEndTime: String //  json:"actualEndTime,omitempty" 

    // actualStartTime: The time that the broadcast actually started. The
    // value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format. This
    // value will not be available until the broadcast begins.
    let actualStartTime: String //  json:"actualStartTime,omitempty" 

    // concurrentViewers: The number of viewers currently watching the
    // broadcast. The property and its value will be present if the
    // broadcast has current viewers and the broadcast owner has not hidden
    // the viewcount for the video. Note that YouTube stops tracking the
    // number of concurrent viewers for a broadcast when the broadcast ends.
    // So, this property would not identify the number of viewers watching
    // an archived video of a live broadcast that already ended.
    let concurrentViewers: UInt64 //  json:"concurrentViewers,omitempty,string" 

    // scheduledEndTime: The time that the broadcast is scheduled to end.
    // The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
    // If the value is empty or the property is not present, then the
    // broadcast is scheduled to continue indefinitely.
    let scheduledEndTime: String //  json:"scheduledEndTime,omitempty" 

    // scheduledStartTime: The time that the broadcast is scheduled to
    // begin. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ)
    // format.
    let scheduledStartTime: String //  json:"scheduledStartTime,omitempty" 

    static func decode (j: JSON) -> VideoLiveStreamingDetails {
        return VideoLiveStreamingDetails(
            actualEndTime: j["actualEndTime"].stringValue,
            actualStartTime: j["actualStartTime"].stringValue,
            concurrentViewers: j["concurrentViewers"].uint64Value,
            scheduledEndTime: j["scheduledEndTime"].stringValue,
            scheduledStartTime: j["scheduledStartTime"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoLocalization {
    // description: Localized version of the video's description.
    let description: String //  json:"description,omitempty" 

    // title: Localized version of the video's title.
    let title: String //  json:"title,omitempty" 

    static func decode (j: JSON) -> VideoLocalization {
        return VideoLocalization(
            description: j["description"].stringValue,
            title: j["title"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoMonetizationDetails {
    // access: The value of access indicates whether the video can be
    // monetized or not.
    let access: AccessPolicy //  json:"access,omitempty" 

    static func decode (j: JSON) -> VideoMonetizationDetails {
        return VideoMonetizationDetails(
            access: AccessPolicy.decode(j["access"])
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoPlayer {
    // embedHtml: An <iframe> tag that embeds a player that will play the
    // video.
    let embedHtml: String //  json:"embedHtml,omitempty" 

    static func decode (j: JSON) -> VideoPlayer {
        return VideoPlayer(
            embedHtml: j["embedHtml"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoProcessingDetails {
    // editorSuggestionsAvailability: This value indicates whether video
    // editing suggestions, which might improve video quality or the
    // playback experience, are available for the video. You can retrieve
    // these suggestions by requesting the suggestions part in your
    // videos.list() request.
    let editorSuggestionsAvailability: String //  json:"editorSuggestionsAvailability,omitempty" 

    // fileDetailsAvailability: This value indicates whether file details
    // are available for the uploaded video. You can retrieve a video's file
    // details by requesting the fileDetails part in your videos.list()
    // request.
    let fileDetailsAvailability: String //  json:"fileDetailsAvailability,omitempty" 

    // processingFailureReason: The reason that YouTube failed to process
    // the video. This property will only have a value if the
    // processingStatus property's value is failed.
    let processingFailureReason: String //  json:"processingFailureReason,omitempty" 

    // processingIssuesAvailability: This value indicates whether the video
    // processing engine has generated suggestions that might improve
    // YouTube's ability to process the the video, warnings that explain
    // video processing problems, or errors that cause video processing
    // problems. You can retrieve these suggestions by requesting the
    // suggestions part in your videos.list() request.
    let processingIssuesAvailability: String //  json:"processingIssuesAvailability,omitempty" 

    // processingProgress: The processingProgress object contains
    // information about the progress YouTube has made in processing the
    // video. The values are really only relevant if the video's processing
    // status is processing.
    let processingProgress: VideoProcessingDetailsProcessingProgress //  json:"processingProgress,omitempty" 

    // processingStatus: The video's processing status. This value indicates
    // whether YouTube was able to process the video or if the video is
    // still being processed.
    let processingStatus: String //  json:"processingStatus,omitempty" 

    // tagSuggestionsAvailability: This value indicates whether keyword
    // (tag) suggestions are available for the video. Tags can be added to a
    // video's metadata to make it easier for other users to find the video.
    // You can retrieve these suggestions by requesting the suggestions part
    // in your videos.list() request.
    let tagSuggestionsAvailability: String //  json:"tagSuggestionsAvailability,omitempty" 

    // thumbnailsAvailability: This value indicates whether thumbnail images
    // have been generated for the video.
    let thumbnailsAvailability: String //  json:"thumbnailsAvailability,omitempty" 

    static func decode (j: JSON) -> VideoProcessingDetails {
        return VideoProcessingDetails(
            editorSuggestionsAvailability: j["editorSuggestionsAvailability"].stringValue,
            fileDetailsAvailability: j["fileDetailsAvailability"].stringValue,
            processingFailureReason: j["processingFailureReason"].stringValue,
            processingIssuesAvailability: j["processingIssuesAvailability"].stringValue,
            processingProgress: VideoProcessingDetailsProcessingProgress.decode(j["processingProgress"]),
            processingStatus: j["processingStatus"].stringValue,
            tagSuggestionsAvailability: j["tagSuggestionsAvailability"].stringValue,
            thumbnailsAvailability: j["thumbnailsAvailability"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoProcessingDetailsProcessingProgress {
    // partsProcessed: The number of parts of the video that YouTube has
    // already processed. You can estimate the percentage of the video that
    // YouTube has already processed by calculating:
    // 100 * parts_processed /
    // parts_total
    // 
    // Note that since the estimated number of parts could
    // increase without a corresponding increase in the number of parts that
    // have already been processed, it is possible that the calculated
    // progress could periodically decrease while YouTube processes a video.
    let partsProcessed: UInt64 //  json:"partsProcessed,omitempty,string" 

    // partsTotal: An estimate of the total number of parts that need to be
    // processed for the video. The number may be updated with more precise
    // estimates while YouTube processes the video.
    let partsTotal: UInt64 //  json:"partsTotal,omitempty,string" 

    // timeLeftMs: An estimate of the amount of time, in millseconds, that
    // YouTube needs to finish processing the video.
    let timeLeftMs: UInt64 //  json:"timeLeftMs,omitempty,string" 

    static func decode (j: JSON) -> VideoProcessingDetailsProcessingProgress {
        return VideoProcessingDetailsProcessingProgress(
            partsProcessed: j["partsProcessed"].uint64Value,
            partsTotal: j["partsTotal"].uint64Value,
            timeLeftMs: j["timeLeftMs"].uint64Value
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoProjectDetails {
    // tags: A list of project tags associated with the video during the
    // upload.
    let tags: [String] //  json:"tags,omitempty" 

    static func decode (j: JSON) -> VideoProjectDetails {
        return VideoProjectDetails(
            tags: map( j["tags"].arrayValue, { $0.stringValue } )
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoRating {
    let rating: String //  json:"rating,omitempty" 

    let videoId: String //  json:"videoId,omitempty" 

    static func decode (j: JSON) -> VideoRating {
        return VideoRating(
            rating: j["rating"].stringValue,
            videoId: j["videoId"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoRecordingDetails {
    // location: The geolocation information associated with the video.
    let location: GeoPoint //  json:"location,omitempty" 

    // locationDescription: The text description of the location where the
    // video was recorded.
    let locationDescription: String //  json:"locationDescription,omitempty" 

    // recordingDate: The date and time when the video was recorded. The
    // value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sssZ) format.
    let recordingDate: String //  json:"recordingDate,omitempty" 

    static func decode (j: JSON) -> VideoRecordingDetails {
        return VideoRecordingDetails(
            location: GeoPoint.decode(j["location"]),
            locationDescription: j["locationDescription"].stringValue,
            recordingDate: j["recordingDate"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoSnippet {
    // categoryId: The YouTube video category associated with the video.
    let categoryId: String //  json:"categoryId,omitempty" 

    // channelId: The ID that YouTube uses to uniquely identify the channel
    // that the video was uploaded to.
    let channelId: String //  json:"channelId,omitempty" 

    // channelTitle: Channel title for the channel that the video belongs
    // to.
    let channelTitle: String //  json:"channelTitle,omitempty" 

    // defaultLanguage: The language of the videos's default snippet.
    let defaultLanguage: String //  json:"defaultLanguage,omitempty" 

    // description: The video's description.
    let description: String //  json:"description,omitempty" 

    // liveBroadcastContent: Indicates if the video is an upcoming/active
    // live broadcast. Or it's "none" if the video is not an upcoming/active
    // live broadcast.
    let liveBroadcastContent: String //  json:"liveBroadcastContent,omitempty" 

    // localized: Localized snippet selected with the hl parameter. If no
    // such localization exists, this field is populated with the default
    // snippet. (Read-only)
    let localized: VideoLocalization //  json:"localized,omitempty" 

    // publishedAt: The date and time that the video was uploaded. The value
    // is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
    let publishedAt: String //  json:"publishedAt,omitempty" 

    // tags: A list of keyword tags associated with the video. Tags may
    // contain spaces. This field is only visible to the video's uploader.
    let tags: [String] //  json:"tags,omitempty" 

    // thumbnails: A map of thumbnail images associated with the video. For
    // each object in the map, the key is the name of the thumbnail image,
    // and the value is an object that contains other information about the
    // thumbnail.
    let thumbnails: ThumbnailDetails //  json:"thumbnails,omitempty" 

    // title: The video's title.
    let title: String //  json:"title,omitempty" 

    static func decode (j: JSON) -> VideoSnippet {
        return VideoSnippet(
            categoryId: j["categoryId"].stringValue,
            channelId: j["channelId"].stringValue,
            channelTitle: j["channelTitle"].stringValue,
            defaultLanguage: j["defaultLanguage"].stringValue,
            description: j["description"].stringValue,
            liveBroadcastContent: j["liveBroadcastContent"].stringValue,
            localized: VideoLocalization.decode(j["localized"]),
            publishedAt: j["publishedAt"].stringValue,
            tags: map( j["tags"].arrayValue, { $0.stringValue } ),
            thumbnails: ThumbnailDetails.decode(j["thumbnails"]),
            title: j["title"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoStatistics {
    // commentCount: The number of comments for the video.
    let commentCount: UInt64 //  json:"commentCount,omitempty,string" 

    // dislikeCount: The number of users who have indicated that they
    // disliked the video by giving it a negative rating.
    let dislikeCount: UInt64 //  json:"dislikeCount,omitempty,string" 

    // favoriteCount: The number of users who currently have the video
    // marked as a favorite video.
    let favoriteCount: UInt64 //  json:"favoriteCount,omitempty,string" 

    // likeCount: The number of users who have indicated that they liked the
    // video by giving it a positive rating.
    let likeCount: UInt64 //  json:"likeCount,omitempty,string" 

    // viewCount: The number of times the video has been viewed.
    let viewCount: UInt64 //  json:"viewCount,omitempty,string" 

    static func decode (j: JSON) -> VideoStatistics {
        return VideoStatistics(
            commentCount: j["commentCount"].uint64Value,
            dislikeCount: j["dislikeCount"].uint64Value,
            favoriteCount: j["favoriteCount"].uint64Value,
            likeCount: j["likeCount"].uint64Value,
            viewCount: j["viewCount"].uint64Value
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoStatus {
    // embeddable: This value indicates if the video can be embedded on
    // another website.
    let embeddable: Bool //  json:"embeddable,omitempty" 

    // failureReason: This value explains why a video failed to upload. This
    // property is only present if the uploadStatus property indicates that
    // the upload failed.
    let failureReason: String //  json:"failureReason,omitempty" 

    // license: The video's license.
    let license: String //  json:"license,omitempty" 

    // privacyStatus: The video's privacy status.
    let privacyStatus: String //  json:"privacyStatus,omitempty" 

    // publicStatsViewable: This value indicates if the extended video
    // statistics on the watch page can be viewed by everyone. Note that the
    // view count, likes, etc will still be visible if this is disabled.
    let publicStatsViewable: Bool //  json:"publicStatsViewable,omitempty" 

    // publishAt: The date and time when the video is scheduled to publish.
    // It can be set only if the privacy status of the video is private. The
    // value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.
    let publishAt: String //  json:"publishAt,omitempty" 

    // rejectionReason: This value explains why YouTube rejected an uploaded
    // video. This property is only present if the uploadStatus property
    // indicates that the upload was rejected.
    let rejectionReason: String //  json:"rejectionReason,omitempty" 

    // uploadStatus: The status of the uploaded video.
    let uploadStatus: String //  json:"uploadStatus,omitempty" 

    static func decode (j: JSON) -> VideoStatus {
        return VideoStatus(
            embeddable: j["embeddable"].boolValue,
            failureReason: j["failureReason"].stringValue,
            license: j["license"].stringValue,
            privacyStatus: j["privacyStatus"].stringValue,
            publicStatsViewable: j["publicStatsViewable"].boolValue,
            publishAt: j["publishAt"].stringValue,
            rejectionReason: j["rejectionReason"].stringValue,
            uploadStatus: j["uploadStatus"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoSuggestions {
    // editorSuggestions: A list of video editing operations that might
    // improve the video quality or playback experience of the uploaded
    // video.
    let editorSuggestions: [String] //  json:"editorSuggestions,omitempty" 

    // processingErrors: A list of errors that will prevent YouTube from
    // successfully processing the uploaded video video. These errors
    // indicate that, regardless of the video's current processing status,
    // eventually, that status will almost certainly be failed.
    let processingErrors: [String] //  json:"processingErrors,omitempty" 

    // processingHints: A list of suggestions that may improve YouTube's
    // ability to process the video.
    let processingHints: [String] //  json:"processingHints,omitempty" 

    // processingWarnings: A list of reasons why YouTube may have difficulty
    // transcoding the uploaded video or that might result in an erroneous
    // transcoding. These warnings are generated before YouTube actually
    // processes the uploaded video file. In addition, they identify issues
    // that are unlikely to cause the video processing to fail but that
    // might cause problems such as sync issues, video artifacts, or a
    // missing audio track.
    let processingWarnings: [String] //  json:"processingWarnings,omitempty" 

    // tagSuggestions: A list of keyword tags that could be added to the
    // video's metadata to increase the likelihood that users will locate
    // your video when searching or browsing on YouTube.
    let tagSuggestions: [VideoSuggestionsTagSuggestion] //  json:"tagSuggestions,omitempty" 

    static func decode (j: JSON) -> VideoSuggestions {
        return VideoSuggestions(
            editorSuggestions: map( j["editorSuggestions"].arrayValue, { $0.stringValue } ),
            processingErrors: map( j["processingErrors"].arrayValue, { $0.stringValue } ),
            processingHints: map( j["processingHints"].arrayValue, { $0.stringValue } ),
            processingWarnings: map( j["processingWarnings"].arrayValue, { $0.stringValue } ),
            tagSuggestions: map( j["tagSuggestions"].arrayValue, { (json: JSON) -> VideoSuggestionsTagSuggestion in VideoSuggestionsTagSuggestion.decode(j["$0"]) } )
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoSuggestionsTagSuggestion {
    // categoryRestricts: A set of video categories for which the tag is
    // relevant. You can use this information to display appropriate tag
    // suggestions based on the video category that the video uploader
    // associates with the video. By default, tag suggestions are relevant
    // for all categories if there are no restricts defined for the keyword.
    let categoryRestricts: [String] //  json:"categoryRestricts,omitempty" 

    // tag: The keyword tag suggested for the video.
    let tag: String //  json:"tag,omitempty" 

    static func decode (j: JSON) -> VideoSuggestionsTagSuggestion {
        return VideoSuggestionsTagSuggestion(
            categoryRestricts: map( j["categoryRestricts"].arrayValue, { $0.stringValue } ),
            tag: j["tag"].stringValue
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct VideoTopicDetails {
    // relevantTopicIds: Similar to topic_id, except that these topics are
    // merely relevant to the video. These are topics that may be mentioned
    // in, or appear in the video. You can retrieve information about each
    // topic using Freebase Topic API.
    let relevantTopicIds: [String] //  json:"relevantTopicIds,omitempty" 

    // topicIds: A list of Freebase topic IDs that are centrally associated
    // with the video. These are topics that are centrally featured in the
    // video, and it can be said that the video is mainly about each of
    // these. You can retrieve information about each topic using the
    // Freebase Topic API.
    let topicIds: [String] //  json:"topicIds,omitempty" 

    static func decode (j: JSON) -> VideoTopicDetails {
        return VideoTopicDetails(
            relevantTopicIds: map( j["relevantTopicIds"].arrayValue, { $0.stringValue } ),
            topicIds: map( j["topicIds"].arrayValue, { $0.stringValue } )
        )
    }
}
// writeSchemaCode

// writeSchemaStruct

struct WatchSettings {
    // backgroundColor: The text color for the video watch page's branded
    // area.
    let backgroundColor: String //  json:"backgroundColor,omitempty" 

    // featuredPlaylistId: An ID that uniquely identifies a playlist that
    // displays next to the video player.
    let featuredPlaylistId: String //  json:"featuredPlaylistId,omitempty" 

    // textColor: The background color for the video watch page's branded
    // area.
    let textColor: String //  json:"textColor,omitempty" 

    static func decode (j: JSON) -> WatchSettings {
        return WatchSettings(
            backgroundColor: j["backgroundColor"].stringValue,
            featuredPlaylistId: j["featuredPlaylistId"].stringValue,
            textColor: j["textColor"].stringValue
        )
    }
}
// MARK: meth code
// MARK: res methods

// method id "youtube.activities.insert":
// meth generateCode
// // ...Call struct

struct ActivitiesInsertCall {
    let s: Service
    var opt_: [String: String]
    var part: String
    var activity: Activity
}

// insert: Posts a bulletin for a specific channel. (The user submitting
// the request must be authorized to act on the channel's
// behalf.)
// 
// Note: Even though an activity resource can contain
// information about actions like a user rating a video or marking a
// video as a favorite, you need to use other API methods to generate
// those activity resources. For example, you would use the API's
// videos.rate() method to rate a video and the playlistItems.insert()
// method to mark a video as a favorite.
// // ...Service extension
extension ActivitiesService {
    func insert(part: String, activity: Activity) -> ActivitiesInsertCall {
        var c = ActivitiesInsertCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part,
            activity: activity
            )
        return c
    }
}

// // ...Call extension
extension ActivitiesInsertCall {

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> ActivitiesInsertCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (Activity, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "activities"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        // TODO: convert body to JSON
        let body = ""
        let ctype = "application/json"
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["Content-Type"] = ctype
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.POST, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(Activity.decode(json), error)
        }
    }
        // {
	//   "description": "Posts a bulletin for a specific channel. (The user submitting the request must be authorized to act on the channel's behalf.)\n\nNote: Even though an activity resource can contain information about actions like a user rating a video or marking a video as a favorite, you need to use other API methods to generate those activity resources. For example, you would use the API's videos.rate() method to rate a video and the playlistItems.insert() method to mark a video as a favorite.",
	//   "httpMethod": "POST",
	//   "id": "youtube.activities.insert",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "part": {
	//       "description": "The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.\n\nThe part names that you can include in the parameter value are snippet and contentDetails.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "activities",
	//   "request": {
	//     "$ref": "Activity"
	//   },
	//   "response": {
	//     "$ref": "Activity"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl"
	//   ]
	// }

}

// method id "youtube.activities.list":
// meth generateCode
// // ...Call struct

struct ActivitiesListCall {
    let s: Service
    var opt_: [String: String]
    var part: String
}

// list: Returns a list of channel activity events that match the
// request criteria. For example, you can retrieve events associated
// with a particular channel, events associated with the user's
// subscriptions and Google+ friends, or the YouTube home page feed,
// which is customized for each user.
// // ...Service extension
extension ActivitiesService {
    func list(part: String) -> ActivitiesListCall {
        var c = ActivitiesListCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part
            )
        return c
    }
}

// // ...Call extension
extension ActivitiesListCall {

    // channelId sets the optional parameter "channelId": The channelId
    // parameter specifies a unique YouTube channel ID. The API will then
    // return a list of that channel's activities.
    func channelId(channelId: String) -> ActivitiesListCall {
        c.opt_["channelId"] = channelId
        return c
    }

    // home sets the optional parameter "home": Set this parameter's value
    // to true to retrieve the activity feed that displays on the YouTube
    // home page for the currently authenticated user.
    func home(home: Bool) -> ActivitiesListCall {
        c.opt_["home"] = home
        return c
    }

    // maxResults sets the optional parameter "maxResults": The maxResults
    // parameter specifies the maximum number of items that should be
    // returned in the result set.
    func maxResults(maxResults: Int64) -> ActivitiesListCall {
        c.opt_["maxResults"] = maxResults
        return c
    }

    // mine sets the optional parameter "mine": Set this parameter's value
    // to true to retrieve a feed of the authenticated user's activities.
    func mine(mine: Bool) -> ActivitiesListCall {
        c.opt_["mine"] = mine
        return c
    }

    // pageToken sets the optional parameter "pageToken": The pageToken
    // parameter identifies a specific page in the result set that should be
    // returned. In an API response, the nextPageToken and prevPageToken
    // properties identify other pages that could be retrieved.
    func pageToken(pageToken: String) -> ActivitiesListCall {
        c.opt_["pageToken"] = pageToken
        return c
    }

    // publishedAfter sets the optional parameter "publishedAfter": The
    // publishedAfter parameter specifies the earliest date and time that an
    // activity could have occurred for that activity to be included in the
    // API response. If the parameter value specifies a day, but not a time,
    // then any activities that occurred that day will be included in the
    // result set. The value is specified in ISO 8601
    // (YYYY-MM-DDThh:mm:ss.sZ) format.
    func publishedAfter(publishedAfter: String) -> ActivitiesListCall {
        c.opt_["publishedAfter"] = publishedAfter
        return c
    }

    // publishedBefore sets the optional parameter "publishedBefore": The
    // publishedBefore parameter specifies the date and time before which an
    // activity must have occurred for that activity to be included in the
    // API response. If the parameter value specifies a day, but not a time,
    // then any activities that occurred that day will be excluded from the
    // result set. The value is specified in ISO 8601
    // (YYYY-MM-DDThh:mm:ss.sZ) format.
    func publishedBefore(publishedBefore: String) -> ActivitiesListCall {
        c.opt_["publishedBefore"] = publishedBefore
        return c
    }

    // regionCode sets the optional parameter "regionCode": The regionCode
    // parameter instructs the API to return results for the specified
    // country. The parameter value is an ISO 3166-1 alpha-2 country code.
    // YouTube uses this value when the authorized user's previous activity
    // on YouTube does not provide enough information to generate the
    // activity feed.
    func regionCode(regionCode: String) -> ActivitiesListCall {
        c.opt_["regionCode"] = regionCode
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> ActivitiesListCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (ActivityListResponse, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "activities"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["channelId"] { params["channelId"] = "\(v)" }
        if v = self.opt_["home"] { params["home"] = "\(v)" }
        if v = self.opt_["maxResults"] { params["maxResults"] = "\(v)" }
        if v = self.opt_["mine"] { params["mine"] = "\(v)" }
        if v = self.opt_["pageToken"] { params["pageToken"] = "\(v)" }
        if v = self.opt_["publishedAfter"] { params["publishedAfter"] = "\(v)" }
        if v = self.opt_["publishedBefore"] { params["publishedBefore"] = "\(v)" }
        if v = self.opt_["regionCode"] { params["regionCode"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.GET, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(ActivityListResponse.decode(json), error)
        }
    }
        // {
	//   "description": "Returns a list of channel activity events that match the request criteria. For example, you can retrieve events associated with a particular channel, events associated with the user's subscriptions and Google+ friends, or the YouTube home page feed, which is customized for each user.",
	//   "httpMethod": "GET",
	//   "id": "youtube.activities.list",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "channelId": {
	//       "description": "The channelId parameter specifies a unique YouTube channel ID. The API will then return a list of that channel's activities.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "home": {
	//       "description": "Set this parameter's value to true to retrieve the activity feed that displays on the YouTube home page for the currently authenticated user.",
	//       "location": "query",
	//       "type": "boolean"
	//     },
	//     "maxResults": {
	//       "default": "5",
	//       "description": "The maxResults parameter specifies the maximum number of items that should be returned in the result set.",
	//       "format": "uint32",
	//       "location": "query",
	//       "maximum": "50",
	//       "minimum": "0",
	//       "type": "integer"
	//     },
	//     "mine": {
	//       "description": "Set this parameter's value to true to retrieve a feed of the authenticated user's activities.",
	//       "location": "query",
	//       "type": "boolean"
	//     },
	//     "pageToken": {
	//       "description": "The pageToken parameter identifies a specific page in the result set that should be returned. In an API response, the nextPageToken and prevPageToken properties identify other pages that could be retrieved.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter specifies a comma-separated list of one or more activity resource properties that the API response will include. The part names that you can include in the parameter value are id, snippet, and contentDetails.\n\nIf the parameter identifies a property that contains child properties, the child properties will be included in the response. For example, in a activity resource, the snippet property contains other properties that identify the type of activity, a display title for the activity, and so forth. If you set part=snippet, the API response will also contain all of those nested properties.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     },
	//     "publishedAfter": {
	//       "description": "The publishedAfter parameter specifies the earliest date and time that an activity could have occurred for that activity to be included in the API response. If the parameter value specifies a day, but not a time, then any activities that occurred that day will be included in the result set. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.",
	//       "format": "date-time",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "publishedBefore": {
	//       "description": "The publishedBefore parameter specifies the date and time before which an activity must have occurred for that activity to be included in the API response. If the parameter value specifies a day, but not a time, then any activities that occurred that day will be excluded from the result set. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sZ) format.",
	//       "format": "date-time",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "regionCode": {
	//       "description": "The regionCode parameter instructs the API to return results for the specified country. The parameter value is an ISO 3166-1 alpha-2 country code. YouTube uses this value when the authorized user's previous activity on YouTube does not provide enough information to generate the activity feed.",
	//       "location": "query",
	//       "type": "string"
	//     }
	//   },
	//   "path": "activities",
	//   "response": {
	//     "$ref": "ActivityListResponse"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtube.readonly"
	//   ]
	// }

}

// method id "youtube.channelBanners.insert":
// meth generateCode
// // ...Call struct

struct ChannelBannersInsertCall {
    let s: Service
    var opt_: [String: String]
    var channelbannerresource: ChannelBannerResource
/* TODO: upload support
	media_     io.Reader
	resumable_ googleapi.SizeReaderAt
	mediaType_ string
	ctx_       context.Context
	protocol_  string
 TODO: upload support */
}

// insert: Uploads a channel banner image to YouTube. This method
// represents the first two steps in a three-step process to update the
// banner image for a channel:
// 
// - Call the channelBanners.insert method
// to upload the binary image data to YouTube. The image must have a
// 16:9 aspect ratio and be at least 2120x1192 pixels.
// - Extract the url
// property's value from the response that the API returns for step 1.
// -
// Call the channels.update method to update the channel's branding
// settings. Set the brandingSettings.image.bannerExternalUrl property's
// value to the URL obtained in step 2.
// // ...Service extension
extension ChannelBannersService {
    func insert(channelbannerresource: ChannelBannerResource) -> ChannelBannersInsertCall {
        var c = ChannelBannersInsertCall(
            s: s,
            opt_: Dictionary<String, String>(),
            channelbannerresource: channelbannerresource
            )
        return c
    }
}

// // ...Call extension
extension ChannelBannersInsertCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> ChannelBannersInsertCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }
//TODO: convert media upload

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> ChannelBannersInsertCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (ChannelBannerResource, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "channelBanners/insert"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        // TODO: convert body to JSON
        let body = ""
        let ctype = "application/json"
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        // TODO: Swift Media upload goes here
        // TODO: Swift Media upload goes here
// TODO: convert to swift
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.POST, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(ChannelBannerResource.decode(json), error)
        }
// TODO: convert to swift
    }
        // {
	//   "description": "Uploads a channel banner image to YouTube. This method represents the first two steps in a three-step process to update the banner image for a channel:\n\n- Call the channelBanners.insert method to upload the binary image data to YouTube. The image must have a 16:9 aspect ratio and be at least 2120x1192 pixels.\n- Extract the url property's value from the response that the API returns for step 1.\n- Call the channels.update method to update the channel's branding settings. Set the brandingSettings.image.bannerExternalUrl property's value to the URL obtained in step 2.",
	//   "httpMethod": "POST",
	//   "id": "youtube.channelBanners.insert",
	//   "mediaUpload": {
	//     "accept": [
	//       "application/octet-stream",
	//       "image/jpeg",
	//       "image/png"
	//     ],
	//     "maxSize": "6MB",
	//     "protocols": {
	//       "resumable": {
	//         "multipart": true,
	//         "path": "/resumable/upload/youtube/v3/channelBanners/insert"
	//       },
	//       "simple": {
	//         "multipart": true,
	//         "path": "/upload/youtube/v3/channelBanners/insert"
	//       }
	//     }
	//   },
	//   "parameters": {
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     }
	//   },
	//   "path": "channelBanners/insert",
	//   "request": {
	//     "$ref": "ChannelBannerResource"
	//   },
	//   "response": {
	//     "$ref": "ChannelBannerResource"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtube.upload"
	//   ],
	//   "supportsMediaUpload": true
	// }

}

// method id "youtube.channelSections.delete":
// meth generateCode
// // ...Call struct

struct ChannelSectionsDeleteCall {
    let s: Service
    var opt_: [String: String]
    var id: String
}

// delete: Deletes a channelSection.
// // ...Service extension
extension ChannelSectionsService {
    func delete(id: String) -> ChannelSectionsDeleteCall {
        var c = ChannelSectionsDeleteCall(
            s: s,
            opt_: Dictionary<String, String>(),
            id: id
            )
        return c
    }
}

// // ...Call extension
extension ChannelSectionsDeleteCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> ChannelSectionsDeleteCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> ChannelSectionsDeleteCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "channelSections"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["id"] = "\(self.id)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.DELETE, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(.decode(json), error)
        }
    }
        // {
	//   "description": "Deletes a channelSection.",
	//   "httpMethod": "DELETE",
	//   "id": "youtube.channelSections.delete",
	//   "parameterOrder": [
	//     "id"
	//   ],
	//   "parameters": {
	//     "id": {
	//       "description": "The id parameter specifies the YouTube channelSection ID for the resource that is being deleted. In a channelSection resource, the id property specifies the YouTube channelSection ID.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     }
	//   },
	//   "path": "channelSections",
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.channelSections.insert":
// meth generateCode
// // ...Call struct

struct ChannelSectionsInsertCall {
    let s: Service
    var opt_: [String: String]
    var part: String
    var channelsection: ChannelSection
}

// insert: Adds a channelSection for the authenticated user's channel.
// // ...Service extension
extension ChannelSectionsService {
    func insert(part: String, channelsection: ChannelSection) -> ChannelSectionsInsertCall {
        var c = ChannelSectionsInsertCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part,
            channelsection: channelsection
            )
        return c
    }
}

// // ...Call extension
extension ChannelSectionsInsertCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> ChannelSectionsInsertCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // onBehalfOfContentOwnerChannel sets the optional parameter
    // "onBehalfOfContentOwnerChannel": This parameter can only be used in a
    // properly authorized request. Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The
    // onBehalfOfContentOwnerChannel parameter specifies the YouTube channel
    // ID of the channel to which a video is being added. This parameter is
    // required when a request specifies a value for the
    // onBehalfOfContentOwner parameter, and it can only be used in
    // conjunction with that parameter. In addition, the request must be
    // authorized using a CMS account that is linked to the content owner
    // that the onBehalfOfContentOwner parameter specifies. Finally, the
    // channel that the onBehalfOfContentOwnerChannel parameter value
    // specifies must be linked to the content owner that the
    // onBehalfOfContentOwner parameter specifies.
    // 
    // This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and perform actions on behalf of the channel specified in the
    // parameter value, without having to provide authentication credentials
    // for each separate channel.
    func onBehalfOfContentOwnerChannel(onBehalfOfContentOwnerChannel: String) -> ChannelSectionsInsertCall {
        c.opt_["onBehalfOfContentOwnerChannel"] = onBehalfOfContentOwnerChannel
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> ChannelSectionsInsertCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (ChannelSection, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "channelSections"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        // TODO: convert body to JSON
        let body = ""
        let ctype = "application/json"
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwnerChannel"] { params["onBehalfOfContentOwnerChannel"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["Content-Type"] = ctype
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.POST, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(ChannelSection.decode(json), error)
        }
    }
        // {
	//   "description": "Adds a channelSection for the authenticated user's channel.",
	//   "httpMethod": "POST",
	//   "id": "youtube.channelSections.insert",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwnerChannel": {
	//       "description": "This parameter can only be used in a properly authorized request. Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID of the channel to which a video is being added. This parameter is required when a request specifies a value for the onBehalfOfContentOwner parameter, and it can only be used in conjunction with that parameter. In addition, the request must be authorized using a CMS account that is linked to the content owner that the onBehalfOfContentOwner parameter specifies. Finally, the channel that the onBehalfOfContentOwnerChannel parameter value specifies must be linked to the content owner that the onBehalfOfContentOwner parameter specifies.\n\nThis parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and perform actions on behalf of the channel specified in the parameter value, without having to provide authentication credentials for each separate channel.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.\n\nThe part names that you can include in the parameter value are snippet and contentDetails.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "channelSections",
	//   "request": {
	//     "$ref": "ChannelSection"
	//   },
	//   "response": {
	//     "$ref": "ChannelSection"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.channelSections.list":
// meth generateCode
// // ...Call struct

struct ChannelSectionsListCall {
    let s: Service
    var opt_: [String: String]
    var part: String
}

// list: Returns channelSection resources that match the API request
// criteria.
// // ...Service extension
extension ChannelSectionsService {
    func list(part: String) -> ChannelSectionsListCall {
        var c = ChannelSectionsListCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part
            )
        return c
    }
}

// // ...Call extension
extension ChannelSectionsListCall {

    // channelId sets the optional parameter "channelId": The channelId
    // parameter specifies a YouTube channel ID. The API will only return
    // that channel's channelSections.
    func channelId(channelId: String) -> ChannelSectionsListCall {
        c.opt_["channelId"] = channelId
        return c
    }

    // id sets the optional parameter "id": The id parameter specifies a
    // comma-separated list of the YouTube channelSection ID(s) for the
    // resource(s) that are being retrieved. In a channelSection resource,
    // the id property specifies the YouTube channelSection ID.
    func id(id: String) -> ChannelSectionsListCall {
        c.opt_["id"] = id
        return c
    }

    // mine sets the optional parameter "mine": Set this parameter's value
    // to true to retrieve a feed of the authenticated user's
    // channelSections.
    func mine(mine: Bool) -> ChannelSectionsListCall {
        c.opt_["mine"] = mine
        return c
    }

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> ChannelSectionsListCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> ChannelSectionsListCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (ChannelSectionListResponse, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "channelSections"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["channelId"] { params["channelId"] = "\(v)" }
        if v = self.opt_["id"] { params["id"] = "\(v)" }
        if v = self.opt_["mine"] { params["mine"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.GET, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(ChannelSectionListResponse.decode(json), error)
        }
    }
        // {
	//   "description": "Returns channelSection resources that match the API request criteria.",
	//   "httpMethod": "GET",
	//   "id": "youtube.channelSections.list",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "channelId": {
	//       "description": "The channelId parameter specifies a YouTube channel ID. The API will only return that channel's channelSections.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "id": {
	//       "description": "The id parameter specifies a comma-separated list of the YouTube channelSection ID(s) for the resource(s) that are being retrieved. In a channelSection resource, the id property specifies the YouTube channelSection ID.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "mine": {
	//       "description": "Set this parameter's value to true to retrieve a feed of the authenticated user's channelSections.",
	//       "location": "query",
	//       "type": "boolean"
	//     },
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter specifies a comma-separated list of one or more channelSection resource properties that the API response will include. The part names that you can include in the parameter value are id, snippet, and contentDetails.\n\nIf the parameter identifies a property that contains child properties, the child properties will be included in the response. For example, in a channelSection resource, the snippet property contains other properties, such as a display title for the channelSection. If you set part=snippet, the API response will also contain all of those nested properties.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "channelSections",
	//   "response": {
	//     "$ref": "ChannelSectionListResponse"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtube.readonly",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.channelSections.update":
// meth generateCode
// // ...Call struct

struct ChannelSectionsUpdateCall {
    let s: Service
    var opt_: [String: String]
    var part: String
    var channelsection: ChannelSection
}

// update: Update a channelSection.
// // ...Service extension
extension ChannelSectionsService {
    func update(part: String, channelsection: ChannelSection) -> ChannelSectionsUpdateCall {
        var c = ChannelSectionsUpdateCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part,
            channelsection: channelsection
            )
        return c
    }
}

// // ...Call extension
extension ChannelSectionsUpdateCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> ChannelSectionsUpdateCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> ChannelSectionsUpdateCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (ChannelSection, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "channelSections"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        // TODO: convert body to JSON
        let body = ""
        let ctype = "application/json"
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["Content-Type"] = ctype
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.PUT, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(ChannelSection.decode(json), error)
        }
    }
        // {
	//   "description": "Update a channelSection.",
	//   "httpMethod": "PUT",
	//   "id": "youtube.channelSections.update",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.\n\nThe part names that you can include in the parameter value are snippet and contentDetails.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "channelSections",
	//   "request": {
	//     "$ref": "ChannelSection"
	//   },
	//   "response": {
	//     "$ref": "ChannelSection"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.channels.list":
// meth generateCode
// // ...Call struct

struct ChannelsListCall {
    let s: Service
    var opt_: [String: String]
    var part: String
}

// list: Returns a collection of zero or more channel resources that
// match the request criteria.
// // ...Service extension
extension ChannelsService {
    func list(part: String) -> ChannelsListCall {
        var c = ChannelsListCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part
            )
        return c
    }
}

// // ...Call extension
extension ChannelsListCall {

    // categoryId sets the optional parameter "categoryId": The categoryId
    // parameter specifies a YouTube guide category, thereby requesting
    // YouTube channels associated with that category.
    func categoryId(categoryId: String) -> ChannelsListCall {
        c.opt_["categoryId"] = categoryId
        return c
    }

    // forUsername sets the optional parameter "forUsername": The
    // forUsername parameter specifies a YouTube username, thereby
    // requesting the channel associated with that username.
    func forUsername(forUsername: String) -> ChannelsListCall {
        c.opt_["forUsername"] = forUsername
        return c
    }

    // id sets the optional parameter "id": The id parameter specifies a
    // comma-separated list of the YouTube channel ID(s) for the resource(s)
    // that are being retrieved. In a channel resource, the id property
    // specifies the channel's YouTube channel ID.
    func id(id: String) -> ChannelsListCall {
        c.opt_["id"] = id
        return c
    }

    // managedByMe sets the optional parameter "managedByMe": Set this
    // parameter's value to true to instruct the API to only return channels
    // managed by the content owner that the onBehalfOfContentOwner
    // parameter specifies. The user must be authenticated as a CMS account
    // linked to the specified content owner and onBehalfOfContentOwner must
    // be provided.
    func managedByMe(managedByMe: Bool) -> ChannelsListCall {
        c.opt_["managedByMe"] = managedByMe
        return c
    }

    // maxResults sets the optional parameter "maxResults": The maxResults
    // parameter specifies the maximum number of items that should be
    // returned in the result set.
    func maxResults(maxResults: Int64) -> ChannelsListCall {
        c.opt_["maxResults"] = maxResults
        return c
    }

    // mine sets the optional parameter "mine": Set this parameter's value
    // to true to instruct the API to only return channels owned by the
    // authenticated user.
    func mine(mine: Bool) -> ChannelsListCall {
        c.opt_["mine"] = mine
        return c
    }

    // mySubscribers sets the optional parameter "mySubscribers": Set this
    // parameter's value to true to retrieve a list of channels that
    // subscribed to the authenticated user's channel.
    func mySubscribers(mySubscribers: Bool) -> ChannelsListCall {
        c.opt_["mySubscribers"] = mySubscribers
        return c
    }

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": The onBehalfOfContentOwner parameter
    // indicates that the authenticated user is acting on behalf of the
    // content owner specified in the parameter value. This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and get access to all their video and channel data, without
    // having to provide authentication credentials for each individual
    // channel. The actual CMS account that the user authenticates with
    // needs to be linked to the specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> ChannelsListCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // pageToken sets the optional parameter "pageToken": The pageToken
    // parameter identifies a specific page in the result set that should be
    // returned. In an API response, the nextPageToken and prevPageToken
    // properties identify other pages that could be retrieved.
    func pageToken(pageToken: String) -> ChannelsListCall {
        c.opt_["pageToken"] = pageToken
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> ChannelsListCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (ChannelListResponse, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "channels"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["categoryId"] { params["categoryId"] = "\(v)" }
        if v = self.opt_["forUsername"] { params["forUsername"] = "\(v)" }
        if v = self.opt_["id"] { params["id"] = "\(v)" }
        if v = self.opt_["managedByMe"] { params["managedByMe"] = "\(v)" }
        if v = self.opt_["maxResults"] { params["maxResults"] = "\(v)" }
        if v = self.opt_["mine"] { params["mine"] = "\(v)" }
        if v = self.opt_["mySubscribers"] { params["mySubscribers"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["pageToken"] { params["pageToken"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.GET, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(ChannelListResponse.decode(json), error)
        }
    }
        // {
	//   "description": "Returns a collection of zero or more channel resources that match the request criteria.",
	//   "httpMethod": "GET",
	//   "id": "youtube.channels.list",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "categoryId": {
	//       "description": "The categoryId parameter specifies a YouTube guide category, thereby requesting YouTube channels associated with that category.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "forUsername": {
	//       "description": "The forUsername parameter specifies a YouTube username, thereby requesting the channel associated with that username.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "id": {
	//       "description": "The id parameter specifies a comma-separated list of the YouTube channel ID(s) for the resource(s) that are being retrieved. In a channel resource, the id property specifies the channel's YouTube channel ID.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "managedByMe": {
	//       "description": "Set this parameter's value to true to instruct the API to only return channels managed by the content owner that the onBehalfOfContentOwner parameter specifies. The user must be authenticated as a CMS account linked to the specified content owner and onBehalfOfContentOwner must be provided.",
	//       "location": "query",
	//       "type": "boolean"
	//     },
	//     "maxResults": {
	//       "default": "5",
	//       "description": "The maxResults parameter specifies the maximum number of items that should be returned in the result set.",
	//       "format": "uint32",
	//       "location": "query",
	//       "maximum": "50",
	//       "minimum": "0",
	//       "type": "integer"
	//     },
	//     "mine": {
	//       "description": "Set this parameter's value to true to instruct the API to only return channels owned by the authenticated user.",
	//       "location": "query",
	//       "type": "boolean"
	//     },
	//     "mySubscribers": {
	//       "description": "Set this parameter's value to true to retrieve a list of channels that subscribed to the authenticated user's channel.",
	//       "location": "query",
	//       "type": "boolean"
	//     },
	//     "onBehalfOfContentOwner": {
	//       "description": "The onBehalfOfContentOwner parameter indicates that the authenticated user is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The actual CMS account that the user authenticates with needs to be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "pageToken": {
	//       "description": "The pageToken parameter identifies a specific page in the result set that should be returned. In an API response, the nextPageToken and prevPageToken properties identify other pages that could be retrieved.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter specifies a comma-separated list of one or more channel resource properties that the API response will include. The part names that you can include in the parameter value are id, snippet, contentDetails, statistics, topicDetails, and invideoPromotion.\n\nIf the parameter identifies a property that contains child properties, the child properties will be included in the response. For example, in a channel resource, the contentDetails property contains other properties, such as the uploads properties. As such, if you set part=contentDetails, the API response will also contain all of those nested properties.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "channels",
	//   "response": {
	//     "$ref": "ChannelListResponse"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtube.readonly",
	//     "https://www.googleapis.com/auth/youtubepartner",
	//     "https://www.googleapis.com/auth/youtubepartner-channel-audit"
	//   ]
	// }

}

// method id "youtube.channels.update":
// meth generateCode
// // ...Call struct

struct ChannelsUpdateCall {
    let s: Service
    var opt_: [String: String]
    var part: String
    var channel: Channel
}

// update: Updates a channel's metadata.
// // ...Service extension
extension ChannelsService {
    func update(part: String, channel: Channel) -> ChannelsUpdateCall {
        var c = ChannelsUpdateCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part,
            channel: channel
            )
        return c
    }
}

// // ...Call extension
extension ChannelsUpdateCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": The onBehalfOfContentOwner parameter
    // indicates that the authenticated user is acting on behalf of the
    // content owner specified in the parameter value. This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and get access to all their video and channel data, without
    // having to provide authentication credentials for each individual
    // channel. The actual CMS account that the user authenticates with
    // needs to be linked to the specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> ChannelsUpdateCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> ChannelsUpdateCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (Channel, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "channels"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        // TODO: convert body to JSON
        let body = ""
        let ctype = "application/json"
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["Content-Type"] = ctype
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.PUT, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(Channel.decode(json), error)
        }
    }
        // {
	//   "description": "Updates a channel's metadata.",
	//   "httpMethod": "PUT",
	//   "id": "youtube.channels.update",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "onBehalfOfContentOwner": {
	//       "description": "The onBehalfOfContentOwner parameter indicates that the authenticated user is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The actual CMS account that the user authenticates with needs to be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.\n\nThe part names that you can include in the parameter value are id and invideoPromotion.\n\nNote that this method will override the existing values for all of the mutable properties that are contained in any parts that the parameter value specifies.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "channels",
	//   "request": {
	//     "$ref": "Channel"
	//   },
	//   "response": {
	//     "$ref": "Channel"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.guideCategories.list":
// meth generateCode
// // ...Call struct

struct GuideCategoriesListCall {
    let s: Service
    var opt_: [String: String]
    var part: String
}

// list: Returns a list of categories that can be associated with
// YouTube channels.
// // ...Service extension
extension GuideCategoriesService {
    func list(part: String) -> GuideCategoriesListCall {
        var c = GuideCategoriesListCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part
            )
        return c
    }
}

// // ...Call extension
extension GuideCategoriesListCall {

    // hl sets the optional parameter "hl": The hl parameter specifies the
    // language that will be used for text values in the API response.
    func hl(hl: String) -> GuideCategoriesListCall {
        c.opt_["hl"] = hl
        return c
    }

    // id sets the optional parameter "id": The id parameter specifies a
    // comma-separated list of the YouTube channel category ID(s) for the
    // resource(s) that are being retrieved. In a guideCategory resource,
    // the id property specifies the YouTube channel category ID.
    func id(id: String) -> GuideCategoriesListCall {
        c.opt_["id"] = id
        return c
    }

    // regionCode sets the optional parameter "regionCode": The regionCode
    // parameter instructs the API to return the list of guide categories
    // available in the specified country. The parameter value is an ISO
    // 3166-1 alpha-2 country code.
    func regionCode(regionCode: String) -> GuideCategoriesListCall {
        c.opt_["regionCode"] = regionCode
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> GuideCategoriesListCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (GuideCategoryListResponse, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "guideCategories"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["hl"] { params["hl"] = "\(v)" }
        if v = self.opt_["id"] { params["id"] = "\(v)" }
        if v = self.opt_["regionCode"] { params["regionCode"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.GET, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(GuideCategoryListResponse.decode(json), error)
        }
    }
        // {
	//   "description": "Returns a list of categories that can be associated with YouTube channels.",
	//   "httpMethod": "GET",
	//   "id": "youtube.guideCategories.list",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "hl": {
	//       "default": "en-US",
	//       "description": "The hl parameter specifies the language that will be used for text values in the API response.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "id": {
	//       "description": "The id parameter specifies a comma-separated list of the YouTube channel category ID(s) for the resource(s) that are being retrieved. In a guideCategory resource, the id property specifies the YouTube channel category ID.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter specifies a comma-separated list of one or more guideCategory resource properties that the API response will include. The part names that you can include in the parameter value are id and snippet.\n\nIf the parameter identifies a property that contains child properties, the child properties will be included in the response. For example, in a guideCategory resource, the snippet property contains other properties, such as the category's title. If you set part=snippet, the API response will also contain all of those nested properties.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     },
	//     "regionCode": {
	//       "description": "The regionCode parameter instructs the API to return the list of guide categories available in the specified country. The parameter value is an ISO 3166-1 alpha-2 country code.",
	//       "location": "query",
	//       "type": "string"
	//     }
	//   },
	//   "path": "guideCategories",
	//   "response": {
	//     "$ref": "GuideCategoryListResponse"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtube.readonly",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.i18nLanguages.list":
// meth generateCode
// // ...Call struct

struct I18nLanguagesListCall {
    let s: Service
    var opt_: [String: String]
    var part: String
}

// list: Returns a list of supported languages.
// // ...Service extension
extension I18nLanguagesService {
    func list(part: String) -> I18nLanguagesListCall {
        var c = I18nLanguagesListCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part
            )
        return c
    }
}

// // ...Call extension
extension I18nLanguagesListCall {

    // hl sets the optional parameter "hl": The hl parameter specifies the
    // language that should be used for text values in the API response.
    func hl(hl: String) -> I18nLanguagesListCall {
        c.opt_["hl"] = hl
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> I18nLanguagesListCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (I18nLanguageListResponse, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "i18nLanguages"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["hl"] { params["hl"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.GET, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(I18nLanguageListResponse.decode(json), error)
        }
    }
        // {
	//   "description": "Returns a list of supported languages.",
	//   "httpMethod": "GET",
	//   "id": "youtube.i18nLanguages.list",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "hl": {
	//       "default": "en_US",
	//       "description": "The hl parameter specifies the language that should be used for text values in the API response.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter specifies a comma-separated list of one or more i18nLanguage resource properties that the API response will include. The part names that you can include in the parameter value are id and snippet.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "i18nLanguages",
	//   "response": {
	//     "$ref": "I18nLanguageListResponse"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtube.readonly",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.i18nRegions.list":
// meth generateCode
// // ...Call struct

struct I18nRegionsListCall {
    let s: Service
    var opt_: [String: String]
    var part: String
}

// list: Returns a list of supported regions.
// // ...Service extension
extension I18nRegionsService {
    func list(part: String) -> I18nRegionsListCall {
        var c = I18nRegionsListCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part
            )
        return c
    }
}

// // ...Call extension
extension I18nRegionsListCall {

    // hl sets the optional parameter "hl": The hl parameter specifies the
    // language that should be used for text values in the API response.
    func hl(hl: String) -> I18nRegionsListCall {
        c.opt_["hl"] = hl
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> I18nRegionsListCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (I18nRegionListResponse, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "i18nRegions"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["hl"] { params["hl"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.GET, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(I18nRegionListResponse.decode(json), error)
        }
    }
        // {
	//   "description": "Returns a list of supported regions.",
	//   "httpMethod": "GET",
	//   "id": "youtube.i18nRegions.list",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "hl": {
	//       "default": "en_US",
	//       "description": "The hl parameter specifies the language that should be used for text values in the API response.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter specifies a comma-separated list of one or more i18nRegion resource properties that the API response will include. The part names that you can include in the parameter value are id and snippet.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "i18nRegions",
	//   "response": {
	//     "$ref": "I18nRegionListResponse"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtube.readonly",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.liveBroadcasts.bind":
// meth generateCode
// // ...Call struct

struct LiveBroadcastsBindCall {
    let s: Service
    var opt_: [String: String]
    var id: String
    var part: String
}

// bind: Binds a YouTube broadcast to a stream or removes an existing
// binding between a broadcast and a stream. A broadcast can only be
// bound to one video stream.
// // ...Service extension
extension LiveBroadcastsService {
    func bind(id: String, part: String) -> LiveBroadcastsBindCall {
        var c = LiveBroadcastsBindCall(
            s: s,
            opt_: Dictionary<String, String>(),
            id: id,
            part: part
            )
        return c
    }
}

// // ...Call extension
extension LiveBroadcastsBindCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> LiveBroadcastsBindCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // onBehalfOfContentOwnerChannel sets the optional parameter
    // "onBehalfOfContentOwnerChannel": This parameter can only be used in a
    // properly authorized request. Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The
    // onBehalfOfContentOwnerChannel parameter specifies the YouTube channel
    // ID of the channel to which a video is being added. This parameter is
    // required when a request specifies a value for the
    // onBehalfOfContentOwner parameter, and it can only be used in
    // conjunction with that parameter. In addition, the request must be
    // authorized using a CMS account that is linked to the content owner
    // that the onBehalfOfContentOwner parameter specifies. Finally, the
    // channel that the onBehalfOfContentOwnerChannel parameter value
    // specifies must be linked to the content owner that the
    // onBehalfOfContentOwner parameter specifies.
    // 
    // This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and perform actions on behalf of the channel specified in the
    // parameter value, without having to provide authentication credentials
    // for each separate channel.
    func onBehalfOfContentOwnerChannel(onBehalfOfContentOwnerChannel: String) -> LiveBroadcastsBindCall {
        c.opt_["onBehalfOfContentOwnerChannel"] = onBehalfOfContentOwnerChannel
        return c
    }

    // streamId sets the optional parameter "streamId": The streamId
    // parameter specifies the unique ID of the video stream that is being
    // bound to a broadcast. If this parameter is omitted, the API will
    // remove any existing binding between the broadcast and a video stream.
    func streamId(streamId: String) -> LiveBroadcastsBindCall {
        c.opt_["streamId"] = streamId
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> LiveBroadcastsBindCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (LiveBroadcast, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "liveBroadcasts/bind"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["id"] = "\(self.id)"
        params["part"] = "\(self.part)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwnerChannel"] { params["onBehalfOfContentOwnerChannel"] = "\(v)" }
        if v = self.opt_["streamId"] { params["streamId"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.POST, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(LiveBroadcast.decode(json), error)
        }
    }
        // {
	//   "description": "Binds a YouTube broadcast to a stream or removes an existing binding between a broadcast and a stream. A broadcast can only be bound to one video stream.",
	//   "httpMethod": "POST",
	//   "id": "youtube.liveBroadcasts.bind",
	//   "parameterOrder": [
	//     "id",
	//     "part"
	//   ],
	//   "parameters": {
	//     "id": {
	//       "description": "The id parameter specifies the unique ID of the broadcast that is being bound to a video stream.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwnerChannel": {
	//       "description": "This parameter can only be used in a properly authorized request. Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID of the channel to which a video is being added. This parameter is required when a request specifies a value for the onBehalfOfContentOwner parameter, and it can only be used in conjunction with that parameter. In addition, the request must be authorized using a CMS account that is linked to the content owner that the onBehalfOfContentOwner parameter specifies. Finally, the channel that the onBehalfOfContentOwnerChannel parameter value specifies must be linked to the content owner that the onBehalfOfContentOwner parameter specifies.\n\nThis parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and perform actions on behalf of the channel specified in the parameter value, without having to provide authentication credentials for each separate channel.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter specifies a comma-separated list of one or more liveBroadcast resource properties that the API response will include. The part names that you can include in the parameter value are id, snippet, contentDetails, and status.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     },
	//     "streamId": {
	//       "description": "The streamId parameter specifies the unique ID of the video stream that is being bound to a broadcast. If this parameter is omitted, the API will remove any existing binding between the broadcast and a video stream.",
	//       "location": "query",
	//       "type": "string"
	//     }
	//   },
	//   "path": "liveBroadcasts/bind",
	//   "response": {
	//     "$ref": "LiveBroadcast"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl"
	//   ]
	// }

}

// method id "youtube.liveBroadcasts.control":
// meth generateCode
// // ...Call struct

struct LiveBroadcastsControlCall {
    let s: Service
    var opt_: [String: String]
    var id: String
    var part: String
}

// control: Controls the settings for a slate that can be displayed in
// the broadcast stream.
// // ...Service extension
extension LiveBroadcastsService {
    func control(id: String, part: String) -> LiveBroadcastsControlCall {
        var c = LiveBroadcastsControlCall(
            s: s,
            opt_: Dictionary<String, String>(),
            id: id,
            part: part
            )
        return c
    }
}

// // ...Call extension
extension LiveBroadcastsControlCall {

    // displaySlate sets the optional parameter "displaySlate": The
    // displaySlate parameter specifies whether the slate is being enabled
    // or disabled.
    func displaySlate(displaySlate: Bool) -> LiveBroadcastsControlCall {
        c.opt_["displaySlate"] = displaySlate
        return c
    }

    // offsetTimeMs sets the optional parameter "offsetTimeMs": The
    // offsetTimeMs parameter specifies a positive time offset when the
    // specified slate change will occur. The value is measured in
    // milliseconds from the beginning of the broadcast's monitor stream,
    // which is the time that the testing phase for the broadcast began.
    // Even though it is specified in milliseconds, the value is actually an
    // approximation, and YouTube completes the requested action as closely
    // as possible to that time.
    // 
    // If you do not specify a value for this
    // parameter, then YouTube performs the action as soon as possible. See
    // the Getting started guide for more details.
    // 
    // Important: You should
    // only specify a value for this parameter if your broadcast stream is
    // delayed.
    func offsetTimeMs(offsetTimeMs: UInt64) -> LiveBroadcastsControlCall {
        c.opt_["offsetTimeMs"] = offsetTimeMs
        return c
    }

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> LiveBroadcastsControlCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // onBehalfOfContentOwnerChannel sets the optional parameter
    // "onBehalfOfContentOwnerChannel": This parameter can only be used in a
    // properly authorized request. Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The
    // onBehalfOfContentOwnerChannel parameter specifies the YouTube channel
    // ID of the channel to which a video is being added. This parameter is
    // required when a request specifies a value for the
    // onBehalfOfContentOwner parameter, and it can only be used in
    // conjunction with that parameter. In addition, the request must be
    // authorized using a CMS account that is linked to the content owner
    // that the onBehalfOfContentOwner parameter specifies. Finally, the
    // channel that the onBehalfOfContentOwnerChannel parameter value
    // specifies must be linked to the content owner that the
    // onBehalfOfContentOwner parameter specifies.
    // 
    // This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and perform actions on behalf of the channel specified in the
    // parameter value, without having to provide authentication credentials
    // for each separate channel.
    func onBehalfOfContentOwnerChannel(onBehalfOfContentOwnerChannel: String) -> LiveBroadcastsControlCall {
        c.opt_["onBehalfOfContentOwnerChannel"] = onBehalfOfContentOwnerChannel
        return c
    }

    // walltime sets the optional parameter "walltime": The walltime
    // parameter specifies the wall clock time at which the specified slate
    // change will occur. The value is specified in ISO 8601
    // (YYYY-MM-DDThh:mm:ss.sssZ) format.
    func walltime(walltime: String) -> LiveBroadcastsControlCall {
        c.opt_["walltime"] = walltime
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> LiveBroadcastsControlCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (LiveBroadcast, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "liveBroadcasts/control"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["id"] = "\(self.id)"
        params["part"] = "\(self.part)"
        if v = self.opt_["displaySlate"] { params["displaySlate"] = "\(v)" }
        if v = self.opt_["offsetTimeMs"] { params["offsetTimeMs"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwnerChannel"] { params["onBehalfOfContentOwnerChannel"] = "\(v)" }
        if v = self.opt_["walltime"] { params["walltime"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.POST, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(LiveBroadcast.decode(json), error)
        }
    }
        // {
	//   "description": "Controls the settings for a slate that can be displayed in the broadcast stream.",
	//   "httpMethod": "POST",
	//   "id": "youtube.liveBroadcasts.control",
	//   "parameterOrder": [
	//     "id",
	//     "part"
	//   ],
	//   "parameters": {
	//     "displaySlate": {
	//       "description": "The displaySlate parameter specifies whether the slate is being enabled or disabled.",
	//       "location": "query",
	//       "type": "boolean"
	//     },
	//     "id": {
	//       "description": "The id parameter specifies the YouTube live broadcast ID that uniquely identifies the broadcast in which the slate is being updated.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     },
	//     "offsetTimeMs": {
	//       "description": "The offsetTimeMs parameter specifies a positive time offset when the specified slate change will occur. The value is measured in milliseconds from the beginning of the broadcast's monitor stream, which is the time that the testing phase for the broadcast began. Even though it is specified in milliseconds, the value is actually an approximation, and YouTube completes the requested action as closely as possible to that time.\n\nIf you do not specify a value for this parameter, then YouTube performs the action as soon as possible. See the Getting started guide for more details.\n\nImportant: You should only specify a value for this parameter if your broadcast stream is delayed.",
	//       "format": "uint64",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwnerChannel": {
	//       "description": "This parameter can only be used in a properly authorized request. Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID of the channel to which a video is being added. This parameter is required when a request specifies a value for the onBehalfOfContentOwner parameter, and it can only be used in conjunction with that parameter. In addition, the request must be authorized using a CMS account that is linked to the content owner that the onBehalfOfContentOwner parameter specifies. Finally, the channel that the onBehalfOfContentOwnerChannel parameter value specifies must be linked to the content owner that the onBehalfOfContentOwner parameter specifies.\n\nThis parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and perform actions on behalf of the channel specified in the parameter value, without having to provide authentication credentials for each separate channel.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter specifies a comma-separated list of one or more liveBroadcast resource properties that the API response will include. The part names that you can include in the parameter value are id, snippet, contentDetails, and status.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     },
	//     "walltime": {
	//       "description": "The walltime parameter specifies the wall clock time at which the specified slate change will occur. The value is specified in ISO 8601 (YYYY-MM-DDThh:mm:ss.sssZ) format.",
	//       "format": "date-time",
	//       "location": "query",
	//       "type": "string"
	//     }
	//   },
	//   "path": "liveBroadcasts/control",
	//   "response": {
	//     "$ref": "LiveBroadcast"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl"
	//   ]
	// }

}

// method id "youtube.liveBroadcasts.delete":
// meth generateCode
// // ...Call struct

struct LiveBroadcastsDeleteCall {
    let s: Service
    var opt_: [String: String]
    var id: String
}

// delete: Deletes a broadcast.
// // ...Service extension
extension LiveBroadcastsService {
    func delete(id: String) -> LiveBroadcastsDeleteCall {
        var c = LiveBroadcastsDeleteCall(
            s: s,
            opt_: Dictionary<String, String>(),
            id: id
            )
        return c
    }
}

// // ...Call extension
extension LiveBroadcastsDeleteCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> LiveBroadcastsDeleteCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // onBehalfOfContentOwnerChannel sets the optional parameter
    // "onBehalfOfContentOwnerChannel": This parameter can only be used in a
    // properly authorized request. Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The
    // onBehalfOfContentOwnerChannel parameter specifies the YouTube channel
    // ID of the channel to which a video is being added. This parameter is
    // required when a request specifies a value for the
    // onBehalfOfContentOwner parameter, and it can only be used in
    // conjunction with that parameter. In addition, the request must be
    // authorized using a CMS account that is linked to the content owner
    // that the onBehalfOfContentOwner parameter specifies. Finally, the
    // channel that the onBehalfOfContentOwnerChannel parameter value
    // specifies must be linked to the content owner that the
    // onBehalfOfContentOwner parameter specifies.
    // 
    // This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and perform actions on behalf of the channel specified in the
    // parameter value, without having to provide authentication credentials
    // for each separate channel.
    func onBehalfOfContentOwnerChannel(onBehalfOfContentOwnerChannel: String) -> LiveBroadcastsDeleteCall {
        c.opt_["onBehalfOfContentOwnerChannel"] = onBehalfOfContentOwnerChannel
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> LiveBroadcastsDeleteCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "liveBroadcasts"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["id"] = "\(self.id)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwnerChannel"] { params["onBehalfOfContentOwnerChannel"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.DELETE, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(.decode(json), error)
        }
    }
        // {
	//   "description": "Deletes a broadcast.",
	//   "httpMethod": "DELETE",
	//   "id": "youtube.liveBroadcasts.delete",
	//   "parameterOrder": [
	//     "id"
	//   ],
	//   "parameters": {
	//     "id": {
	//       "description": "The id parameter specifies the YouTube live broadcast ID for the resource that is being deleted.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwnerChannel": {
	//       "description": "This parameter can only be used in a properly authorized request. Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID of the channel to which a video is being added. This parameter is required when a request specifies a value for the onBehalfOfContentOwner parameter, and it can only be used in conjunction with that parameter. In addition, the request must be authorized using a CMS account that is linked to the content owner that the onBehalfOfContentOwner parameter specifies. Finally, the channel that the onBehalfOfContentOwnerChannel parameter value specifies must be linked to the content owner that the onBehalfOfContentOwner parameter specifies.\n\nThis parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and perform actions on behalf of the channel specified in the parameter value, without having to provide authentication credentials for each separate channel.",
	//       "location": "query",
	//       "type": "string"
	//     }
	//   },
	//   "path": "liveBroadcasts",
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl"
	//   ]
	// }

}

// method id "youtube.liveBroadcasts.insert":
// meth generateCode
// // ...Call struct

struct LiveBroadcastsInsertCall {
    let s: Service
    var opt_: [String: String]
    var part: String
    var livebroadcast: LiveBroadcast
}

// insert: Creates a broadcast.
// // ...Service extension
extension LiveBroadcastsService {
    func insert(part: String, livebroadcast: LiveBroadcast) -> LiveBroadcastsInsertCall {
        var c = LiveBroadcastsInsertCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part,
            livebroadcast: livebroadcast
            )
        return c
    }
}

// // ...Call extension
extension LiveBroadcastsInsertCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> LiveBroadcastsInsertCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // onBehalfOfContentOwnerChannel sets the optional parameter
    // "onBehalfOfContentOwnerChannel": This parameter can only be used in a
    // properly authorized request. Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The
    // onBehalfOfContentOwnerChannel parameter specifies the YouTube channel
    // ID of the channel to which a video is being added. This parameter is
    // required when a request specifies a value for the
    // onBehalfOfContentOwner parameter, and it can only be used in
    // conjunction with that parameter. In addition, the request must be
    // authorized using a CMS account that is linked to the content owner
    // that the onBehalfOfContentOwner parameter specifies. Finally, the
    // channel that the onBehalfOfContentOwnerChannel parameter value
    // specifies must be linked to the content owner that the
    // onBehalfOfContentOwner parameter specifies.
    // 
    // This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and perform actions on behalf of the channel specified in the
    // parameter value, without having to provide authentication credentials
    // for each separate channel.
    func onBehalfOfContentOwnerChannel(onBehalfOfContentOwnerChannel: String) -> LiveBroadcastsInsertCall {
        c.opt_["onBehalfOfContentOwnerChannel"] = onBehalfOfContentOwnerChannel
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> LiveBroadcastsInsertCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (LiveBroadcast, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "liveBroadcasts"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        // TODO: convert body to JSON
        let body = ""
        let ctype = "application/json"
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwnerChannel"] { params["onBehalfOfContentOwnerChannel"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["Content-Type"] = ctype
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.POST, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(LiveBroadcast.decode(json), error)
        }
    }
        // {
	//   "description": "Creates a broadcast.",
	//   "httpMethod": "POST",
	//   "id": "youtube.liveBroadcasts.insert",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwnerChannel": {
	//       "description": "This parameter can only be used in a properly authorized request. Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID of the channel to which a video is being added. This parameter is required when a request specifies a value for the onBehalfOfContentOwner parameter, and it can only be used in conjunction with that parameter. In addition, the request must be authorized using a CMS account that is linked to the content owner that the onBehalfOfContentOwner parameter specifies. Finally, the channel that the onBehalfOfContentOwnerChannel parameter value specifies must be linked to the content owner that the onBehalfOfContentOwner parameter specifies.\n\nThis parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and perform actions on behalf of the channel specified in the parameter value, without having to provide authentication credentials for each separate channel.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.\n\nThe part properties that you can include in the parameter value are id, snippet, contentDetails, and status.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "liveBroadcasts",
	//   "request": {
	//     "$ref": "LiveBroadcast"
	//   },
	//   "response": {
	//     "$ref": "LiveBroadcast"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl"
	//   ]
	// }

}

// method id "youtube.liveBroadcasts.list":
// meth generateCode
// // ...Call struct

struct LiveBroadcastsListCall {
    let s: Service
    var opt_: [String: String]
    var part: String
}

// list: Returns a list of YouTube broadcasts that match the API request
// parameters.
// // ...Service extension
extension LiveBroadcastsService {
    func list(part: String) -> LiveBroadcastsListCall {
        var c = LiveBroadcastsListCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part
            )
        return c
    }
}

// // ...Call extension
extension LiveBroadcastsListCall {

    // broadcastStatus sets the optional parameter "broadcastStatus": The
    // broadcastStatus parameter filters the API response to only include
    // broadcasts with the specified status.
    func broadcastStatus(broadcastStatus: String) -> LiveBroadcastsListCall {
        c.opt_["broadcastStatus"] = broadcastStatus
        return c
    }

    // id sets the optional parameter "id": The id parameter specifies a
    // comma-separated list of YouTube broadcast IDs that identify the
    // broadcasts being retrieved. In a liveBroadcast resource, the id
    // property specifies the broadcast's ID.
    func id(id: String) -> LiveBroadcastsListCall {
        c.opt_["id"] = id
        return c
    }

    // maxResults sets the optional parameter "maxResults": The maxResults
    // parameter specifies the maximum number of items that should be
    // returned in the result set.
    func maxResults(maxResults: Int64) -> LiveBroadcastsListCall {
        c.opt_["maxResults"] = maxResults
        return c
    }

    // mine sets the optional parameter "mine": The mine parameter can be
    // used to instruct the API to only return broadcasts owned by the
    // authenticated user. Set the parameter value to true to only retrieve
    // your own broadcasts.
    func mine(mine: Bool) -> LiveBroadcastsListCall {
        c.opt_["mine"] = mine
        return c
    }

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> LiveBroadcastsListCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // onBehalfOfContentOwnerChannel sets the optional parameter
    // "onBehalfOfContentOwnerChannel": This parameter can only be used in a
    // properly authorized request. Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The
    // onBehalfOfContentOwnerChannel parameter specifies the YouTube channel
    // ID of the channel to which a video is being added. This parameter is
    // required when a request specifies a value for the
    // onBehalfOfContentOwner parameter, and it can only be used in
    // conjunction with that parameter. In addition, the request must be
    // authorized using a CMS account that is linked to the content owner
    // that the onBehalfOfContentOwner parameter specifies. Finally, the
    // channel that the onBehalfOfContentOwnerChannel parameter value
    // specifies must be linked to the content owner that the
    // onBehalfOfContentOwner parameter specifies.
    // 
    // This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and perform actions on behalf of the channel specified in the
    // parameter value, without having to provide authentication credentials
    // for each separate channel.
    func onBehalfOfContentOwnerChannel(onBehalfOfContentOwnerChannel: String) -> LiveBroadcastsListCall {
        c.opt_["onBehalfOfContentOwnerChannel"] = onBehalfOfContentOwnerChannel
        return c
    }

    // pageToken sets the optional parameter "pageToken": The pageToken
    // parameter identifies a specific page in the result set that should be
    // returned. In an API response, the nextPageToken and prevPageToken
    // properties identify other pages that could be retrieved.
    func pageToken(pageToken: String) -> LiveBroadcastsListCall {
        c.opt_["pageToken"] = pageToken
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> LiveBroadcastsListCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (LiveBroadcastListResponse, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "liveBroadcasts"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["broadcastStatus"] { params["broadcastStatus"] = "\(v)" }
        if v = self.opt_["id"] { params["id"] = "\(v)" }
        if v = self.opt_["maxResults"] { params["maxResults"] = "\(v)" }
        if v = self.opt_["mine"] { params["mine"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwnerChannel"] { params["onBehalfOfContentOwnerChannel"] = "\(v)" }
        if v = self.opt_["pageToken"] { params["pageToken"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.GET, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(LiveBroadcastListResponse.decode(json), error)
        }
    }
        // {
	//   "description": "Returns a list of YouTube broadcasts that match the API request parameters.",
	//   "httpMethod": "GET",
	//   "id": "youtube.liveBroadcasts.list",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "broadcastStatus": {
	//       "description": "The broadcastStatus parameter filters the API response to only include broadcasts with the specified status.",
	//       "enum": [
	//         "active",
	//         "all",
	//         "completed",
	//         "upcoming"
	//       ],
	//       "enumDescriptions": [
	//         "Return current live broadcasts.",
	//         "Return all broadcasts.",
	//         "Return broadcasts that have already ended.",
	//         "Return broadcasts that have not yet started."
	//       ],
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "id": {
	//       "description": "The id parameter specifies a comma-separated list of YouTube broadcast IDs that identify the broadcasts being retrieved. In a liveBroadcast resource, the id property specifies the broadcast's ID.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "maxResults": {
	//       "default": "5",
	//       "description": "The maxResults parameter specifies the maximum number of items that should be returned in the result set.",
	//       "format": "uint32",
	//       "location": "query",
	//       "maximum": "50",
	//       "minimum": "0",
	//       "type": "integer"
	//     },
	//     "mine": {
	//       "description": "The mine parameter can be used to instruct the API to only return broadcasts owned by the authenticated user. Set the parameter value to true to only retrieve your own broadcasts.",
	//       "location": "query",
	//       "type": "boolean"
	//     },
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwnerChannel": {
	//       "description": "This parameter can only be used in a properly authorized request. Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID of the channel to which a video is being added. This parameter is required when a request specifies a value for the onBehalfOfContentOwner parameter, and it can only be used in conjunction with that parameter. In addition, the request must be authorized using a CMS account that is linked to the content owner that the onBehalfOfContentOwner parameter specifies. Finally, the channel that the onBehalfOfContentOwnerChannel parameter value specifies must be linked to the content owner that the onBehalfOfContentOwner parameter specifies.\n\nThis parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and perform actions on behalf of the channel specified in the parameter value, without having to provide authentication credentials for each separate channel.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "pageToken": {
	//       "description": "The pageToken parameter identifies a specific page in the result set that should be returned. In an API response, the nextPageToken and prevPageToken properties identify other pages that could be retrieved.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter specifies a comma-separated list of one or more liveBroadcast resource properties that the API response will include. The part names that you can include in the parameter value are id, snippet, contentDetails, and status.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "liveBroadcasts",
	//   "response": {
	//     "$ref": "LiveBroadcastListResponse"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtube.readonly"
	//   ]
	// }

}

// method id "youtube.liveBroadcasts.transition":
// meth generateCode
// // ...Call struct

struct LiveBroadcastsTransitionCall {
    let s: Service
    var opt_: [String: String]
    var broadcastStatus: String
    var id: String
    var part: String
}

// transition: Changes the status of a YouTube live broadcast and
// initiates any processes associated with the new status. For example,
// when you transition a broadcast's status to testing, YouTube starts
// to transmit video to that broadcast's monitor stream. Before calling
// this method, you should confirm that the value of the
// status.streamStatus property for the stream bound to your broadcast
// is active.
// // ...Service extension
extension LiveBroadcastsService {
    func transition(broadcastStatus: String, id: String, part: String) -> LiveBroadcastsTransitionCall {
        var c = LiveBroadcastsTransitionCall(
            s: s,
            opt_: Dictionary<String, String>(),
            broadcastStatus: broadcastStatus,
            id: id,
            part: part
            )
        return c
    }
}

// // ...Call extension
extension LiveBroadcastsTransitionCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> LiveBroadcastsTransitionCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // onBehalfOfContentOwnerChannel sets the optional parameter
    // "onBehalfOfContentOwnerChannel": This parameter can only be used in a
    // properly authorized request. Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The
    // onBehalfOfContentOwnerChannel parameter specifies the YouTube channel
    // ID of the channel to which a video is being added. This parameter is
    // required when a request specifies a value for the
    // onBehalfOfContentOwner parameter, and it can only be used in
    // conjunction with that parameter. In addition, the request must be
    // authorized using a CMS account that is linked to the content owner
    // that the onBehalfOfContentOwner parameter specifies. Finally, the
    // channel that the onBehalfOfContentOwnerChannel parameter value
    // specifies must be linked to the content owner that the
    // onBehalfOfContentOwner parameter specifies.
    // 
    // This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and perform actions on behalf of the channel specified in the
    // parameter value, without having to provide authentication credentials
    // for each separate channel.
    func onBehalfOfContentOwnerChannel(onBehalfOfContentOwnerChannel: String) -> LiveBroadcastsTransitionCall {
        c.opt_["onBehalfOfContentOwnerChannel"] = onBehalfOfContentOwnerChannel
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> LiveBroadcastsTransitionCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (LiveBroadcast, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "liveBroadcasts/transition"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["broadcastStatus"] = "\(self.broadcastStatus)"
        params["id"] = "\(self.id)"
        params["part"] = "\(self.part)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwnerChannel"] { params["onBehalfOfContentOwnerChannel"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.POST, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(LiveBroadcast.decode(json), error)
        }
    }
        // {
	//   "description": "Changes the status of a YouTube live broadcast and initiates any processes associated with the new status. For example, when you transition a broadcast's status to testing, YouTube starts to transmit video to that broadcast's monitor stream. Before calling this method, you should confirm that the value of the status.streamStatus property for the stream bound to your broadcast is active.",
	//   "httpMethod": "POST",
	//   "id": "youtube.liveBroadcasts.transition",
	//   "parameterOrder": [
	//     "broadcastStatus",
	//     "id",
	//     "part"
	//   ],
	//   "parameters": {
	//     "broadcastStatus": {
	//       "description": "The broadcastStatus parameter identifies the state to which the broadcast is changing. Note that to transition a broadcast to either the testing or live state, the status.streamStatus must be active for the stream that the broadcast is bound to.",
	//       "enum": [
	//         "complete",
	//         "live",
	//         "testing"
	//       ],
	//       "enumDescriptions": [
	//         "The broadcast is over. YouTube stops transmitting video.",
	//         "The broadcast is visible to its audience. YouTube transmits video to the broadcast's monitor stream and its broadcast stream.",
	//         "Start testing the broadcast. YouTube transmits video to the broadcast's monitor stream. Note that you can only transition a broadcast to the testing state if its contentDetails.monitorStream.enableMonitorStream property is set to true."
	//       ],
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     },
	//     "id": {
	//       "description": "The id parameter specifies the unique ID of the broadcast that is transitioning to another status.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwnerChannel": {
	//       "description": "This parameter can only be used in a properly authorized request. Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID of the channel to which a video is being added. This parameter is required when a request specifies a value for the onBehalfOfContentOwner parameter, and it can only be used in conjunction with that parameter. In addition, the request must be authorized using a CMS account that is linked to the content owner that the onBehalfOfContentOwner parameter specifies. Finally, the channel that the onBehalfOfContentOwnerChannel parameter value specifies must be linked to the content owner that the onBehalfOfContentOwner parameter specifies.\n\nThis parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and perform actions on behalf of the channel specified in the parameter value, without having to provide authentication credentials for each separate channel.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter specifies a comma-separated list of one or more liveBroadcast resource properties that the API response will include. The part names that you can include in the parameter value are id, snippet, contentDetails, and status.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "liveBroadcasts/transition",
	//   "response": {
	//     "$ref": "LiveBroadcast"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl"
	//   ]
	// }

}

// method id "youtube.liveBroadcasts.update":
// meth generateCode
// // ...Call struct

struct LiveBroadcastsUpdateCall {
    let s: Service
    var opt_: [String: String]
    var part: String
    var livebroadcast: LiveBroadcast
}

// update: Updates a broadcast. For example, you could modify the
// broadcast settings defined in the liveBroadcast resource's
// contentDetails object.
// // ...Service extension
extension LiveBroadcastsService {
    func update(part: String, livebroadcast: LiveBroadcast) -> LiveBroadcastsUpdateCall {
        var c = LiveBroadcastsUpdateCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part,
            livebroadcast: livebroadcast
            )
        return c
    }
}

// // ...Call extension
extension LiveBroadcastsUpdateCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> LiveBroadcastsUpdateCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // onBehalfOfContentOwnerChannel sets the optional parameter
    // "onBehalfOfContentOwnerChannel": This parameter can only be used in a
    // properly authorized request. Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The
    // onBehalfOfContentOwnerChannel parameter specifies the YouTube channel
    // ID of the channel to which a video is being added. This parameter is
    // required when a request specifies a value for the
    // onBehalfOfContentOwner parameter, and it can only be used in
    // conjunction with that parameter. In addition, the request must be
    // authorized using a CMS account that is linked to the content owner
    // that the onBehalfOfContentOwner parameter specifies. Finally, the
    // channel that the onBehalfOfContentOwnerChannel parameter value
    // specifies must be linked to the content owner that the
    // onBehalfOfContentOwner parameter specifies.
    // 
    // This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and perform actions on behalf of the channel specified in the
    // parameter value, without having to provide authentication credentials
    // for each separate channel.
    func onBehalfOfContentOwnerChannel(onBehalfOfContentOwnerChannel: String) -> LiveBroadcastsUpdateCall {
        c.opt_["onBehalfOfContentOwnerChannel"] = onBehalfOfContentOwnerChannel
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> LiveBroadcastsUpdateCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (LiveBroadcast, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "liveBroadcasts"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        // TODO: convert body to JSON
        let body = ""
        let ctype = "application/json"
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwnerChannel"] { params["onBehalfOfContentOwnerChannel"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["Content-Type"] = ctype
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.PUT, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(LiveBroadcast.decode(json), error)
        }
    }
        // {
	//   "description": "Updates a broadcast. For example, you could modify the broadcast settings defined in the liveBroadcast resource's contentDetails object.",
	//   "httpMethod": "PUT",
	//   "id": "youtube.liveBroadcasts.update",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwnerChannel": {
	//       "description": "This parameter can only be used in a properly authorized request. Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID of the channel to which a video is being added. This parameter is required when a request specifies a value for the onBehalfOfContentOwner parameter, and it can only be used in conjunction with that parameter. In addition, the request must be authorized using a CMS account that is linked to the content owner that the onBehalfOfContentOwner parameter specifies. Finally, the channel that the onBehalfOfContentOwnerChannel parameter value specifies must be linked to the content owner that the onBehalfOfContentOwner parameter specifies.\n\nThis parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and perform actions on behalf of the channel specified in the parameter value, without having to provide authentication credentials for each separate channel.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.\n\nThe part properties that you can include in the parameter value are id, snippet, contentDetails, and status.\n\nNote that this method will override the existing values for all of the mutable properties that are contained in any parts that the parameter value specifies. For example, a broadcast's privacy status is defined in the status part. As such, if your request is updating a private or unlisted broadcast, and the request's part parameter value includes the status part, the broadcast's privacy setting will be updated to whatever value the request body specifies. If the request body does not specify a value, the existing privacy setting will be removed and the broadcast will revert to the default privacy setting.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "liveBroadcasts",
	//   "request": {
	//     "$ref": "LiveBroadcast"
	//   },
	//   "response": {
	//     "$ref": "LiveBroadcast"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl"
	//   ]
	// }

}

// method id "youtube.liveStreams.delete":
// meth generateCode
// // ...Call struct

struct LiveStreamsDeleteCall {
    let s: Service
    var opt_: [String: String]
    var id: String
}

// delete: Deletes a video stream.
// // ...Service extension
extension LiveStreamsService {
    func delete(id: String) -> LiveStreamsDeleteCall {
        var c = LiveStreamsDeleteCall(
            s: s,
            opt_: Dictionary<String, String>(),
            id: id
            )
        return c
    }
}

// // ...Call extension
extension LiveStreamsDeleteCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> LiveStreamsDeleteCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // onBehalfOfContentOwnerChannel sets the optional parameter
    // "onBehalfOfContentOwnerChannel": This parameter can only be used in a
    // properly authorized request. Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The
    // onBehalfOfContentOwnerChannel parameter specifies the YouTube channel
    // ID of the channel to which a video is being added. This parameter is
    // required when a request specifies a value for the
    // onBehalfOfContentOwner parameter, and it can only be used in
    // conjunction with that parameter. In addition, the request must be
    // authorized using a CMS account that is linked to the content owner
    // that the onBehalfOfContentOwner parameter specifies. Finally, the
    // channel that the onBehalfOfContentOwnerChannel parameter value
    // specifies must be linked to the content owner that the
    // onBehalfOfContentOwner parameter specifies.
    // 
    // This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and perform actions on behalf of the channel specified in the
    // parameter value, without having to provide authentication credentials
    // for each separate channel.
    func onBehalfOfContentOwnerChannel(onBehalfOfContentOwnerChannel: String) -> LiveStreamsDeleteCall {
        c.opt_["onBehalfOfContentOwnerChannel"] = onBehalfOfContentOwnerChannel
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> LiveStreamsDeleteCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "liveStreams"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["id"] = "\(self.id)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwnerChannel"] { params["onBehalfOfContentOwnerChannel"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.DELETE, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(.decode(json), error)
        }
    }
        // {
	//   "description": "Deletes a video stream.",
	//   "httpMethod": "DELETE",
	//   "id": "youtube.liveStreams.delete",
	//   "parameterOrder": [
	//     "id"
	//   ],
	//   "parameters": {
	//     "id": {
	//       "description": "The id parameter specifies the YouTube live stream ID for the resource that is being deleted.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwnerChannel": {
	//       "description": "This parameter can only be used in a properly authorized request. Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID of the channel to which a video is being added. This parameter is required when a request specifies a value for the onBehalfOfContentOwner parameter, and it can only be used in conjunction with that parameter. In addition, the request must be authorized using a CMS account that is linked to the content owner that the onBehalfOfContentOwner parameter specifies. Finally, the channel that the onBehalfOfContentOwnerChannel parameter value specifies must be linked to the content owner that the onBehalfOfContentOwner parameter specifies.\n\nThis parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and perform actions on behalf of the channel specified in the parameter value, without having to provide authentication credentials for each separate channel.",
	//       "location": "query",
	//       "type": "string"
	//     }
	//   },
	//   "path": "liveStreams",
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl"
	//   ]
	// }

}

// method id "youtube.liveStreams.insert":
// meth generateCode
// // ...Call struct

struct LiveStreamsInsertCall {
    let s: Service
    var opt_: [String: String]
    var part: String
    var livestream: LiveStream
}

// insert: Creates a video stream. The stream enables you to send your
// video to YouTube, which can then broadcast the video to your
// audience.
// // ...Service extension
extension LiveStreamsService {
    func insert(part: String, livestream: LiveStream) -> LiveStreamsInsertCall {
        var c = LiveStreamsInsertCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part,
            livestream: livestream
            )
        return c
    }
}

// // ...Call extension
extension LiveStreamsInsertCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> LiveStreamsInsertCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // onBehalfOfContentOwnerChannel sets the optional parameter
    // "onBehalfOfContentOwnerChannel": This parameter can only be used in a
    // properly authorized request. Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The
    // onBehalfOfContentOwnerChannel parameter specifies the YouTube channel
    // ID of the channel to which a video is being added. This parameter is
    // required when a request specifies a value for the
    // onBehalfOfContentOwner parameter, and it can only be used in
    // conjunction with that parameter. In addition, the request must be
    // authorized using a CMS account that is linked to the content owner
    // that the onBehalfOfContentOwner parameter specifies. Finally, the
    // channel that the onBehalfOfContentOwnerChannel parameter value
    // specifies must be linked to the content owner that the
    // onBehalfOfContentOwner parameter specifies.
    // 
    // This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and perform actions on behalf of the channel specified in the
    // parameter value, without having to provide authentication credentials
    // for each separate channel.
    func onBehalfOfContentOwnerChannel(onBehalfOfContentOwnerChannel: String) -> LiveStreamsInsertCall {
        c.opt_["onBehalfOfContentOwnerChannel"] = onBehalfOfContentOwnerChannel
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> LiveStreamsInsertCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (LiveStream, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "liveStreams"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        // TODO: convert body to JSON
        let body = ""
        let ctype = "application/json"
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwnerChannel"] { params["onBehalfOfContentOwnerChannel"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["Content-Type"] = ctype
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.POST, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(LiveStream.decode(json), error)
        }
    }
        // {
	//   "description": "Creates a video stream. The stream enables you to send your video to YouTube, which can then broadcast the video to your audience.",
	//   "httpMethod": "POST",
	//   "id": "youtube.liveStreams.insert",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwnerChannel": {
	//       "description": "This parameter can only be used in a properly authorized request. Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID of the channel to which a video is being added. This parameter is required when a request specifies a value for the onBehalfOfContentOwner parameter, and it can only be used in conjunction with that parameter. In addition, the request must be authorized using a CMS account that is linked to the content owner that the onBehalfOfContentOwner parameter specifies. Finally, the channel that the onBehalfOfContentOwnerChannel parameter value specifies must be linked to the content owner that the onBehalfOfContentOwner parameter specifies.\n\nThis parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and perform actions on behalf of the channel specified in the parameter value, without having to provide authentication credentials for each separate channel.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.\n\nThe part properties that you can include in the parameter value are id, snippet, cdn, and status.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "liveStreams",
	//   "request": {
	//     "$ref": "LiveStream"
	//   },
	//   "response": {
	//     "$ref": "LiveStream"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl"
	//   ]
	// }

}

// method id "youtube.liveStreams.list":
// meth generateCode
// // ...Call struct

struct LiveStreamsListCall {
    let s: Service
    var opt_: [String: String]
    var part: String
}

// list: Returns a list of video streams that match the API request
// parameters.
// // ...Service extension
extension LiveStreamsService {
    func list(part: String) -> LiveStreamsListCall {
        var c = LiveStreamsListCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part
            )
        return c
    }
}

// // ...Call extension
extension LiveStreamsListCall {

    // id sets the optional parameter "id": The id parameter specifies a
    // comma-separated list of YouTube stream IDs that identify the streams
    // being retrieved. In a liveStream resource, the id property specifies
    // the stream's ID.
    func id(id: String) -> LiveStreamsListCall {
        c.opt_["id"] = id
        return c
    }

    // maxResults sets the optional parameter "maxResults": The maxResults
    // parameter specifies the maximum number of items that should be
    // returned in the result set. Acceptable values are 0 to 50, inclusive.
    // The default value is 5.
    func maxResults(maxResults: Int64) -> LiveStreamsListCall {
        c.opt_["maxResults"] = maxResults
        return c
    }

    // mine sets the optional parameter "mine": The mine parameter can be
    // used to instruct the API to only return streams owned by the
    // authenticated user. Set the parameter value to true to only retrieve
    // your own streams.
    func mine(mine: Bool) -> LiveStreamsListCall {
        c.opt_["mine"] = mine
        return c
    }

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> LiveStreamsListCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // onBehalfOfContentOwnerChannel sets the optional parameter
    // "onBehalfOfContentOwnerChannel": This parameter can only be used in a
    // properly authorized request. Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The
    // onBehalfOfContentOwnerChannel parameter specifies the YouTube channel
    // ID of the channel to which a video is being added. This parameter is
    // required when a request specifies a value for the
    // onBehalfOfContentOwner parameter, and it can only be used in
    // conjunction with that parameter. In addition, the request must be
    // authorized using a CMS account that is linked to the content owner
    // that the onBehalfOfContentOwner parameter specifies. Finally, the
    // channel that the onBehalfOfContentOwnerChannel parameter value
    // specifies must be linked to the content owner that the
    // onBehalfOfContentOwner parameter specifies.
    // 
    // This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and perform actions on behalf of the channel specified in the
    // parameter value, without having to provide authentication credentials
    // for each separate channel.
    func onBehalfOfContentOwnerChannel(onBehalfOfContentOwnerChannel: String) -> LiveStreamsListCall {
        c.opt_["onBehalfOfContentOwnerChannel"] = onBehalfOfContentOwnerChannel
        return c
    }

    // pageToken sets the optional parameter "pageToken": The pageToken
    // parameter identifies a specific page in the result set that should be
    // returned. In an API response, the nextPageToken and prevPageToken
    // properties identify other pages that could be retrieved.
    func pageToken(pageToken: String) -> LiveStreamsListCall {
        c.opt_["pageToken"] = pageToken
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> LiveStreamsListCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (LiveStreamListResponse, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "liveStreams"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["id"] { params["id"] = "\(v)" }
        if v = self.opt_["maxResults"] { params["maxResults"] = "\(v)" }
        if v = self.opt_["mine"] { params["mine"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwnerChannel"] { params["onBehalfOfContentOwnerChannel"] = "\(v)" }
        if v = self.opt_["pageToken"] { params["pageToken"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.GET, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(LiveStreamListResponse.decode(json), error)
        }
    }
        // {
	//   "description": "Returns a list of video streams that match the API request parameters.",
	//   "httpMethod": "GET",
	//   "id": "youtube.liveStreams.list",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "id": {
	//       "description": "The id parameter specifies a comma-separated list of YouTube stream IDs that identify the streams being retrieved. In a liveStream resource, the id property specifies the stream's ID.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "maxResults": {
	//       "default": "5",
	//       "description": "The maxResults parameter specifies the maximum number of items that should be returned in the result set. Acceptable values are 0 to 50, inclusive. The default value is 5.",
	//       "format": "uint32",
	//       "location": "query",
	//       "maximum": "50",
	//       "minimum": "0",
	//       "type": "integer"
	//     },
	//     "mine": {
	//       "description": "The mine parameter can be used to instruct the API to only return streams owned by the authenticated user. Set the parameter value to true to only retrieve your own streams.",
	//       "location": "query",
	//       "type": "boolean"
	//     },
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwnerChannel": {
	//       "description": "This parameter can only be used in a properly authorized request. Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID of the channel to which a video is being added. This parameter is required when a request specifies a value for the onBehalfOfContentOwner parameter, and it can only be used in conjunction with that parameter. In addition, the request must be authorized using a CMS account that is linked to the content owner that the onBehalfOfContentOwner parameter specifies. Finally, the channel that the onBehalfOfContentOwnerChannel parameter value specifies must be linked to the content owner that the onBehalfOfContentOwner parameter specifies.\n\nThis parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and perform actions on behalf of the channel specified in the parameter value, without having to provide authentication credentials for each separate channel.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "pageToken": {
	//       "description": "The pageToken parameter identifies a specific page in the result set that should be returned. In an API response, the nextPageToken and prevPageToken properties identify other pages that could be retrieved.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter specifies a comma-separated list of one or more liveStream resource properties that the API response will include. The part names that you can include in the parameter value are id, snippet, cdn, and status.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "liveStreams",
	//   "response": {
	//     "$ref": "LiveStreamListResponse"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtube.readonly"
	//   ]
	// }

}

// method id "youtube.liveStreams.update":
// meth generateCode
// // ...Call struct

struct LiveStreamsUpdateCall {
    let s: Service
    var opt_: [String: String]
    var part: String
    var livestream: LiveStream
}

// update: Updates a video stream. If the properties that you want to
// change cannot be updated, then you need to create a new stream with
// the proper settings.
// // ...Service extension
extension LiveStreamsService {
    func update(part: String, livestream: LiveStream) -> LiveStreamsUpdateCall {
        var c = LiveStreamsUpdateCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part,
            livestream: livestream
            )
        return c
    }
}

// // ...Call extension
extension LiveStreamsUpdateCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> LiveStreamsUpdateCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // onBehalfOfContentOwnerChannel sets the optional parameter
    // "onBehalfOfContentOwnerChannel": This parameter can only be used in a
    // properly authorized request. Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The
    // onBehalfOfContentOwnerChannel parameter specifies the YouTube channel
    // ID of the channel to which a video is being added. This parameter is
    // required when a request specifies a value for the
    // onBehalfOfContentOwner parameter, and it can only be used in
    // conjunction with that parameter. In addition, the request must be
    // authorized using a CMS account that is linked to the content owner
    // that the onBehalfOfContentOwner parameter specifies. Finally, the
    // channel that the onBehalfOfContentOwnerChannel parameter value
    // specifies must be linked to the content owner that the
    // onBehalfOfContentOwner parameter specifies.
    // 
    // This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and perform actions on behalf of the channel specified in the
    // parameter value, without having to provide authentication credentials
    // for each separate channel.
    func onBehalfOfContentOwnerChannel(onBehalfOfContentOwnerChannel: String) -> LiveStreamsUpdateCall {
        c.opt_["onBehalfOfContentOwnerChannel"] = onBehalfOfContentOwnerChannel
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> LiveStreamsUpdateCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (LiveStream, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "liveStreams"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        // TODO: convert body to JSON
        let body = ""
        let ctype = "application/json"
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwnerChannel"] { params["onBehalfOfContentOwnerChannel"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["Content-Type"] = ctype
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.PUT, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(LiveStream.decode(json), error)
        }
    }
        // {
	//   "description": "Updates a video stream. If the properties that you want to change cannot be updated, then you need to create a new stream with the proper settings.",
	//   "httpMethod": "PUT",
	//   "id": "youtube.liveStreams.update",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwnerChannel": {
	//       "description": "This parameter can only be used in a properly authorized request. Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID of the channel to which a video is being added. This parameter is required when a request specifies a value for the onBehalfOfContentOwner parameter, and it can only be used in conjunction with that parameter. In addition, the request must be authorized using a CMS account that is linked to the content owner that the onBehalfOfContentOwner parameter specifies. Finally, the channel that the onBehalfOfContentOwnerChannel parameter value specifies must be linked to the content owner that the onBehalfOfContentOwner parameter specifies.\n\nThis parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and perform actions on behalf of the channel specified in the parameter value, without having to provide authentication credentials for each separate channel.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.\n\nThe part properties that you can include in the parameter value are id, snippet, cdn, and status.\n\nNote that this method will override the existing values for all of the mutable properties that are contained in any parts that the parameter value specifies. If the request body does not specify a value for a mutable property, the existing value for that property will be removed.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "liveStreams",
	//   "request": {
	//     "$ref": "LiveStream"
	//   },
	//   "response": {
	//     "$ref": "LiveStream"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl"
	//   ]
	// }

}

// method id "youtube.playlistItems.delete":
// meth generateCode
// // ...Call struct

struct PlaylistItemsDeleteCall {
    let s: Service
    var opt_: [String: String]
    var id: String
}

// delete: Deletes a playlist item.
// // ...Service extension
extension PlaylistItemsService {
    func delete(id: String) -> PlaylistItemsDeleteCall {
        var c = PlaylistItemsDeleteCall(
            s: s,
            opt_: Dictionary<String, String>(),
            id: id
            )
        return c
    }
}

// // ...Call extension
extension PlaylistItemsDeleteCall {

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> PlaylistItemsDeleteCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "playlistItems"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["id"] = "\(self.id)"
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.DELETE, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(.decode(json), error)
        }
    }
        // {
	//   "description": "Deletes a playlist item.",
	//   "httpMethod": "DELETE",
	//   "id": "youtube.playlistItems.delete",
	//   "parameterOrder": [
	//     "id"
	//   ],
	//   "parameters": {
	//     "id": {
	//       "description": "The id parameter specifies the YouTube playlist item ID for the playlist item that is being deleted. In a playlistItem resource, the id property specifies the playlist item's ID.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "playlistItems",
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.playlistItems.insert":
// meth generateCode
// // ...Call struct

struct PlaylistItemsInsertCall {
    let s: Service
    var opt_: [String: String]
    var part: String
    var playlistitem: PlaylistItem
}

// insert: Adds a resource to a playlist.
// // ...Service extension
extension PlaylistItemsService {
    func insert(part: String, playlistitem: PlaylistItem) -> PlaylistItemsInsertCall {
        var c = PlaylistItemsInsertCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part,
            playlistitem: playlistitem
            )
        return c
    }
}

// // ...Call extension
extension PlaylistItemsInsertCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> PlaylistItemsInsertCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> PlaylistItemsInsertCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (PlaylistItem, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "playlistItems"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        // TODO: convert body to JSON
        let body = ""
        let ctype = "application/json"
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["Content-Type"] = ctype
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.POST, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(PlaylistItem.decode(json), error)
        }
    }
        // {
	//   "description": "Adds a resource to a playlist.",
	//   "httpMethod": "POST",
	//   "id": "youtube.playlistItems.insert",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.\n\nThe part names that you can include in the parameter value are snippet, contentDetails, and status.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "playlistItems",
	//   "request": {
	//     "$ref": "PlaylistItem"
	//   },
	//   "response": {
	//     "$ref": "PlaylistItem"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.playlistItems.list":
// meth generateCode
// // ...Call struct

struct PlaylistItemsListCall {
    let s: Service
    var opt_: [String: String]
    var part: String
}

// list: Returns a collection of playlist items that match the API
// request parameters. You can retrieve all of the playlist items in a
// specified playlist or retrieve one or more playlist items by their
// unique IDs.
// // ...Service extension
extension PlaylistItemsService {
    func list(part: String) -> PlaylistItemsListCall {
        var c = PlaylistItemsListCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part
            )
        return c
    }
}

// // ...Call extension
extension PlaylistItemsListCall {

    // id sets the optional parameter "id": The id parameter specifies a
    // comma-separated list of one or more unique playlist item IDs.
    func id(id: String) -> PlaylistItemsListCall {
        c.opt_["id"] = id
        return c
    }

    // maxResults sets the optional parameter "maxResults": The maxResults
    // parameter specifies the maximum number of items that should be
    // returned in the result set.
    func maxResults(maxResults: Int64) -> PlaylistItemsListCall {
        c.opt_["maxResults"] = maxResults
        return c
    }

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> PlaylistItemsListCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // pageToken sets the optional parameter "pageToken": The pageToken
    // parameter identifies a specific page in the result set that should be
    // returned. In an API response, the nextPageToken and prevPageToken
    // properties identify other pages that could be retrieved.
    func pageToken(pageToken: String) -> PlaylistItemsListCall {
        c.opt_["pageToken"] = pageToken
        return c
    }

    // playlistId sets the optional parameter "playlistId": The playlistId
    // parameter specifies the unique ID of the playlist for which you want
    // to retrieve playlist items. Note that even though this is an optional
    // parameter, every request to retrieve playlist items must specify a
    // value for either the id parameter or the playlistId parameter.
    func playlistId(playlistId: String) -> PlaylistItemsListCall {
        c.opt_["playlistId"] = playlistId
        return c
    }

    // videoId sets the optional parameter "videoId": The videoId parameter
    // specifies that the request should return only the playlist items that
    // contain the specified video.
    func videoId(videoId: String) -> PlaylistItemsListCall {
        c.opt_["videoId"] = videoId
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> PlaylistItemsListCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (PlaylistItemListResponse, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "playlistItems"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["id"] { params["id"] = "\(v)" }
        if v = self.opt_["maxResults"] { params["maxResults"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["pageToken"] { params["pageToken"] = "\(v)" }
        if v = self.opt_["playlistId"] { params["playlistId"] = "\(v)" }
        if v = self.opt_["videoId"] { params["videoId"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.GET, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(PlaylistItemListResponse.decode(json), error)
        }
    }
        // {
	//   "description": "Returns a collection of playlist items that match the API request parameters. You can retrieve all of the playlist items in a specified playlist or retrieve one or more playlist items by their unique IDs.",
	//   "httpMethod": "GET",
	//   "id": "youtube.playlistItems.list",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "id": {
	//       "description": "The id parameter specifies a comma-separated list of one or more unique playlist item IDs.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "maxResults": {
	//       "default": "5",
	//       "description": "The maxResults parameter specifies the maximum number of items that should be returned in the result set.",
	//       "format": "uint32",
	//       "location": "query",
	//       "maximum": "50",
	//       "minimum": "0",
	//       "type": "integer"
	//     },
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "pageToken": {
	//       "description": "The pageToken parameter identifies a specific page in the result set that should be returned. In an API response, the nextPageToken and prevPageToken properties identify other pages that could be retrieved.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter specifies a comma-separated list of one or more playlistItem resource properties that the API response will include. The part names that you can include in the parameter value are id, snippet, contentDetails, and status.\n\nIf the parameter identifies a property that contains child properties, the child properties will be included in the response. For example, in a playlistItem resource, the snippet property contains numerous fields, including the title, description, position, and resourceId properties. As such, if you set part=snippet, the API response will contain all of those properties.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     },
	//     "playlistId": {
	//       "description": "The playlistId parameter specifies the unique ID of the playlist for which you want to retrieve playlist items. Note that even though this is an optional parameter, every request to retrieve playlist items must specify a value for either the id parameter or the playlistId parameter.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "videoId": {
	//       "description": "The videoId parameter specifies that the request should return only the playlist items that contain the specified video.",
	//       "location": "query",
	//       "type": "string"
	//     }
	//   },
	//   "path": "playlistItems",
	//   "response": {
	//     "$ref": "PlaylistItemListResponse"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtube.readonly",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ],
	//   "supportsSubscription": true
	// }

}

// method id "youtube.playlistItems.update":
// meth generateCode
// // ...Call struct

struct PlaylistItemsUpdateCall {
    let s: Service
    var opt_: [String: String]
    var part: String
    var playlistitem: PlaylistItem
}

// update: Modifies a playlist item. For example, you could update the
// item's position in the playlist.
// // ...Service extension
extension PlaylistItemsService {
    func update(part: String, playlistitem: PlaylistItem) -> PlaylistItemsUpdateCall {
        var c = PlaylistItemsUpdateCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part,
            playlistitem: playlistitem
            )
        return c
    }
}

// // ...Call extension
extension PlaylistItemsUpdateCall {

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> PlaylistItemsUpdateCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (PlaylistItem, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "playlistItems"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        // TODO: convert body to JSON
        let body = ""
        let ctype = "application/json"
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["Content-Type"] = ctype
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.PUT, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(PlaylistItem.decode(json), error)
        }
    }
        // {
	//   "description": "Modifies a playlist item. For example, you could update the item's position in the playlist.",
	//   "httpMethod": "PUT",
	//   "id": "youtube.playlistItems.update",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "part": {
	//       "description": "The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.\n\nThe part names that you can include in the parameter value are snippet, contentDetails, and status.\n\nNote that this method will override the existing values for all of the mutable properties that are contained in any parts that the parameter value specifies. For example, a playlist item can specify a start time and end time, which identify the times portion of the video that should play when users watch the video in the playlist. If your request is updating a playlist item that sets these values, and the request's part parameter value includes the contentDetails part, the playlist item's start and end times will be updated to whatever value the request body specifies. If the request body does not specify values, the existing start and end times will be removed and replaced with the default settings.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "playlistItems",
	//   "request": {
	//     "$ref": "PlaylistItem"
	//   },
	//   "response": {
	//     "$ref": "PlaylistItem"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.playlists.delete":
// meth generateCode
// // ...Call struct

struct PlaylistsDeleteCall {
    let s: Service
    var opt_: [String: String]
    var id: String
}

// delete: Deletes a playlist.
// // ...Service extension
extension PlaylistsService {
    func delete(id: String) -> PlaylistsDeleteCall {
        var c = PlaylistsDeleteCall(
            s: s,
            opt_: Dictionary<String, String>(),
            id: id
            )
        return c
    }
}

// // ...Call extension
extension PlaylistsDeleteCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> PlaylistsDeleteCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> PlaylistsDeleteCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "playlists"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["id"] = "\(self.id)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.DELETE, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(.decode(json), error)
        }
    }
        // {
	//   "description": "Deletes a playlist.",
	//   "httpMethod": "DELETE",
	//   "id": "youtube.playlists.delete",
	//   "parameterOrder": [
	//     "id"
	//   ],
	//   "parameters": {
	//     "id": {
	//       "description": "The id parameter specifies the YouTube playlist ID for the playlist that is being deleted. In a playlist resource, the id property specifies the playlist's ID.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     }
	//   },
	//   "path": "playlists",
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.playlists.insert":
// meth generateCode
// // ...Call struct

struct PlaylistsInsertCall {
    let s: Service
    var opt_: [String: String]
    var part: String
    var playlist: Playlist
}

// insert: Creates a playlist.
// // ...Service extension
extension PlaylistsService {
    func insert(part: String, playlist: Playlist) -> PlaylistsInsertCall {
        var c = PlaylistsInsertCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part,
            playlist: playlist
            )
        return c
    }
}

// // ...Call extension
extension PlaylistsInsertCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> PlaylistsInsertCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // onBehalfOfContentOwnerChannel sets the optional parameter
    // "onBehalfOfContentOwnerChannel": This parameter can only be used in a
    // properly authorized request. Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The
    // onBehalfOfContentOwnerChannel parameter specifies the YouTube channel
    // ID of the channel to which a video is being added. This parameter is
    // required when a request specifies a value for the
    // onBehalfOfContentOwner parameter, and it can only be used in
    // conjunction with that parameter. In addition, the request must be
    // authorized using a CMS account that is linked to the content owner
    // that the onBehalfOfContentOwner parameter specifies. Finally, the
    // channel that the onBehalfOfContentOwnerChannel parameter value
    // specifies must be linked to the content owner that the
    // onBehalfOfContentOwner parameter specifies.
    // 
    // This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and perform actions on behalf of the channel specified in the
    // parameter value, without having to provide authentication credentials
    // for each separate channel.
    func onBehalfOfContentOwnerChannel(onBehalfOfContentOwnerChannel: String) -> PlaylistsInsertCall {
        c.opt_["onBehalfOfContentOwnerChannel"] = onBehalfOfContentOwnerChannel
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> PlaylistsInsertCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (Playlist, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "playlists"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        // TODO: convert body to JSON
        let body = ""
        let ctype = "application/json"
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwnerChannel"] { params["onBehalfOfContentOwnerChannel"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["Content-Type"] = ctype
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.POST, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(Playlist.decode(json), error)
        }
    }
        // {
	//   "description": "Creates a playlist.",
	//   "httpMethod": "POST",
	//   "id": "youtube.playlists.insert",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwnerChannel": {
	//       "description": "This parameter can only be used in a properly authorized request. Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID of the channel to which a video is being added. This parameter is required when a request specifies a value for the onBehalfOfContentOwner parameter, and it can only be used in conjunction with that parameter. In addition, the request must be authorized using a CMS account that is linked to the content owner that the onBehalfOfContentOwner parameter specifies. Finally, the channel that the onBehalfOfContentOwnerChannel parameter value specifies must be linked to the content owner that the onBehalfOfContentOwner parameter specifies.\n\nThis parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and perform actions on behalf of the channel specified in the parameter value, without having to provide authentication credentials for each separate channel.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.\n\nThe part names that you can include in the parameter value are snippet and status.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "playlists",
	//   "request": {
	//     "$ref": "Playlist"
	//   },
	//   "response": {
	//     "$ref": "Playlist"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.playlists.list":
// meth generateCode
// // ...Call struct

struct PlaylistsListCall {
    let s: Service
    var opt_: [String: String]
    var part: String
}

// list: Returns a collection of playlists that match the API request
// parameters. For example, you can retrieve all playlists that the
// authenticated user owns, or you can retrieve one or more playlists by
// their unique IDs.
// // ...Service extension
extension PlaylistsService {
    func list(part: String) -> PlaylistsListCall {
        var c = PlaylistsListCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part
            )
        return c
    }
}

// // ...Call extension
extension PlaylistsListCall {

    // channelId sets the optional parameter "channelId": This value
    // indicates that the API should only return the specified channel's
    // playlists.
    func channelId(channelId: String) -> PlaylistsListCall {
        c.opt_["channelId"] = channelId
        return c
    }

    // id sets the optional parameter "id": The id parameter specifies a
    // comma-separated list of the YouTube playlist ID(s) for the
    // resource(s) that are being retrieved. In a playlist resource, the id
    // property specifies the playlist's YouTube playlist ID.
    func id(id: String) -> PlaylistsListCall {
        c.opt_["id"] = id
        return c
    }

    // maxResults sets the optional parameter "maxResults": The maxResults
    // parameter specifies the maximum number of items that should be
    // returned in the result set.
    func maxResults(maxResults: Int64) -> PlaylistsListCall {
        c.opt_["maxResults"] = maxResults
        return c
    }

    // mine sets the optional parameter "mine": Set this parameter's value
    // to true to instruct the API to only return playlists owned by the
    // authenticated user.
    func mine(mine: Bool) -> PlaylistsListCall {
        c.opt_["mine"] = mine
        return c
    }

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> PlaylistsListCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // onBehalfOfContentOwnerChannel sets the optional parameter
    // "onBehalfOfContentOwnerChannel": This parameter can only be used in a
    // properly authorized request. Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The
    // onBehalfOfContentOwnerChannel parameter specifies the YouTube channel
    // ID of the channel to which a video is being added. This parameter is
    // required when a request specifies a value for the
    // onBehalfOfContentOwner parameter, and it can only be used in
    // conjunction with that parameter. In addition, the request must be
    // authorized using a CMS account that is linked to the content owner
    // that the onBehalfOfContentOwner parameter specifies. Finally, the
    // channel that the onBehalfOfContentOwnerChannel parameter value
    // specifies must be linked to the content owner that the
    // onBehalfOfContentOwner parameter specifies.
    // 
    // This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and perform actions on behalf of the channel specified in the
    // parameter value, without having to provide authentication credentials
    // for each separate channel.
    func onBehalfOfContentOwnerChannel(onBehalfOfContentOwnerChannel: String) -> PlaylistsListCall {
        c.opt_["onBehalfOfContentOwnerChannel"] = onBehalfOfContentOwnerChannel
        return c
    }

    // pageToken sets the optional parameter "pageToken": The pageToken
    // parameter identifies a specific page in the result set that should be
    // returned. In an API response, the nextPageToken and prevPageToken
    // properties identify other pages that could be retrieved.
    func pageToken(pageToken: String) -> PlaylistsListCall {
        c.opt_["pageToken"] = pageToken
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> PlaylistsListCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (PlaylistListResponse, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "playlists"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["channelId"] { params["channelId"] = "\(v)" }
        if v = self.opt_["id"] { params["id"] = "\(v)" }
        if v = self.opt_["maxResults"] { params["maxResults"] = "\(v)" }
        if v = self.opt_["mine"] { params["mine"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwnerChannel"] { params["onBehalfOfContentOwnerChannel"] = "\(v)" }
        if v = self.opt_["pageToken"] { params["pageToken"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.GET, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(PlaylistListResponse.decode(json), error)
        }
    }
        // {
	//   "description": "Returns a collection of playlists that match the API request parameters. For example, you can retrieve all playlists that the authenticated user owns, or you can retrieve one or more playlists by their unique IDs.",
	//   "httpMethod": "GET",
	//   "id": "youtube.playlists.list",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "channelId": {
	//       "description": "This value indicates that the API should only return the specified channel's playlists.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "id": {
	//       "description": "The id parameter specifies a comma-separated list of the YouTube playlist ID(s) for the resource(s) that are being retrieved. In a playlist resource, the id property specifies the playlist's YouTube playlist ID.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "maxResults": {
	//       "default": "5",
	//       "description": "The maxResults parameter specifies the maximum number of items that should be returned in the result set.",
	//       "format": "uint32",
	//       "location": "query",
	//       "maximum": "50",
	//       "minimum": "0",
	//       "type": "integer"
	//     },
	//     "mine": {
	//       "description": "Set this parameter's value to true to instruct the API to only return playlists owned by the authenticated user.",
	//       "location": "query",
	//       "type": "boolean"
	//     },
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwnerChannel": {
	//       "description": "This parameter can only be used in a properly authorized request. Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID of the channel to which a video is being added. This parameter is required when a request specifies a value for the onBehalfOfContentOwner parameter, and it can only be used in conjunction with that parameter. In addition, the request must be authorized using a CMS account that is linked to the content owner that the onBehalfOfContentOwner parameter specifies. Finally, the channel that the onBehalfOfContentOwnerChannel parameter value specifies must be linked to the content owner that the onBehalfOfContentOwner parameter specifies.\n\nThis parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and perform actions on behalf of the channel specified in the parameter value, without having to provide authentication credentials for each separate channel.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "pageToken": {
	//       "description": "The pageToken parameter identifies a specific page in the result set that should be returned. In an API response, the nextPageToken and prevPageToken properties identify other pages that could be retrieved.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter specifies a comma-separated list of one or more playlist resource properties that the API response will include. The part names that you can include in the parameter value are id, snippet, status, and contentDetails.\n\nIf the parameter identifies a property that contains child properties, the child properties will be included in the response. For example, in a playlist resource, the snippet property contains properties like author, title, description, tags, and timeCreated. As such, if you set part=snippet, the API response will contain all of those properties.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "playlists",
	//   "response": {
	//     "$ref": "PlaylistListResponse"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtube.readonly",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.playlists.update":
// meth generateCode
// // ...Call struct

struct PlaylistsUpdateCall {
    let s: Service
    var opt_: [String: String]
    var part: String
    var playlist: Playlist
}

// update: Modifies a playlist. For example, you could change a
// playlist's title, description, or privacy status.
// // ...Service extension
extension PlaylistsService {
    func update(part: String, playlist: Playlist) -> PlaylistsUpdateCall {
        var c = PlaylistsUpdateCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part,
            playlist: playlist
            )
        return c
    }
}

// // ...Call extension
extension PlaylistsUpdateCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> PlaylistsUpdateCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> PlaylistsUpdateCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (Playlist, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "playlists"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        // TODO: convert body to JSON
        let body = ""
        let ctype = "application/json"
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["Content-Type"] = ctype
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.PUT, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(Playlist.decode(json), error)
        }
    }
        // {
	//   "description": "Modifies a playlist. For example, you could change a playlist's title, description, or privacy status.",
	//   "httpMethod": "PUT",
	//   "id": "youtube.playlists.update",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.\n\nThe part names that you can include in the parameter value are snippet and status.\n\nNote that this method will override the existing values for all of the mutable properties that are contained in any parts that the parameter value specifies. For example, a playlist's privacy setting is contained in the status part. As such, if your request is updating a private playlist, and the request's part parameter value includes the status part, the playlist's privacy setting will be updated to whatever value the request body specifies. If the request body does not specify a value, the existing privacy setting will be removed and the playlist will revert to the default privacy setting.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "playlists",
	//   "request": {
	//     "$ref": "Playlist"
	//   },
	//   "response": {
	//     "$ref": "Playlist"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.search.list":
// meth generateCode
// // ...Call struct

struct SearchListCall {
    let s: Service
    var opt_: [String: String]
    var part: String
}

// list: Returns a collection of search results that match the query
// parameters specified in the API request. By default, a search result
// set identifies matching video, channel, and playlist resources, but
// you can also configure queries to only retrieve a specific type of
// resource.
// // ...Service extension
extension SearchService {
    func list(part: String) -> SearchListCall {
        var c = SearchListCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part
            )
        return c
    }
}

// // ...Call extension
extension SearchListCall {

    // channelId sets the optional parameter "channelId": The channelId
    // parameter indicates that the API response should only contain
    // resources created by the channel
    func channelId(channelId: String) -> SearchListCall {
        c.opt_["channelId"] = channelId
        return c
    }

    // channelType sets the optional parameter "channelType": The
    // channelType parameter lets you restrict a search to a particular type
    // of channel.
    func channelType(channelType: String) -> SearchListCall {
        c.opt_["channelType"] = channelType
        return c
    }

    // eventType sets the optional parameter "eventType": The eventType
    // parameter restricts a search to broadcast events.
    func eventType(eventType: String) -> SearchListCall {
        c.opt_["eventType"] = eventType
        return c
    }

    // forContentOwner sets the optional parameter "forContentOwner": Note:
    // This parameter is intended exclusively for YouTube content
    // partners.
    // 
    // The forContentOwner parameter restricts the search to only
    // retrieve resources owned by the content owner specified by the
    // onBehalfOfContentOwner parameter. The user must be authenticated
    // using a CMS account linked to the specified content owner and
    // onBehalfOfContentOwner must be provided.
    func forContentOwner(forContentOwner: Bool) -> SearchListCall {
        c.opt_["forContentOwner"] = forContentOwner
        return c
    }

    // forMine sets the optional parameter "forMine": The forMine parameter
    // restricts the search to only retrieve videos owned by the
    // authenticated user. If you set this parameter to true, then the type
    // parameter's value must also be set to video.
    func forMine(forMine: Bool) -> SearchListCall {
        c.opt_["forMine"] = forMine
        return c
    }

    // location sets the optional parameter "location": The location
    // parameter restricts a search to videos that have a geographical
    // location specified in their metadata. The value is a string that
    // specifies geographic latitude/longitude coordinates e.g.
    // (37.42307,-122.08427)
    func location(location: String) -> SearchListCall {
        c.opt_["location"] = location
        return c
    }

    // locationRadius sets the optional parameter "locationRadius": The
    // locationRadius, in conjunction with the location parameter, defines a
    // geographic area. If the geographic coordinates associated with a
    // video fall within that area, then the video may be included in search
    // results. This parameter value must be a floating point number
    // followed by a measurement unit. Valid measurement units are m, km,
    // ft, and mi. For example, valid parameter values include 1500m, 5km,
    // 10000ft, and 0.75mi. The API does not support locationRadius
    // parameter values larger than 1000 kilometers.
    func locationRadius(locationRadius: String) -> SearchListCall {
        c.opt_["locationRadius"] = locationRadius
        return c
    }

    // maxResults sets the optional parameter "maxResults": The maxResults
    // parameter specifies the maximum number of items that should be
    // returned in the result set.
    func maxResults(maxResults: Int64) -> SearchListCall {
        c.opt_["maxResults"] = maxResults
        return c
    }

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> SearchListCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // order sets the optional parameter "order": The order parameter
    // specifies the method that will be used to order resources in the API
    // response.
    func order(order: String) -> SearchListCall {
        c.opt_["order"] = order
        return c
    }

    // pageToken sets the optional parameter "pageToken": The pageToken
    // parameter identifies a specific page in the result set that should be
    // returned. In an API response, the nextPageToken and prevPageToken
    // properties identify other pages that could be retrieved.
    func pageToken(pageToken: String) -> SearchListCall {
        c.opt_["pageToken"] = pageToken
        return c
    }

    // publishedAfter sets the optional parameter "publishedAfter": The
    // publishedAfter parameter indicates that the API response should only
    // contain resources created after the specified time. The value is an
    // RFC 3339 formatted date-time value (1970-01-01T00:00:00Z).
    func publishedAfter(publishedAfter: String) -> SearchListCall {
        c.opt_["publishedAfter"] = publishedAfter
        return c
    }

    // publishedBefore sets the optional parameter "publishedBefore": The
    // publishedBefore parameter indicates that the API response should only
    // contain resources created before the specified time. The value is an
    // RFC 3339 formatted date-time value (1970-01-01T00:00:00Z).
    func publishedBefore(publishedBefore: String) -> SearchListCall {
        c.opt_["publishedBefore"] = publishedBefore
        return c
    }

    // q sets the optional parameter "q": The q parameter specifies the
    // query term to search for.
    func q(q: String) -> SearchListCall {
        c.opt_["q"] = q
        return c
    }

    // regionCode sets the optional parameter "regionCode": The regionCode
    // parameter instructs the API to return search results for the
    // specified country. The parameter value is an ISO 3166-1 alpha-2
    // country code.
    func regionCode(regionCode: String) -> SearchListCall {
        c.opt_["regionCode"] = regionCode
        return c
    }

    // relatedToVideoId sets the optional parameter "relatedToVideoId": The
    // relatedToVideoId parameter retrieves a list of videos that are
    // related to the video that the parameter value identifies. The
    // parameter value must be set to a YouTube video ID and, if you are
    // using this parameter, the type parameter must be set to video.
    func relatedToVideoId(relatedToVideoId: String) -> SearchListCall {
        c.opt_["relatedToVideoId"] = relatedToVideoId
        return c
    }

    // relevanceLanguage sets the optional parameter "relevanceLanguage":
    // The relevanceLanguage parameter instructs the API to return search
    // results that are most relevant to the specified language. The
    // parameter value is typically an ISO 639-1 two-letter language code.
    // However, you should use the values zh-Hans for simplified Chinese and
    // zh-Hant for traditional Chinese. Please note that results in other
    // languages will still be returned if they are highly relevant to the
    // search query term.
    func relevanceLanguage(relevanceLanguage: String) -> SearchListCall {
        c.opt_["relevanceLanguage"] = relevanceLanguage
        return c
    }

    // safeSearch sets the optional parameter "safeSearch": The safeSearch
    // parameter indicates whether the search results should include
    // restricted content as well as standard content.
    func safeSearch(safeSearch: String) -> SearchListCall {
        c.opt_["safeSearch"] = safeSearch
        return c
    }

    // topicId sets the optional parameter "topicId": The topicId parameter
    // indicates that the API response should only contain resources
    // associated with the specified topic. The value identifies a Freebase
    // topic ID.
    func topicId(topicId: String) -> SearchListCall {
        c.opt_["topicId"] = topicId
        return c
    }

    // type sets the optional parameter "type": The type parameter restricts
    // a search query to only retrieve a particular type of resource. The
    // value is a comma-separated list of resource types.
    func type(type_: String) -> SearchListCall {
        c.opt_["type"] = type_
        return c
    }

    // videoCaption sets the optional parameter "videoCaption": The
    // videoCaption parameter indicates whether the API should filter video
    // search results based on whether they have captions.
    func videoCaption(videoCaption: String) -> SearchListCall {
        c.opt_["videoCaption"] = videoCaption
        return c
    }

    // videoCategoryId sets the optional parameter "videoCategoryId": The
    // videoCategoryId parameter filters video search results based on their
    // category.
    func videoCategoryId(videoCategoryId: String) -> SearchListCall {
        c.opt_["videoCategoryId"] = videoCategoryId
        return c
    }

    // videoDefinition sets the optional parameter "videoDefinition": The
    // videoDefinition parameter lets you restrict a search to only include
    // either high definition (HD) or standard definition (SD) videos. HD
    // videos are available for playback in at least 720p, though higher
    // resolutions, like 1080p, might also be available.
    func videoDefinition(videoDefinition: String) -> SearchListCall {
        c.opt_["videoDefinition"] = videoDefinition
        return c
    }

    // videoDimension sets the optional parameter "videoDimension": The
    // videoDimension parameter lets you restrict a search to only retrieve
    // 2D or 3D videos.
    func videoDimension(videoDimension: String) -> SearchListCall {
        c.opt_["videoDimension"] = videoDimension
        return c
    }

    // videoDuration sets the optional parameter "videoDuration": The
    // videoDuration parameter filters video search results based on their
    // duration.
    func videoDuration(videoDuration: String) -> SearchListCall {
        c.opt_["videoDuration"] = videoDuration
        return c
    }

    // videoEmbeddable sets the optional parameter "videoEmbeddable": The
    // videoEmbeddable parameter lets you to restrict a search to only
    // videos that can be embedded into a webpage.
    func videoEmbeddable(videoEmbeddable: String) -> SearchListCall {
        c.opt_["videoEmbeddable"] = videoEmbeddable
        return c
    }

    // videoLicense sets the optional parameter "videoLicense": The
    // videoLicense parameter filters search results to only include videos
    // with a particular license. YouTube lets video uploaders choose to
    // attach either the Creative Commons license or the standard YouTube
    // license to each of their videos.
    func videoLicense(videoLicense: String) -> SearchListCall {
        c.opt_["videoLicense"] = videoLicense
        return c
    }

    // videoSyndicated sets the optional parameter "videoSyndicated": The
    // videoSyndicated parameter lets you to restrict a search to only
    // videos that can be played outside youtube.com.
    func videoSyndicated(videoSyndicated: String) -> SearchListCall {
        c.opt_["videoSyndicated"] = videoSyndicated
        return c
    }

    // videoType sets the optional parameter "videoType": The videoType
    // parameter lets you restrict a search to a particular type of videos.
    func videoType(videoType: String) -> SearchListCall {
        c.opt_["videoType"] = videoType
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> SearchListCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (SearchListResponse, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "search"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["channelId"] { params["channelId"] = "\(v)" }
        if v = self.opt_["channelType"] { params["channelType"] = "\(v)" }
        if v = self.opt_["eventType"] { params["eventType"] = "\(v)" }
        if v = self.opt_["forContentOwner"] { params["forContentOwner"] = "\(v)" }
        if v = self.opt_["forMine"] { params["forMine"] = "\(v)" }
        if v = self.opt_["location"] { params["location"] = "\(v)" }
        if v = self.opt_["locationRadius"] { params["locationRadius"] = "\(v)" }
        if v = self.opt_["maxResults"] { params["maxResults"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["order"] { params["order"] = "\(v)" }
        if v = self.opt_["pageToken"] { params["pageToken"] = "\(v)" }
        if v = self.opt_["publishedAfter"] { params["publishedAfter"] = "\(v)" }
        if v = self.opt_["publishedBefore"] { params["publishedBefore"] = "\(v)" }
        if v = self.opt_["q"] { params["q"] = "\(v)" }
        if v = self.opt_["regionCode"] { params["regionCode"] = "\(v)" }
        if v = self.opt_["relatedToVideoId"] { params["relatedToVideoId"] = "\(v)" }
        if v = self.opt_["relevanceLanguage"] { params["relevanceLanguage"] = "\(v)" }
        if v = self.opt_["safeSearch"] { params["safeSearch"] = "\(v)" }
        if v = self.opt_["topicId"] { params["topicId"] = "\(v)" }
        if v = self.opt_["type"] { params["type"] = "\(v)" }
        if v = self.opt_["videoCaption"] { params["videoCaption"] = "\(v)" }
        if v = self.opt_["videoCategoryId"] { params["videoCategoryId"] = "\(v)" }
        if v = self.opt_["videoDefinition"] { params["videoDefinition"] = "\(v)" }
        if v = self.opt_["videoDimension"] { params["videoDimension"] = "\(v)" }
        if v = self.opt_["videoDuration"] { params["videoDuration"] = "\(v)" }
        if v = self.opt_["videoEmbeddable"] { params["videoEmbeddable"] = "\(v)" }
        if v = self.opt_["videoLicense"] { params["videoLicense"] = "\(v)" }
        if v = self.opt_["videoSyndicated"] { params["videoSyndicated"] = "\(v)" }
        if v = self.opt_["videoType"] { params["videoType"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.GET, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(SearchListResponse.decode(json), error)
        }
    }
        // {
	//   "description": "Returns a collection of search results that match the query parameters specified in the API request. By default, a search result set identifies matching video, channel, and playlist resources, but you can also configure queries to only retrieve a specific type of resource.",
	//   "httpMethod": "GET",
	//   "id": "youtube.search.list",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "channelId": {
	//       "description": "The channelId parameter indicates that the API response should only contain resources created by the channel",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "channelType": {
	//       "description": "The channelType parameter lets you restrict a search to a particular type of channel.",
	//       "enum": [
	//         "any",
	//         "show"
	//       ],
	//       "enumDescriptions": [
	//         "Return all channels.",
	//         "Only retrieve shows."
	//       ],
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "eventType": {
	//       "description": "The eventType parameter restricts a search to broadcast events.",
	//       "enum": [
	//         "completed",
	//         "live",
	//         "upcoming"
	//       ],
	//       "enumDescriptions": [
	//         "Only include completed broadcasts.",
	//         "Only include active broadcasts.",
	//         "Only include upcoming broadcasts."
	//       ],
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "forContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe forContentOwner parameter restricts the search to only retrieve resources owned by the content owner specified by the onBehalfOfContentOwner parameter. The user must be authenticated using a CMS account linked to the specified content owner and onBehalfOfContentOwner must be provided.",
	//       "location": "query",
	//       "type": "boolean"
	//     },
	//     "forMine": {
	//       "description": "The forMine parameter restricts the search to only retrieve videos owned by the authenticated user. If you set this parameter to true, then the type parameter's value must also be set to video.",
	//       "location": "query",
	//       "type": "boolean"
	//     },
	//     "location": {
	//       "description": "The location parameter restricts a search to videos that have a geographical location specified in their metadata. The value is a string that specifies geographic latitude/longitude coordinates e.g. (37.42307,-122.08427)",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "locationRadius": {
	//       "description": "The locationRadius, in conjunction with the location parameter, defines a geographic area. If the geographic coordinates associated with a video fall within that area, then the video may be included in search results. This parameter value must be a floating point number followed by a measurement unit. Valid measurement units are m, km, ft, and mi. For example, valid parameter values include 1500m, 5km, 10000ft, and 0.75mi. The API does not support locationRadius parameter values larger than 1000 kilometers.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "maxResults": {
	//       "default": "5",
	//       "description": "The maxResults parameter specifies the maximum number of items that should be returned in the result set.",
	//       "format": "uint32",
	//       "location": "query",
	//       "maximum": "50",
	//       "minimum": "0",
	//       "type": "integer"
	//     },
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "order": {
	//       "default": "SEARCH_SORT_RELEVANCE",
	//       "description": "The order parameter specifies the method that will be used to order resources in the API response.",
	//       "enum": [
	//         "date",
	//         "rating",
	//         "relevance",
	//         "title",
	//         "videoCount",
	//         "viewCount"
	//       ],
	//       "enumDescriptions": [
	//         "Resources are sorted in reverse chronological order based on the date they were created.",
	//         "Resources are sorted from highest to lowest rating.",
	//         "Resources are sorted based on their relevance to the search query. This is the default value for this parameter.",
	//         "Resources are sorted alphabetically by title.",
	//         "Channels are sorted in descending order of their number of uploaded videos.",
	//         "Resources are sorted from highest to lowest number of views."
	//       ],
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "pageToken": {
	//       "description": "The pageToken parameter identifies a specific page in the result set that should be returned. In an API response, the nextPageToken and prevPageToken properties identify other pages that could be retrieved.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter specifies a comma-separated list of one or more search resource properties that the API response will include. The part names that you can include in the parameter value are id and snippet.\n\nIf the parameter identifies a property that contains child properties, the child properties will be included in the response. For example, in a search result, the snippet property contains other properties that identify the result's title, description, and so forth. If you set part=snippet, the API response will also contain all of those nested properties.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     },
	//     "publishedAfter": {
	//       "description": "The publishedAfter parameter indicates that the API response should only contain resources created after the specified time. The value is an RFC 3339 formatted date-time value (1970-01-01T00:00:00Z).",
	//       "format": "date-time",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "publishedBefore": {
	//       "description": "The publishedBefore parameter indicates that the API response should only contain resources created before the specified time. The value is an RFC 3339 formatted date-time value (1970-01-01T00:00:00Z).",
	//       "format": "date-time",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "q": {
	//       "description": "The q parameter specifies the query term to search for.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "regionCode": {
	//       "description": "The regionCode parameter instructs the API to return search results for the specified country. The parameter value is an ISO 3166-1 alpha-2 country code.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "relatedToVideoId": {
	//       "description": "The relatedToVideoId parameter retrieves a list of videos that are related to the video that the parameter value identifies. The parameter value must be set to a YouTube video ID and, if you are using this parameter, the type parameter must be set to video.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "relevanceLanguage": {
	//       "description": "The relevanceLanguage parameter instructs the API to return search results that are most relevant to the specified language. The parameter value is typically an ISO 639-1 two-letter language code. However, you should use the values zh-Hans for simplified Chinese and zh-Hant for traditional Chinese. Please note that results in other languages will still be returned if they are highly relevant to the search query term.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "safeSearch": {
	//       "description": "The safeSearch parameter indicates whether the search results should include restricted content as well as standard content.",
	//       "enum": [
	//         "moderate",
	//         "none",
	//         "strict"
	//       ],
	//       "enumDescriptions": [
	//         "YouTube will filter some content from search results and, at the least, will filter content that is restricted in your locale. Based on their content, search results could be removed from search results or demoted in search results. This is the default parameter value.",
	//         "YouTube will not filter the search result set.",
	//         "YouTube will try to exclude all restricted content from the search result set. Based on their content, search results could be removed from search results or demoted in search results."
	//       ],
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "topicId": {
	//       "description": "The topicId parameter indicates that the API response should only contain resources associated with the specified topic. The value identifies a Freebase topic ID.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "type": {
	//       "default": "video,channel,playlist",
	//       "description": "The type parameter restricts a search query to only retrieve a particular type of resource. The value is a comma-separated list of resource types.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "videoCaption": {
	//       "description": "The videoCaption parameter indicates whether the API should filter video search results based on whether they have captions.",
	//       "enum": [
	//         "any",
	//         "closedCaption",
	//         "none"
	//       ],
	//       "enumDescriptions": [
	//         "Do not filter results based on caption availability.",
	//         "Only include videos that have captions.",
	//         "Only include videos that do not have captions."
	//       ],
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "videoCategoryId": {
	//       "description": "The videoCategoryId parameter filters video search results based on their category.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "videoDefinition": {
	//       "description": "The videoDefinition parameter lets you restrict a search to only include either high definition (HD) or standard definition (SD) videos. HD videos are available for playback in at least 720p, though higher resolutions, like 1080p, might also be available.",
	//       "enum": [
	//         "any",
	//         "high",
	//         "standard"
	//       ],
	//       "enumDescriptions": [
	//         "Return all videos, regardless of their resolution.",
	//         "Only retrieve HD videos.",
	//         "Only retrieve videos in standard definition."
	//       ],
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "videoDimension": {
	//       "description": "The videoDimension parameter lets you restrict a search to only retrieve 2D or 3D videos.",
	//       "enum": [
	//         "2d",
	//         "3d",
	//         "any"
	//       ],
	//       "enumDescriptions": [
	//         "Restrict search results to exclude 3D videos.",
	//         "Restrict search results to only include 3D videos.",
	//         "Include both 3D and non-3D videos in returned results. This is the default value."
	//       ],
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "videoDuration": {
	//       "description": "The videoDuration parameter filters video search results based on their duration.",
	//       "enum": [
	//         "any",
	//         "long",
	//         "medium",
	//         "short"
	//       ],
	//       "enumDescriptions": [
	//         "Do not filter video search results based on their duration. This is the default value.",
	//         "Only include videos longer than 20 minutes.",
	//         "Only include videos that are between four and 20 minutes long (inclusive).",
	//         "Only include videos that are less than four minutes long."
	//       ],
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "videoEmbeddable": {
	//       "description": "The videoEmbeddable parameter lets you to restrict a search to only videos that can be embedded into a webpage.",
	//       "enum": [
	//         "any",
	//         "true"
	//       ],
	//       "enumDescriptions": [
	//         "Return all videos, embeddable or not.",
	//         "Only retrieve embeddable videos."
	//       ],
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "videoLicense": {
	//       "description": "The videoLicense parameter filters search results to only include videos with a particular license. YouTube lets video uploaders choose to attach either the Creative Commons license or the standard YouTube license to each of their videos.",
	//       "enum": [
	//         "any",
	//         "creativeCommon",
	//         "youtube"
	//       ],
	//       "enumDescriptions": [
	//         "Return all videos, regardless of which license they have, that match the query parameters.",
	//         "Only return videos that have a Creative Commons license. Users can reuse videos with this license in other videos that they create. Learn more.",
	//         "Only return videos that have the standard YouTube license."
	//       ],
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "videoSyndicated": {
	//       "description": "The videoSyndicated parameter lets you to restrict a search to only videos that can be played outside youtube.com.",
	//       "enum": [
	//         "any",
	//         "true"
	//       ],
	//       "enumDescriptions": [
	//         "Return all videos, syndicated or not.",
	//         "Only retrieve syndicated videos."
	//       ],
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "videoType": {
	//       "description": "The videoType parameter lets you restrict a search to a particular type of videos.",
	//       "enum": [
	//         "any",
	//         "episode",
	//         "movie"
	//       ],
	//       "enumDescriptions": [
	//         "Return all videos.",
	//         "Only retrieve episodes of shows.",
	//         "Only retrieve movies."
	//       ],
	//       "location": "query",
	//       "type": "string"
	//     }
	//   },
	//   "path": "search",
	//   "response": {
	//     "$ref": "SearchListResponse"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtube.readonly",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.subscriptions.delete":
// meth generateCode
// // ...Call struct

struct SubscriptionsDeleteCall {
    let s: Service
    var opt_: [String: String]
    var id: String
}

// delete: Deletes a subscription.
// // ...Service extension
extension SubscriptionsService {
    func delete(id: String) -> SubscriptionsDeleteCall {
        var c = SubscriptionsDeleteCall(
            s: s,
            opt_: Dictionary<String, String>(),
            id: id
            )
        return c
    }
}

// // ...Call extension
extension SubscriptionsDeleteCall {

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> SubscriptionsDeleteCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "subscriptions"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["id"] = "\(self.id)"
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.DELETE, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(.decode(json), error)
        }
    }
        // {
	//   "description": "Deletes a subscription.",
	//   "httpMethod": "DELETE",
	//   "id": "youtube.subscriptions.delete",
	//   "parameterOrder": [
	//     "id"
	//   ],
	//   "parameters": {
	//     "id": {
	//       "description": "The id parameter specifies the YouTube subscription ID for the resource that is being deleted. In a subscription resource, the id property specifies the YouTube subscription ID.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "subscriptions",
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.subscriptions.insert":
// meth generateCode
// // ...Call struct

struct SubscriptionsInsertCall {
    let s: Service
    var opt_: [String: String]
    var part: String
    var subscription: Subscription
}

// insert: Adds a subscription for the authenticated user's channel.
// // ...Service extension
extension SubscriptionsService {
    func insert(part: String, subscription: Subscription) -> SubscriptionsInsertCall {
        var c = SubscriptionsInsertCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part,
            subscription: subscription
            )
        return c
    }
}

// // ...Call extension
extension SubscriptionsInsertCall {

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> SubscriptionsInsertCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (Subscription, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "subscriptions"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        // TODO: convert body to JSON
        let body = ""
        let ctype = "application/json"
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["Content-Type"] = ctype
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.POST, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(Subscription.decode(json), error)
        }
    }
        // {
	//   "description": "Adds a subscription for the authenticated user's channel.",
	//   "httpMethod": "POST",
	//   "id": "youtube.subscriptions.insert",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "part": {
	//       "description": "The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.\n\nThe part names that you can include in the parameter value are snippet and contentDetails.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "subscriptions",
	//   "request": {
	//     "$ref": "Subscription"
	//   },
	//   "response": {
	//     "$ref": "Subscription"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.subscriptions.list":
// meth generateCode
// // ...Call struct

struct SubscriptionsListCall {
    let s: Service
    var opt_: [String: String]
    var part: String
}

// list: Returns subscription resources that match the API request
// criteria.
// // ...Service extension
extension SubscriptionsService {
    func list(part: String) -> SubscriptionsListCall {
        var c = SubscriptionsListCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part
            )
        return c
    }
}

// // ...Call extension
extension SubscriptionsListCall {

    // channelId sets the optional parameter "channelId": The channelId
    // parameter specifies a YouTube channel ID. The API will only return
    // that channel's subscriptions.
    func channelId(channelId: String) -> SubscriptionsListCall {
        c.opt_["channelId"] = channelId
        return c
    }

    // forChannelId sets the optional parameter "forChannelId": The
    // forChannelId parameter specifies a comma-separated list of channel
    // IDs. The API response will then only contain subscriptions matching
    // those channels.
    func forChannelId(forChannelId: String) -> SubscriptionsListCall {
        c.opt_["forChannelId"] = forChannelId
        return c
    }

    // id sets the optional parameter "id": The id parameter specifies a
    // comma-separated list of the YouTube subscription ID(s) for the
    // resource(s) that are being retrieved. In a subscription resource, the
    // id property specifies the YouTube subscription ID.
    func id(id: String) -> SubscriptionsListCall {
        c.opt_["id"] = id
        return c
    }

    // maxResults sets the optional parameter "maxResults": The maxResults
    // parameter specifies the maximum number of items that should be
    // returned in the result set.
    func maxResults(maxResults: Int64) -> SubscriptionsListCall {
        c.opt_["maxResults"] = maxResults
        return c
    }

    // mine sets the optional parameter "mine": Set this parameter's value
    // to true to retrieve a feed of the authenticated user's subscriptions.
    func mine(mine: Bool) -> SubscriptionsListCall {
        c.opt_["mine"] = mine
        return c
    }

    // mySubscribers sets the optional parameter "mySubscribers": Set this
    // parameter's value to true to retrieve a feed of the subscribers of
    // the authenticated user.
    func mySubscribers(mySubscribers: Bool) -> SubscriptionsListCall {
        c.opt_["mySubscribers"] = mySubscribers
        return c
    }

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> SubscriptionsListCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // onBehalfOfContentOwnerChannel sets the optional parameter
    // "onBehalfOfContentOwnerChannel": This parameter can only be used in a
    // properly authorized request. Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The
    // onBehalfOfContentOwnerChannel parameter specifies the YouTube channel
    // ID of the channel to which a video is being added. This parameter is
    // required when a request specifies a value for the
    // onBehalfOfContentOwner parameter, and it can only be used in
    // conjunction with that parameter. In addition, the request must be
    // authorized using a CMS account that is linked to the content owner
    // that the onBehalfOfContentOwner parameter specifies. Finally, the
    // channel that the onBehalfOfContentOwnerChannel parameter value
    // specifies must be linked to the content owner that the
    // onBehalfOfContentOwner parameter specifies.
    // 
    // This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and perform actions on behalf of the channel specified in the
    // parameter value, without having to provide authentication credentials
    // for each separate channel.
    func onBehalfOfContentOwnerChannel(onBehalfOfContentOwnerChannel: String) -> SubscriptionsListCall {
        c.opt_["onBehalfOfContentOwnerChannel"] = onBehalfOfContentOwnerChannel
        return c
    }

    // order sets the optional parameter "order": The order parameter
    // specifies the method that will be used to sort resources in the API
    // response.
    func order(order: String) -> SubscriptionsListCall {
        c.opt_["order"] = order
        return c
    }

    // pageToken sets the optional parameter "pageToken": The pageToken
    // parameter identifies a specific page in the result set that should be
    // returned. In an API response, the nextPageToken and prevPageToken
    // properties identify other pages that could be retrieved.
    func pageToken(pageToken: String) -> SubscriptionsListCall {
        c.opt_["pageToken"] = pageToken
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> SubscriptionsListCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (SubscriptionListResponse, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "subscriptions"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["channelId"] { params["channelId"] = "\(v)" }
        if v = self.opt_["forChannelId"] { params["forChannelId"] = "\(v)" }
        if v = self.opt_["id"] { params["id"] = "\(v)" }
        if v = self.opt_["maxResults"] { params["maxResults"] = "\(v)" }
        if v = self.opt_["mine"] { params["mine"] = "\(v)" }
        if v = self.opt_["mySubscribers"] { params["mySubscribers"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwnerChannel"] { params["onBehalfOfContentOwnerChannel"] = "\(v)" }
        if v = self.opt_["order"] { params["order"] = "\(v)" }
        if v = self.opt_["pageToken"] { params["pageToken"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.GET, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(SubscriptionListResponse.decode(json), error)
        }
    }
        // {
	//   "description": "Returns subscription resources that match the API request criteria.",
	//   "httpMethod": "GET",
	//   "id": "youtube.subscriptions.list",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "channelId": {
	//       "description": "The channelId parameter specifies a YouTube channel ID. The API will only return that channel's subscriptions.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "forChannelId": {
	//       "description": "The forChannelId parameter specifies a comma-separated list of channel IDs. The API response will then only contain subscriptions matching those channels.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "id": {
	//       "description": "The id parameter specifies a comma-separated list of the YouTube subscription ID(s) for the resource(s) that are being retrieved. In a subscription resource, the id property specifies the YouTube subscription ID.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "maxResults": {
	//       "default": "5",
	//       "description": "The maxResults parameter specifies the maximum number of items that should be returned in the result set.",
	//       "format": "uint32",
	//       "location": "query",
	//       "maximum": "50",
	//       "minimum": "0",
	//       "type": "integer"
	//     },
	//     "mine": {
	//       "description": "Set this parameter's value to true to retrieve a feed of the authenticated user's subscriptions.",
	//       "location": "query",
	//       "type": "boolean"
	//     },
	//     "mySubscribers": {
	//       "description": "Set this parameter's value to true to retrieve a feed of the subscribers of the authenticated user.",
	//       "location": "query",
	//       "type": "boolean"
	//     },
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwnerChannel": {
	//       "description": "This parameter can only be used in a properly authorized request. Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID of the channel to which a video is being added. This parameter is required when a request specifies a value for the onBehalfOfContentOwner parameter, and it can only be used in conjunction with that parameter. In addition, the request must be authorized using a CMS account that is linked to the content owner that the onBehalfOfContentOwner parameter specifies. Finally, the channel that the onBehalfOfContentOwnerChannel parameter value specifies must be linked to the content owner that the onBehalfOfContentOwner parameter specifies.\n\nThis parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and perform actions on behalf of the channel specified in the parameter value, without having to provide authentication credentials for each separate channel.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "order": {
	//       "default": "SUBSCRIPTION_ORDER_RELEVANCE",
	//       "description": "The order parameter specifies the method that will be used to sort resources in the API response.",
	//       "enum": [
	//         "alphabetical",
	//         "relevance",
	//         "unread"
	//       ],
	//       "enumDescriptions": [
	//         "Sort alphabetically.",
	//         "Sort by relevance.",
	//         "Sort by order of activity."
	//       ],
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "pageToken": {
	//       "description": "The pageToken parameter identifies a specific page in the result set that should be returned. In an API response, the nextPageToken and prevPageToken properties identify other pages that could be retrieved.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter specifies a comma-separated list of one or more subscription resource properties that the API response will include. The part names that you can include in the parameter value are id, snippet, and contentDetails.\n\nIf the parameter identifies a property that contains child properties, the child properties will be included in the response. For example, in a subscription resource, the snippet property contains other properties, such as a display title for the subscription. If you set part=snippet, the API response will also contain all of those nested properties.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "subscriptions",
	//   "response": {
	//     "$ref": "SubscriptionListResponse"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtube.readonly",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.thumbnails.set":
// meth generateCode
// // ...Call struct

struct ThumbnailsSetCall {
    let s: Service
    var opt_: [String: String]
    var videoId: String
/* TODO: upload support
	media_     io.Reader
	resumable_ googleapi.SizeReaderAt
	mediaType_ string
	ctx_       context.Context
	protocol_  string
 TODO: upload support */
}

// set: Uploads a custom video thumbnail to YouTube and sets it for a
// video.
// // ...Service extension
extension ThumbnailsService {
    func set(videoId: String) -> ThumbnailsSetCall {
        var c = ThumbnailsSetCall(
            s: s,
            opt_: Dictionary<String, String>(),
            videoId: videoId
            )
        return c
    }
}

// // ...Call extension
extension ThumbnailsSetCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": The onBehalfOfContentOwner parameter
    // indicates that the authenticated user is acting on behalf of the
    // content owner specified in the parameter value. This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and get access to all their video and channel data, without
    // having to provide authentication credentials for each individual
    // channel. The actual CMS account that the user authenticates with
    // needs to be linked to the specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> ThumbnailsSetCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }
//TODO: convert media upload

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> ThumbnailsSetCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (ThumbnailSetResponse, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "thumbnails/set"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["videoId"] = "\(self.videoId)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        // TODO: Swift Media upload goes here
        // TODO: Swift Media upload goes here
// TODO: convert to swift
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.POST, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(ThumbnailSetResponse.decode(json), error)
        }
// TODO: convert to swift
    }
        // {
	//   "description": "Uploads a custom video thumbnail to YouTube and sets it for a video.",
	//   "httpMethod": "POST",
	//   "id": "youtube.thumbnails.set",
	//   "mediaUpload": {
	//     "accept": [
	//       "application/octet-stream",
	//       "image/jpeg",
	//       "image/png"
	//     ],
	//     "maxSize": "2MB",
	//     "protocols": {
	//       "resumable": {
	//         "multipart": true,
	//         "path": "/resumable/upload/youtube/v3/thumbnails/set"
	//       },
	//       "simple": {
	//         "multipart": true,
	//         "path": "/upload/youtube/v3/thumbnails/set"
	//       }
	//     }
	//   },
	//   "parameterOrder": [
	//     "videoId"
	//   ],
	//   "parameters": {
	//     "onBehalfOfContentOwner": {
	//       "description": "The onBehalfOfContentOwner parameter indicates that the authenticated user is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The actual CMS account that the user authenticates with needs to be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "videoId": {
	//       "description": "The videoId parameter specifies a YouTube video ID for which the custom video thumbnail is being provided.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "thumbnails/set",
	//   "response": {
	//     "$ref": "ThumbnailSetResponse"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtube.upload",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ],
	//   "supportsMediaUpload": true
	// }

}

// method id "youtube.videoCategories.list":
// meth generateCode
// // ...Call struct

struct VideoCategoriesListCall {
    let s: Service
    var opt_: [String: String]
    var part: String
}

// list: Returns a list of categories that can be associated with
// YouTube videos.
// // ...Service extension
extension VideoCategoriesService {
    func list(part: String) -> VideoCategoriesListCall {
        var c = VideoCategoriesListCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part
            )
        return c
    }
}

// // ...Call extension
extension VideoCategoriesListCall {

    // hl sets the optional parameter "hl": The hl parameter specifies the
    // language that should be used for text values in the API response.
    func hl(hl: String) -> VideoCategoriesListCall {
        c.opt_["hl"] = hl
        return c
    }

    // id sets the optional parameter "id": The id parameter specifies a
    // comma-separated list of video category IDs for the resources that you
    // are retrieving.
    func id(id: String) -> VideoCategoriesListCall {
        c.opt_["id"] = id
        return c
    }

    // regionCode sets the optional parameter "regionCode": The regionCode
    // parameter instructs the API to return the list of video categories
    // available in the specified country. The parameter value is an ISO
    // 3166-1 alpha-2 country code.
    func regionCode(regionCode: String) -> VideoCategoriesListCall {
        c.opt_["regionCode"] = regionCode
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> VideoCategoriesListCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (VideoCategoryListResponse, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "videoCategories"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["hl"] { params["hl"] = "\(v)" }
        if v = self.opt_["id"] { params["id"] = "\(v)" }
        if v = self.opt_["regionCode"] { params["regionCode"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.GET, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(VideoCategoryListResponse.decode(json), error)
        }
    }
        // {
	//   "description": "Returns a list of categories that can be associated with YouTube videos.",
	//   "httpMethod": "GET",
	//   "id": "youtube.videoCategories.list",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "hl": {
	//       "default": "en_US",
	//       "description": "The hl parameter specifies the language that should be used for text values in the API response.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "id": {
	//       "description": "The id parameter specifies a comma-separated list of video category IDs for the resources that you are retrieving.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter specifies the videoCategory resource parts that the API response will include. Supported values are id and snippet.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     },
	//     "regionCode": {
	//       "description": "The regionCode parameter instructs the API to return the list of video categories available in the specified country. The parameter value is an ISO 3166-1 alpha-2 country code.",
	//       "location": "query",
	//       "type": "string"
	//     }
	//   },
	//   "path": "videoCategories",
	//   "response": {
	//     "$ref": "VideoCategoryListResponse"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtube.readonly",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.videos.delete":
// meth generateCode
// // ...Call struct

struct VideosDeleteCall {
    let s: Service
    var opt_: [String: String]
    var id: String
}

// delete: Deletes a YouTube video.
// // ...Service extension
extension VideosService {
    func delete(id: String) -> VideosDeleteCall {
        var c = VideosDeleteCall(
            s: s,
            opt_: Dictionary<String, String>(),
            id: id
            )
        return c
    }
}

// // ...Call extension
extension VideosDeleteCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // actual CMS account that the user authenticates with must be linked to
    // the specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> VideosDeleteCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> VideosDeleteCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "videos"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["id"] = "\(self.id)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.DELETE, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(.decode(json), error)
        }
    }
        // {
	//   "description": "Deletes a YouTube video.",
	//   "httpMethod": "DELETE",
	//   "id": "youtube.videos.delete",
	//   "parameterOrder": [
	//     "id"
	//   ],
	//   "parameters": {
	//     "id": {
	//       "description": "The id parameter specifies the YouTube video ID for the resource that is being deleted. In a video resource, the id property specifies the video's ID.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The actual CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     }
	//   },
	//   "path": "videos",
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.videos.getRating":
// meth generateCode
// // ...Call struct

struct VideosGetRatingCall {
    let s: Service
    var opt_: [String: String]
    var id: String
}

// getRating: Retrieves the ratings that the authorized user gave to a
// list of specified videos.
// // ...Service extension
extension VideosService {
    func getRating(id: String) -> VideosGetRatingCall {
        var c = VideosGetRatingCall(
            s: s,
            opt_: Dictionary<String, String>(),
            id: id
            )
        return c
    }
}

// // ...Call extension
extension VideosGetRatingCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> VideosGetRatingCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> VideosGetRatingCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (VideoGetRatingResponse, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "videos/getRating"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["id"] = "\(self.id)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.GET, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(VideoGetRatingResponse.decode(json), error)
        }
    }
        // {
	//   "description": "Retrieves the ratings that the authorized user gave to a list of specified videos.",
	//   "httpMethod": "GET",
	//   "id": "youtube.videos.getRating",
	//   "parameterOrder": [
	//     "id"
	//   ],
	//   "parameters": {
	//     "id": {
	//       "description": "The id parameter specifies a comma-separated list of the YouTube video ID(s) for the resource(s) for which you are retrieving rating data. In a video resource, the id property specifies the video's ID.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     }
	//   },
	//   "path": "videos/getRating",
	//   "response": {
	//     "$ref": "VideoGetRatingResponse"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.videos.insert":
// meth generateCode
// // ...Call struct

struct VideosInsertCall {
    let s: Service
    var opt_: [String: String]
    var part: String
    var video: Video
/* TODO: upload support
	media_     io.Reader
	resumable_ googleapi.SizeReaderAt
	mediaType_ string
	ctx_       context.Context
	protocol_  string
 TODO: upload support */
}

// insert: Uploads a video to YouTube and optionally sets the video's
// metadata.
// // ...Service extension
extension VideosService {
    func insert(part: String, video: Video) -> VideosInsertCall {
        var c = VideosInsertCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part,
            video: video
            )
        return c
    }
}

// // ...Call extension
extension VideosInsertCall {

    // autoLevels sets the optional parameter "autoLevels": The autoLevels
    // parameter indicates whether YouTube should automatically enhance the
    // video's lighting and color.
    func autoLevels(autoLevels: Bool) -> VideosInsertCall {
        c.opt_["autoLevels"] = autoLevels
        return c
    }

    // notifySubscribers sets the optional parameter "notifySubscribers":
    // The notifySubscribers parameter indicates whether YouTube should send
    // notification to subscribers about the inserted video.
    func notifySubscribers(notifySubscribers: Bool) -> VideosInsertCall {
        c.opt_["notifySubscribers"] = notifySubscribers
        return c
    }

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> VideosInsertCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // onBehalfOfContentOwnerChannel sets the optional parameter
    // "onBehalfOfContentOwnerChannel": This parameter can only be used in a
    // properly authorized request. Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The
    // onBehalfOfContentOwnerChannel parameter specifies the YouTube channel
    // ID of the channel to which a video is being added. This parameter is
    // required when a request specifies a value for the
    // onBehalfOfContentOwner parameter, and it can only be used in
    // conjunction with that parameter. In addition, the request must be
    // authorized using a CMS account that is linked to the content owner
    // that the onBehalfOfContentOwner parameter specifies. Finally, the
    // channel that the onBehalfOfContentOwnerChannel parameter value
    // specifies must be linked to the content owner that the
    // onBehalfOfContentOwner parameter specifies.
    // 
    // This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and perform actions on behalf of the channel specified in the
    // parameter value, without having to provide authentication credentials
    // for each separate channel.
    func onBehalfOfContentOwnerChannel(onBehalfOfContentOwnerChannel: String) -> VideosInsertCall {
        c.opt_["onBehalfOfContentOwnerChannel"] = onBehalfOfContentOwnerChannel
        return c
    }

    // stabilize sets the optional parameter "stabilize": The stabilize
    // parameter indicates whether YouTube should adjust the video to remove
    // shaky camera motions.
    func stabilize(stabilize: Bool) -> VideosInsertCall {
        c.opt_["stabilize"] = stabilize
        return c
    }
//TODO: convert media upload

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> VideosInsertCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (Video, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "videos"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        // TODO: convert body to JSON
        let body = ""
        let ctype = "application/json"
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["autoLevels"] { params["autoLevels"] = "\(v)" }
        if v = self.opt_["notifySubscribers"] { params["notifySubscribers"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwnerChannel"] { params["onBehalfOfContentOwnerChannel"] = "\(v)" }
        if v = self.opt_["stabilize"] { params["stabilize"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        // TODO: Swift Media upload goes here
        // TODO: Swift Media upload goes here
// TODO: convert to swift
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.POST, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(Video.decode(json), error)
        }
// TODO: convert to swift
    }
        // {
	//   "description": "Uploads a video to YouTube and optionally sets the video's metadata.",
	//   "httpMethod": "POST",
	//   "id": "youtube.videos.insert",
	//   "mediaUpload": {
	//     "accept": [
	//       "application/octet-stream",
	//       "video/*"
	//     ],
	//     "maxSize": "64GB",
	//     "protocols": {
	//       "resumable": {
	//         "multipart": true,
	//         "path": "/resumable/upload/youtube/v3/videos"
	//       },
	//       "simple": {
	//         "multipart": true,
	//         "path": "/upload/youtube/v3/videos"
	//       }
	//     }
	//   },
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "autoLevels": {
	//       "description": "The autoLevels parameter indicates whether YouTube should automatically enhance the video's lighting and color.",
	//       "location": "query",
	//       "type": "boolean"
	//     },
	//     "notifySubscribers": {
	//       "default": "true",
	//       "description": "The notifySubscribers parameter indicates whether YouTube should send notification to subscribers about the inserted video.",
	//       "location": "query",
	//       "type": "boolean"
	//     },
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwnerChannel": {
	//       "description": "This parameter can only be used in a properly authorized request. Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwnerChannel parameter specifies the YouTube channel ID of the channel to which a video is being added. This parameter is required when a request specifies a value for the onBehalfOfContentOwner parameter, and it can only be used in conjunction with that parameter. In addition, the request must be authorized using a CMS account that is linked to the content owner that the onBehalfOfContentOwner parameter specifies. Finally, the channel that the onBehalfOfContentOwnerChannel parameter value specifies must be linked to the content owner that the onBehalfOfContentOwner parameter specifies.\n\nThis parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and perform actions on behalf of the channel specified in the parameter value, without having to provide authentication credentials for each separate channel.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.\n\nThe part names that you can include in the parameter value are snippet, contentDetails, fileDetails, liveStreamingDetails, localizations, player, processingDetails, recordingDetails, statistics, status, suggestions, and topicDetails. However, not all of those parts contain properties that can be set when setting or updating a video's metadata. For example, the statistics object encapsulates statistics that YouTube calculates for a video and does not contain values that you can set or modify. If the parameter value specifies a part that does not contain mutable values, that part will still be included in the API response.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     },
	//     "stabilize": {
	//       "description": "The stabilize parameter indicates whether YouTube should adjust the video to remove shaky camera motions.",
	//       "location": "query",
	//       "type": "boolean"
	//     }
	//   },
	//   "path": "videos",
	//   "request": {
	//     "$ref": "Video"
	//   },
	//   "response": {
	//     "$ref": "Video"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtube.upload",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ],
	//   "supportsMediaUpload": true
	// }

}

// method id "youtube.videos.list":
// meth generateCode
// // ...Call struct

struct VideosListCall {
    let s: Service
    var opt_: [String: String]
    var part: String
}

// list: Returns a list of videos that match the API request parameters.
// // ...Service extension
extension VideosService {
    func list(part: String) -> VideosListCall {
        var c = VideosListCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part
            )
        return c
    }
}

// // ...Call extension
extension VideosListCall {

    // chart sets the optional parameter "chart": The chart parameter
    // identifies the chart that you want to retrieve.
    func chart(chart: String) -> VideosListCall {
        c.opt_["chart"] = chart
        return c
    }

    // hl sets the optional parameter "hl": The hl parameter instructs the
    // API to return a localized version of the video details. If localized
    // text is nor available for the requested language, the localizations
    // object in the API response will contain the requested information in
    // the default language instead. The parameter value is a BCP-47
    // language code. Your application can determine whether the requested
    // localization was returned by checking the value of the
    // snippet.localized.language property in the API response.
    func hl(hl: String) -> VideosListCall {
        c.opt_["hl"] = hl
        return c
    }

    // id sets the optional parameter "id": The id parameter specifies a
    // comma-separated list of the YouTube video ID(s) for the resource(s)
    // that are being retrieved. In a video resource, the id property
    // specifies the video's ID.
    func id(id: String) -> VideosListCall {
        c.opt_["id"] = id
        return c
    }

    // locale sets the optional parameter "locale": DEPRECATED
    func locale(locale: String) -> VideosListCall {
        c.opt_["locale"] = locale
        return c
    }

    // maxResults sets the optional parameter "maxResults": The maxResults
    // parameter specifies the maximum number of items that should be
    // returned in the result set.
    // 
    // Note: This parameter is supported for
    // use in conjunction with the myRating parameter, but it is not
    // supported for use in conjunction with the id parameter.
    func maxResults(maxResults: Int64) -> VideosListCall {
        c.opt_["maxResults"] = maxResults
        return c
    }

    // myRating sets the optional parameter "myRating": Set this parameter's
    // value to like or dislike to instruct the API to only return videos
    // liked or disliked by the authenticated user.
    func myRating(myRating: String) -> VideosListCall {
        c.opt_["myRating"] = myRating
        return c
    }

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> VideosListCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // pageToken sets the optional parameter "pageToken": The pageToken
    // parameter identifies a specific page in the result set that should be
    // returned. In an API response, the nextPageToken and prevPageToken
    // properties identify other pages that could be retrieved.
    // 
    // Note: This
    // parameter is supported for use in conjunction with the myRating
    // parameter, but it is not supported for use in conjunction with the id
    // parameter.
    func pageToken(pageToken: String) -> VideosListCall {
        c.opt_["pageToken"] = pageToken
        return c
    }

    // regionCode sets the optional parameter "regionCode": The regionCode
    // parameter instructs the API to select a video chart available in the
    // specified region. This parameter can only be used in conjunction with
    // the chart parameter. The parameter value is an ISO 3166-1 alpha-2
    // country code.
    func regionCode(regionCode: String) -> VideosListCall {
        c.opt_["regionCode"] = regionCode
        return c
    }

    // videoCategoryId sets the optional parameter "videoCategoryId": The
    // videoCategoryId parameter identifies the video category for which the
    // chart should be retrieved. This parameter can only be used in
    // conjunction with the chart parameter. By default, charts are not
    // restricted to a particular category.
    func videoCategoryId(videoCategoryId: String) -> VideosListCall {
        c.opt_["videoCategoryId"] = videoCategoryId
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> VideosListCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (VideoListResponse, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "videos"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["chart"] { params["chart"] = "\(v)" }
        if v = self.opt_["hl"] { params["hl"] = "\(v)" }
        if v = self.opt_["id"] { params["id"] = "\(v)" }
        if v = self.opt_["locale"] { params["locale"] = "\(v)" }
        if v = self.opt_["maxResults"] { params["maxResults"] = "\(v)" }
        if v = self.opt_["myRating"] { params["myRating"] = "\(v)" }
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["pageToken"] { params["pageToken"] = "\(v)" }
        if v = self.opt_["regionCode"] { params["regionCode"] = "\(v)" }
        if v = self.opt_["videoCategoryId"] { params["videoCategoryId"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.GET, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(VideoListResponse.decode(json), error)
        }
    }
        // {
	//   "description": "Returns a list of videos that match the API request parameters.",
	//   "httpMethod": "GET",
	//   "id": "youtube.videos.list",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "chart": {
	//       "description": "The chart parameter identifies the chart that you want to retrieve.",
	//       "enum": [
	//         "mostPopular"
	//       ],
	//       "enumDescriptions": [
	//         "Return the most popular videos for the specified content region and video category."
	//       ],
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "hl": {
	//       "description": "The hl parameter instructs the API to return a localized version of the video details. If localized text is nor available for the requested language, the localizations object in the API response will contain the requested information in the default language instead. The parameter value is a BCP-47 language code. Your application can determine whether the requested localization was returned by checking the value of the snippet.localized.language property in the API response.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "id": {
	//       "description": "The id parameter specifies a comma-separated list of the YouTube video ID(s) for the resource(s) that are being retrieved. In a video resource, the id property specifies the video's ID.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "locale": {
	//       "description": "DEPRECATED",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "maxResults": {
	//       "default": "5",
	//       "description": "The maxResults parameter specifies the maximum number of items that should be returned in the result set.\n\nNote: This parameter is supported for use in conjunction with the myRating parameter, but it is not supported for use in conjunction with the id parameter.",
	//       "format": "uint32",
	//       "location": "query",
	//       "maximum": "50",
	//       "minimum": "1",
	//       "type": "integer"
	//     },
	//     "myRating": {
	//       "description": "Set this parameter's value to like or dislike to instruct the API to only return videos liked or disliked by the authenticated user.",
	//       "enum": [
	//         "dislike",
	//         "like"
	//       ],
	//       "enumDescriptions": [
	//         "Returns only videos disliked by the authenticated user.",
	//         "Returns only video liked by the authenticated user."
	//       ],
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "pageToken": {
	//       "description": "The pageToken parameter identifies a specific page in the result set that should be returned. In an API response, the nextPageToken and prevPageToken properties identify other pages that could be retrieved.\n\nNote: This parameter is supported for use in conjunction with the myRating parameter, but it is not supported for use in conjunction with the id parameter.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter specifies a comma-separated list of one or more video resource properties that the API response will include. The part names that you can include in the parameter value are id, snippet, contentDetails, fileDetails, liveStreamingDetails, localizations, player, processingDetails, recordingDetails, statistics, status, suggestions, and topicDetails.\n\nIf the parameter identifies a property that contains child properties, the child properties will be included in the response. For example, in a video resource, the snippet property contains the channelId, title, description, tags, and categoryId properties. As such, if you set part=snippet, the API response will contain all of those properties.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     },
	//     "regionCode": {
	//       "description": "The regionCode parameter instructs the API to select a video chart available in the specified region. This parameter can only be used in conjunction with the chart parameter. The parameter value is an ISO 3166-1 alpha-2 country code.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "videoCategoryId": {
	//       "default": "0",
	//       "description": "The videoCategoryId parameter identifies the video category for which the chart should be retrieved. This parameter can only be used in conjunction with the chart parameter. By default, charts are not restricted to a particular category.",
	//       "location": "query",
	//       "type": "string"
	//     }
	//   },
	//   "path": "videos",
	//   "response": {
	//     "$ref": "VideoListResponse"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtube.readonly",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.videos.rate":
// meth generateCode
// // ...Call struct

struct VideosRateCall {
    let s: Service
    var opt_: [String: String]
    var id: String
    var rating: String
}

// rate: Add a like or dislike rating to a video or remove a rating from
// a video.
// // ...Service extension
extension VideosService {
    func rate(id: String, rating: String) -> VideosRateCall {
        var c = VideosRateCall(
            s: s,
            opt_: Dictionary<String, String>(),
            id: id,
            rating: rating
            )
        return c
    }
}

// // ...Call extension
extension VideosRateCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // CMS account that the user authenticates with must be linked to the
    // specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> VideosRateCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> VideosRateCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "videos/rate"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["id"] = "\(self.id)"
        params["rating"] = "\(self.rating)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.POST, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(.decode(json), error)
        }
    }
        // {
	//   "description": "Add a like or dislike rating to a video or remove a rating from a video.",
	//   "httpMethod": "POST",
	//   "id": "youtube.videos.rate",
	//   "parameterOrder": [
	//     "id",
	//     "rating"
	//   ],
	//   "parameters": {
	//     "id": {
	//       "description": "The id parameter specifies the YouTube video ID of the video that is being rated or having its rating removed.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "rating": {
	//       "description": "Specifies the rating to record.",
	//       "enum": [
	//         "dislike",
	//         "like",
	//         "none"
	//       ],
	//       "enumDescriptions": [
	//         "Records that the authenticated user disliked the video.",
	//         "Records that the authenticated user liked the video.",
	//         "Removes any rating that the authenticated user had previously set for the video."
	//       ],
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "videos/rate",
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.videos.update":
// meth generateCode
// // ...Call struct

struct VideosUpdateCall {
    let s: Service
    var opt_: [String: String]
    var part: String
    var video: Video
}

// update: Updates a video's metadata.
// // ...Service extension
extension VideosService {
    func update(part: String, video: Video) -> VideosUpdateCall {
        var c = VideosUpdateCall(
            s: s,
            opt_: Dictionary<String, String>(),
            part: part,
            video: video
            )
        return c
    }
}

// // ...Call extension
extension VideosUpdateCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": Note: This parameter is intended
    // exclusively for YouTube content partners.
    // 
    // The onBehalfOfContentOwner
    // parameter indicates that the request's authorization credentials
    // identify a YouTube CMS user who is acting on behalf of the content
    // owner specified in the parameter value. This parameter is intended
    // for YouTube content partners that own and manage many different
    // YouTube channels. It allows content owners to authenticate once and
    // get access to all their video and channel data, without having to
    // provide authentication credentials for each individual channel. The
    // actual CMS account that the user authenticates with must be linked to
    // the specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> VideosUpdateCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> VideosUpdateCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (Video, error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "videos"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        // TODO: convert body to JSON
        let body = ""
        let ctype = "application/json"
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["part"] = "\(self.part)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["Content-Type"] = ctype
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.PUT, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(Video.decode(json), error)
        }
    }
        // {
	//   "description": "Updates a video's metadata.",
	//   "httpMethod": "PUT",
	//   "id": "youtube.videos.update",
	//   "parameterOrder": [
	//     "part"
	//   ],
	//   "parameters": {
	//     "onBehalfOfContentOwner": {
	//       "description": "Note: This parameter is intended exclusively for YouTube content partners.\n\nThe onBehalfOfContentOwner parameter indicates that the request's authorization credentials identify a YouTube CMS user who is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The actual CMS account that the user authenticates with must be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     },
	//     "part": {
	//       "description": "The part parameter serves two purposes in this operation. It identifies the properties that the write operation will set as well as the properties that the API response will include.\n\nThe part names that you can include in the parameter value are snippet, contentDetails, fileDetails, liveStreamingDetails, localizations, player, processingDetails, recordingDetails, statistics, status, suggestions, and topicDetails.\n\nNote that this method will override the existing values for all of the mutable properties that are contained in any parts that the parameter value specifies. For example, a video's privacy setting is contained in the status part. As such, if your request is updating a private video, and the request's part parameter value includes the status part, the video's privacy setting will be updated to whatever value the request body specifies. If the request body does not specify a value, the existing privacy setting will be removed and the video will revert to the default privacy setting.\n\nIn addition, not all of those parts contain properties that can be set when setting or updating a video's metadata. For example, the statistics object encapsulates statistics that YouTube calculates for a video and does not contain values that you can set or modify. If the parameter value specifies a part that does not contain mutable values, that part will still be included in the API response.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     }
	//   },
	//   "path": "videos",
	//   "request": {
	//     "$ref": "Video"
	//   },
	//   "response": {
	//     "$ref": "Video"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}

// method id "youtube.watermarks.set":
// meth generateCode
// // ...Call struct

struct WatermarksSetCall {
    let s: Service
    var opt_: [String: String]
    var channelId: String
    var invideobranding: InvideoBranding
/* TODO: upload support
	media_     io.Reader
	resumable_ googleapi.SizeReaderAt
	mediaType_ string
	ctx_       context.Context
	protocol_  string
 TODO: upload support */
}

// set: Uploads a watermark image to YouTube and sets it for a channel.
// // ...Service extension
extension WatermarksService {
    func set(channelId: String, invideobranding: InvideoBranding) -> WatermarksSetCall {
        var c = WatermarksSetCall(
            s: s,
            opt_: Dictionary<String, String>(),
            channelId: channelId,
            invideobranding: invideobranding
            )
        return c
    }
}

// // ...Call extension
extension WatermarksSetCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": The onBehalfOfContentOwner parameter
    // indicates that the authenticated user is acting on behalf of the
    // content owner specified in the parameter value. This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and get access to all their video and channel data, without
    // having to provide authentication credentials for each individual
    // channel. The actual CMS account that the user authenticates with
    // needs to be linked to the specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> WatermarksSetCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }
//TODO: convert media upload

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> WatermarksSetCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "watermarks/set"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        // TODO: convert body to JSON
        let body = ""
        let ctype = "application/json"
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["channelId"] = "\(self.channelId)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        // TODO: Swift Media upload goes here
        // TODO: Swift Media upload goes here
// TODO: convert to swift
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.POST, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(.decode(json), error)
        }
// TODO: convert to swift
    }
        // {
	//   "description": "Uploads a watermark image to YouTube and sets it for a channel.",
	//   "httpMethod": "POST",
	//   "id": "youtube.watermarks.set",
	//   "mediaUpload": {
	//     "accept": [
	//       "application/octet-stream",
	//       "image/jpeg",
	//       "image/png"
	//     ],
	//     "maxSize": "10MB",
	//     "protocols": {
	//       "resumable": {
	//         "multipart": true,
	//         "path": "/resumable/upload/youtube/v3/watermarks/set"
	//       },
	//       "simple": {
	//         "multipart": true,
	//         "path": "/upload/youtube/v3/watermarks/set"
	//       }
	//     }
	//   },
	//   "parameterOrder": [
	//     "channelId"
	//   ],
	//   "parameters": {
	//     "channelId": {
	//       "description": "The channelId parameter specifies a YouTube channel ID for which the watermark is being provided.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwner": {
	//       "description": "The onBehalfOfContentOwner parameter indicates that the authenticated user is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The actual CMS account that the user authenticates with needs to be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     }
	//   },
	//   "path": "watermarks/set",
	//   "request": {
	//     "$ref": "InvideoBranding"
	//   },
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtube.upload",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ],
	//   "supportsMediaUpload": true
	// }

}

// method id "youtube.watermarks.unset":
// meth generateCode
// // ...Call struct

struct WatermarksUnsetCall {
    let s: Service
    var opt_: [String: String]
    var channelId: String
}

// unset: Deletes a watermark.
// // ...Service extension
extension WatermarksService {
    func unset(channelId: String) -> WatermarksUnsetCall {
        var c = WatermarksUnsetCall(
            s: s,
            opt_: Dictionary<String, String>(),
            channelId: channelId
            )
        return c
    }
}

// // ...Call extension
extension WatermarksUnsetCall {

    // onBehalfOfContentOwner sets the optional parameter
    // "onBehalfOfContentOwner": The onBehalfOfContentOwner parameter
    // indicates that the authenticated user is acting on behalf of the
    // content owner specified in the parameter value. This parameter is
    // intended for YouTube content partners that own and manage many
    // different YouTube channels. It allows content owners to authenticate
    // once and get access to all their video and channel data, without
    // having to provide authentication credentials for each individual
    // channel. The actual CMS account that the user authenticates with
    // needs to be linked to the specified YouTube content owner.
    func onBehalfOfContentOwner(onBehalfOfContentOwner: String) -> WatermarksUnsetCall {
        c.opt_["onBehalfOfContentOwner"] = onBehalfOfContentOwner
        return c
    }

    // Fields allows partial responses to be retrieved.
    // See https://developers.google.com/gdata/docs/2.0/basics#PartialResponse
    // for more information.
    func fields(fields: Field...) -> WatermarksUnsetCall {
        var c = self
        c.opt_["fields"] = CombineFields(fields)
        return c
    }

    func Do(block: (error: NSError?) -> () ) {
        let basePath = self.s.BasePath
        let path = "watermarks/unset"
        let url = NSURL(string: basePath + path)!
        var manager = s.client
        var headers = manager.session.configuration.HTTPAdditionalHeaders ?? Dictionary<String, String>()
        var params = Dictionary<String, String>()
        params["alt"] = "json"
        params["channelId"] = "\(self.channelId)"
        if v = self.opt_["onBehalfOfContentOwner"] { params["onBehalfOfContentOwner"] = "\(v)" }
        if v = self.opt_["fields"] { params["fields"] = "\(v)" }
        headers["User-Agent"] = "google-api-swift-client/0.5"
        var req = self.client.request(.POST, url, body, parameters: params)
        req.repsonseJSON { (request, response, json, error) in
            block(.decode(json), error)
        }
    }
        // {
	//   "description": "Deletes a watermark.",
	//   "httpMethod": "POST",
	//   "id": "youtube.watermarks.unset",
	//   "parameterOrder": [
	//     "channelId"
	//   ],
	//   "parameters": {
	//     "channelId": {
	//       "description": "The channelId parameter specifies a YouTube channel ID for which the watermark is being unset.",
	//       "location": "query",
	//       "required": true,
	//       "type": "string"
	//     },
	//     "onBehalfOfContentOwner": {
	//       "description": "The onBehalfOfContentOwner parameter indicates that the authenticated user is acting on behalf of the content owner specified in the parameter value. This parameter is intended for YouTube content partners that own and manage many different YouTube channels. It allows content owners to authenticate once and get access to all their video and channel data, without having to provide authentication credentials for each individual channel. The actual CMS account that the user authenticates with needs to be linked to the specified YouTube content owner.",
	//       "location": "query",
	//       "type": "string"
	//     }
	//   },
	//   "path": "watermarks/unset",
	//   "scopes": [
	//     "https://www.googleapis.com/auth/youtube",
	//     "https://www.googleapis.com/auth/youtube.force-ssl",
	//     "https://www.googleapis.com/auth/youtubepartner"
	//   ]
	// }

}
