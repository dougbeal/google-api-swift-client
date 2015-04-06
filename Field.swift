
public typealias Field =  String

public func CombineFields( fields: [Field] ) -> String {
    var strings = [String]()
    for (index, value) in enumerate(fields) {
        strings[index] = "\(value)"
    }
    return ",".join(strings)
}

    
