//
//  LikeUnlikeResponseModel.swift
//  Stranger Chat App
//
//  Created by Bilal Ahmed on 01/03/2023.
//

import Foundation


struct LikeUnlikeResponseModel : Codable {
    
    
    
       let message : String
       let like : LikeUnlikeLikeModel?
       
       init(from decoder: Decoder) throws {
           
           let container = try decoder.container(keyedBy: CodingKeys.self)
           
          
           
           do{
               message = try container.decode(String?.self, forKey: .message) ?? ""
           } catch{
               message = ""
           }
           
           do{
               like = try container.decode(LikeUnlikeLikeModel?.self, forKey: .like) ?? nil
           } catch{
               like = nil
           }
           
           
           
       }
}


struct LikeUnlikeLikeModel : Codable {
    
    
    let _id: String
    let forId: String
    let createdAt: String
    let updatedAt: String
    let __v: Int
    let like: Bool
   
    
   
   

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
      
       
        do{
            _id = try container.decode(String?.self, forKey: ._id) ?? ""
        } catch{
            _id = ""
        }
        
        
         do{
             forId = try container.decode(String?.self, forKey: .forId) ?? ""
         } catch{
             forId = ""
         }
        
        
         do{
             createdAt = try container.decode(String?.self, forKey: .createdAt) ?? ""
         } catch{
             createdAt = ""
         }
        
        do{
            updatedAt = try container.decode(String?.self, forKey: .updatedAt) ?? ""
        } catch{
            updatedAt = ""
        }
        
        do{
            __v = try container.decode(Int?.self, forKey: .__v) ?? 0
        } catch{
            __v = 0
        }
        
        
        do{
            like = try container.decode(Bool?.self, forKey: .like) ?? false
        } catch{
            like = false
        }
        
        
      
      
    }
    
}



