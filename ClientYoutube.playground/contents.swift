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
import Youtube


Youtube.New(Alamofire.Manager)
