
import Foundation
enum Method: String{
    case get = "get"
    case post = "post"
}

class BaseRequest{
    
    var path = Urls.imgBase.getUrl()
    var method = Method.get
    var headers:[String:String]?
    var parameters:[String:Any]?
    
    init(path:String, parameters: [String : Any]? = nil, headers: [String : String]? = nil) {
        self.path = path
        self.parameters = parameters
        self.headers = headers
    }
    
    init(path:String, method: Method, parameters: [String : Any]? = nil, headers: [String : String]? = nil) {
        self.path = path
        self.method = method
        self.parameters = parameters
        self.headers = headers
    }
    
    
    
}
