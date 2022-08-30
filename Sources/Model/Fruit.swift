import Foundation

public struct Fruit: Decodable {
    
    public var id: Int
    
    public var name: String
    
    public var genus: String
    
    public var family: String
    
    public var order: String
    
    public var nutritions: NutritionInformation
    
    public init(id: Int, name: String, genus: String, family: String, order: String, nutritions: NutritionInformation) {
        self.id = id
        self.name = name
        self.genus = genus
        self.family = family
        self.order = order
        self.nutritions = nutritions
    }
    
}
