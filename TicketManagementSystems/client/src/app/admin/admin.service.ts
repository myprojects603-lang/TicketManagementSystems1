import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class AdminService {
  private base = environment.apiBaseUrl + '/api';
  constructor(private http: HttpClient) {}

  getStats(): Observable<any> {
    return this.http.get(this.base + '/admin/stats');
  }

  getUsers(): Observable<any> {
    return this.http.get(this.base + '/users');
  }

  getRoles(): Observable<any> {
    return this.http.get(this.base + '/roles');
  }

  assignRoleToUser(userId: string, roleId: string): Observable<any> {
    return this.http.post(this.base + `/users/${userId}/roles/${roleId}`, {});
  }

  removeRoleFromUser(userId: string, roleId: string): Observable<any> {
    return this.http.delete(this.base + `/users/${userId}/roles/${roleId}`);
  }
}
