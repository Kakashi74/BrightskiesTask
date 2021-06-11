

import Foundation
import Alamofire

class APIRequest {
    
    static let shared = APIRequest()
    func getAPIData<T:Decodable>(baseRequest: BaseRequest,
                                  successBlock onSuccess: @escaping((Array<T>)->Void) ,
                                  failureBlock onFail: @escaping((String)->Void)){
        
        Alamofire.request(baseRequest.path, method: baseRequest.method == .get ? .get : .post,
                          parameters: baseRequest.parameters, encoding: JSONEncoding.default,
                          headers: baseRequest.headers).responseJSON { (response) in
                            guard let responseData = response.data else {return}
                            switch response.result{
                            case.success(_ ):
                                do{
                                    let decoder = JSONDecoder()
                                    let paresedData = try decoder.decode([T].self, from: responseData)
                                    onSuccess(paresedData)
                                }catch let error{
                                    print("decoded error", error)
                                }
                            case .failure(let error):
                                onFail(error.localizedDescription)
                            }
        }
    }
}

