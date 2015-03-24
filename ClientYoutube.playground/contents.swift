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
import Argo
import Runes

public struct youtube {
    static let apiId = "youtube:v3"
    static let apiName = "youtube"
    static let apiVersion = "v3"
    static let basePath = "https://www.googleapis.com/youtube/v3/"
    static let baseURL = NSURL(string: youtube.basePath)!
    
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

struct AccessPolicy: JSONDecodable {
    // allowed: The value of allowed indicates whether the access to the
    // policy is allowed or denied by default.
    let allowed: Bool //  json:"allowed,omitempty"
    
    // exception: A list of region codes that identify countries where the
    // default policy do not apply.
    let exception: [String] //  json:"exception,omitempty"
    
    static func create (allowed: Bool, exception: [String]) -> AccessPolicy {
        return AccessPolicy(allowed: allowed, exception: exception)
    }
    
    static func decode (j: JSON) -> Decoded<AccessPolicy> {
        return AccessPolicy.create
            <*> j <| "allowed"
            <^> j <|| "exception"
    }
}


class JSONFileReader {
    class func JSON(fromFile file: String) -> AnyObject? {
        let path = NSBundle(forClass: self).pathForResource(file, ofType: "json")
        
        if path != nil {
            if let data = NSData(contentsOfFile: path!) {
                return NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil)
            }
        }
        
        return .None
    }
}
json = JSONFileReader.JSON(fromFile: "test.json")
AccessPolicy.decode(json)


