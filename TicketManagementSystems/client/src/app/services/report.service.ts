import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface ReportData {
  date: string;
  totalBookings: number;
  totalRevenue: number;
  confirmedBookings: number;
  pendingBookings: number;
  cancelledBookings: number;
}

@Injectable({
  providedIn: 'root'
})
export class ReportService {
  private apiUrl = 'https://localhost:5001/api/reports';

  constructor(private http: HttpClient) { }

  getDailyReports(): Observable<ReportData[]> {
    return this.http.get<ReportData[]>(`${this.apiUrl}/bookings/daily`);
  }

  getMonthlyReports(): Observable<ReportData[]> {
    return this.http.get<ReportData[]>(`${this.apiUrl}/bookings/monthly`);
  }

  getRevenueReport(): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/revenue`);
  }

  getBookingStatistics(): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/statistics`);
  }
}
