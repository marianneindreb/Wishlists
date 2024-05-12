import Foundation

struct UnsplashModel: Identifiable, Decodable {
    let id: String
    let altDescription: String?
    let imageUrl: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        altDescription = try container.decodeIfPresent(String.self, forKey: .altDescription)
        let urlsContainer = try container.nestedContainer(keyedBy: UrlKeys.self, forKey: .urls)
        imageUrl = try urlsContainer.decode(String.self, forKey: .regular)
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case altDescription = "alt_description"
        case urls
    }
    
    private enum UrlKeys: String, CodingKey {
        case regular
    }
}

struct UnsplashResponse: Decodable {
    let photos: [UnsplashModel]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        photos = try container.decode([UnsplashModel].self, forKey: .results)
    }
    
    private enum CodingKeys: String, CodingKey {
        case results
    }
}
