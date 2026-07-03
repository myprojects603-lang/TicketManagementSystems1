import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface Booking {
  bookingId: number;
  scheduleId: number;
  userId: number;
  passengerName: string;
  totalAmount: number;
  status: string;
  bookedAt: string;
  travelDate: string;
}

export interface BookingRequest {
  scheduleId: number;
  passengerName: string;
  numberOfSeats: number;
}

@Injectable({
  providedIn: 'root'
})
export class BookingService {
  private apiUrl = 'https://localhost:5001/api/booking';

  constructor(private http: HttpClient) { }

  getBookings(): Observable<Booking[]> {
    return this.http.get<Booking[]>(`${this.apiUrl}`);
  }

  getBooking(id: number): Observable<Booking> {
    return this.http.get<Booking>(`${this.apiUrl}/${id}`);
  }

  createBooking(request: BookingRequest): Observable<Booking> {
    return this.http.post<Booking>(`${this.apiUrl}/create`, request);
  }

  cancelBooking(id: number): Observable<void> {
    return this.http.put<void>(`${this.apiUrl}/cancel/${id}`, {});
  }

  getUserBookings(userId: number): Observable<Booking[]> {
    return this.http.get<Booking[]>(`${this.apiUrl}/user/${userId}`);
  }
}
