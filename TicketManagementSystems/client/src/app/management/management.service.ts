import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class ManagementService {
  private base = environment.apiBaseUrl + '/api';
  constructor(private http: HttpClient) {}

  getBuses(): Observable<any> { return this.http.get(this.base + '/buses'); }
  createBus(data: any): Observable<any> { return this.http.post(this.base + '/buses', data); }
  updateBus(id: number, data: any): Observable<any> { return this.http.put(this.base + '/buses/' + id, data); }
  deleteBus(id: number): Observable<any> { return this.http.delete(this.base + '/buses/' + id); }

  getRoutes(): Observable<any> { return this.http.get(this.base + '/routes'); }
  createRoute(data: any): Observable<any> { return this.http.post(this.base + '/routes', data); }
  updateRoute(id: number, data: any): Observable<any> { return this.http.put(this.base + '/routes/' + id, data); }
  deleteRoute(id: number): Observable<any> { return this.http.delete(this.base + '/routes/' + id); }

  getSchedules(): Observable<any> { return this.http.get(this.base + '/schedules'); }
  createSchedule(data: any): Observable<any> { return this.http.post(this.base + '/schedules', data); }
  updateSchedule(id: number, data: any): Observable<any> { return this.http.put(this.base + '/schedules/' + id, data); }
  deleteSchedule(id: number): Observable<any> { return this.http.delete(this.base + '/schedules/' + id); }

  getDrivers(): Observable<any> { return this.http.get(this.base + '/drivers'); }
  createDriver(data: any): Observable<any> { return this.http.post(this.base + '/drivers', data); }
  updateDriver(id: number, data: any): Observable<any> { return this.http.put(this.base + '/drivers/' + id, data); }
  deleteDriver(id: number): Observable<any> { return this.http.delete(this.base + '/drivers/' + id); }

  getHostesses(): Observable<any> { return this.http.get(this.base + '/hostesses'); }
  createHostess(data: any): Observable<any> { return this.http.post(this.base + '/hostesses', data); }
  updateHostess(id: number, data: any): Observable<any> { return this.http.put(this.base + '/hostesses/' + id, data); }
  deleteHostess(id: number): Observable<any> { return this.http.delete(this.base + '/hostesses/' + id); }
}
