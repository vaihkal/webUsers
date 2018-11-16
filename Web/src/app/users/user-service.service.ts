import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class UserServiceService {

  private api = "http://localhost:5000/api/Users/";

  constructor(private service: HttpClient) { }

  getUsers(){
    return this.service.get(this.api);
  }
  getUser(id: any){
    return this.service.get(this.api+id);
  }
  addUser(user: any){
    return this.service.post(this.api, user);
  }
  updateUser(user: any){
    return this.service.put(this.api+user.id, user);
  }
  deleteUser(id: any){
    return this.service.delete(this.api+id);
  }
}
