//
//  getProfileResponseModel.swift
//  cars conneted
//
//  Created by Sohaib Sajjad on 12/01/2023.
//

import Foundation


struct getProfileResponseModel : Codable {
    
    
 
    let message : String
    let docs: getProfileDocsModel?
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
       
        
        do{
            message = try container.decode(String?.self, forKey: .message) ?? ""
        } catch{
            message = ""
        }
        
        do{
            docs = try container.decode(getProfileDocsModel?.self, forKey: .docs) ?? nil
        } catch{
            docs = nil
        }
        
        
        
    }
    
}


struct getProfileDocsModel : Codable {
    
    
    let _id: String
    let email: String
    let createdAt: String
    let updatedAt: String
    let __v: Int
    let age: Int
    let gender: String
    let interest: String
    let nickName: String
    let profileImage: String
    
    
   

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
      
       
        do{
            _id = try container.decode(String?.self, forKey: ._id) ?? ""
        } catch{
            _id = ""
        }
        
        
         do{
             email = try container.decode(String?.self, forKey: .email) ?? ""
         } catch{
             email = ""
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
            age = try container.decode(Int?.self, forKey: .age) ?? 0
        } catch{
            age = 0
        }
        
        
        do{
            gender = try container.decode(String?.self, forKey: .gender) ?? ""
        } catch{
            gender = ""
        }
        
        
        do{
            interest = try container.decode(String?.self, forKey: .interest) ?? ""
        } catch{
            interest = ""
        }
        
        do{
            nickName = try container.decode(String?.self, forKey: .nickName) ?? ""
        } catch{
            nickName = ""
        }
        
        do{
            profileImage = try container.decode(String?.self, forKey: .profileImage) ?? ""
        } catch{
            profileImage = ""
        }
        
      
    }
    
}




