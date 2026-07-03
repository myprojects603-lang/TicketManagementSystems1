import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class ReportService {
  private base = environment.apiBaseUrl + '/api/reports';
  constructor(private http: HttpClient) {}

  getDailyReport(start: string, end: string): Observable<any> {
    return this.http.get(this.base + `/bookings/daily?start=${start}&end=${end}`);
  }

  getMonthlyReport(year: number): Observable<any> {
    return this.http.get(this.base + `/revenue/monthly?year=${year}`);
  }

  exportDailyExcel(start: string, end: string): Observable<Blob> {
    return this.http.get(this.base + `/bookings/daily/export?start=${start}&end=${end}&format=excel`, { responseType: 'blob' });
  }

  exportDailyPdf(start: string, end: string): Observable<Blob> {
    return this.http.get(this.base + `/bookings/daily/export?start=${start}&end=${end}&format=pdf`, { responseType: 'blob' });
  }
}
