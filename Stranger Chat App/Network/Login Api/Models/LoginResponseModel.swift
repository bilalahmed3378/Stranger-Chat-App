//
//  LoginResponseModel.swift
//  cars conneted
//
//  Created by Bilal Ahmed on 28/02/2023.
//

import Foundation


struct LoginResponseModel : Codable {
    
    
  
    let message : String
    let docs : LoginDocsModel?
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
      
        do{
            message = try container.decode(String?.self, forKey: .message) ?? ""
        } catch{
            message = ""
        }
        
        do{
            docs = try container.decode(LoginDocsModel?.self, forKey: .docs) ?? nil
        } catch{
            docs = nil
        }
        
    }
    
}


struct LoginDocsModel : Codable {
    
    
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
    let emailVerified : Bool
    let profileSetup : Bool
   

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
      
        do{
            emailVerified = try container.decode(Bool?.self, forKey: .emailVerified) ?? false
        } catch{
            emailVerified = false
        }
        
        
         do{
             profileSetup = try container.decode(Bool?.self, forKey: .profileSetup) ?? false
         } catch{
             profileSetup = false
         }
       
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



