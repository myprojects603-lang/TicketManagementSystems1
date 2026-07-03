import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class BookingService {
  private base = environment.apiBaseUrl + '/api/booking';
  constructor(private http: HttpClient) {}

  getBookings(): Observable<any> {
    return this.http.get(this.base);
  }

  createBooking(data: any): Observable<any> {
    return this.http.post(this.base + '/create', data);
  }

  cancelBooking(bookingId: string): Observable<any> {
    return this.http.post(environment.apiBaseUrl + '/api/cancellation/' + bookingId, {});
  }

  getBookingDetails(bookingId: string): Observable<any> {
    return this.http.get(this.base + '/' + bookingId);
  }
}
