struct GlossaryDTO : Codable{
var glossary : Glossary
}
struct Glossary : Codable{
    var title : String
    var glossDiv : GlossDiv
    enum CodingKeys: String, CodingKey {
        case title
        case glossDiv = "GlossDiv"
    }


}
struct GlossDiv : Codable{
    var title : String
    var glossList : GlossList
    enum CodingKeys: String, CodingKey {
        case title
        case glossList = "GlossList"
    }
    
}

struct GlossList : Codable{
    var glossEntry : GlossEntry
    enum CodingKeys: String, CodingKey {
        case glossEntry = "GlossEntry"
    }

}
struct GlossEntry : Codable{
    var id: String
    var sortAs: String
    var Glossterm: String
    var abbrev: String
    var glossDef : GlossDef

    enum CodingKeys: String, CodingKey {
        case id = "ID"
                case sortAs = "SortAs"
                case Glossterm = "GlossTerm"
                case abbrev = "Abbrev"
                case glossDef = "GlossDef"
    }

    
}
struct GlossDef : Codable{
    var para: String
    var glossSeealso: [String]

    enum CodingKeys: String, CodingKey {
        case para = "para"
                case glossSeealso = "GlossSeeAlso"
    }
}
