import { Component, OnInit } from '@angular/core';
import { BookingService } from './booking.service';

@Component({
  selector: 'app-bookings',
  template: `
    <div class="content-wrapper">
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Bookings</h1>
            </div>
            <div class="col-sm-6 text-right">
              <button (click)="newBooking()" class="btn btn-primary"><i class="fas fa-plus"></i> New Booking</button>
            </div>
          </div>
        </div>
      </section>

      <section class="content">
        <div class="card">
          <div class="card-body">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <th>Booking ID</th>
                  <th>User</th>
                  <th>Schedule</th>
                  <th>Amount</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr *ngFor="let booking of bookings">
                  <td>{{ booking.bookingId }}</td>
                  <td>{{ booking.userName }}</td>
                  <td>{{ booking.scheduleInfo }}</td>
                  <td>${{ booking.totalAmount | number:'1.2-2' }}</td>
                  <td><span [ngClass]="getStatusClass(booking.status)" class="badge">{{ booking.status }}</span></td>
                  <td>
                    <button *ngIf="booking.status !== 'Cancelled'" (click)="cancelBooking(booking.bookingId)" class="btn btn-sm btn-warning"><i class="fas fa-times"></i></button>
                    <button (click)="viewDetails(booking)" class="btn btn-sm btn-info"><i class="fas fa-eye"></i></button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </section>
    </div>
  `
})
export class BookingsComponent implements OnInit {
  bookings: any[] = [];

  constructor(private service: BookingService) { }

  ngOnInit() {
    this.loadBookings();
  }

  loadBookings() {
    this.service.getBookings().subscribe(
      (data: any) => this.bookings = data.data || [],
      (err: any) => console.error('Error loading bookings:', err)
    );
  }

  newBooking() {
    alert('New booking form - TODO');
  }

  cancelBooking(bookingId: string) {
    if (confirm('Cancel this booking?')) {
      this.service.cancelBooking(bookingId).subscribe(
        () => this.loadBookings(),
        (err: any) => alert('Error cancelling booking')
      );
    }
  }

  viewDetails(booking: any) {
    alert('Details for booking: ' + booking.bookingId);
  }

  getStatusClass(status: string): string {
    switch(status) {
      case 'Confirmed': return 'badge-success';
      case 'Pending': return 'badge-warning';
      case 'Cancelled': return 'badge-danger';
      default: return 'badge-secondary';
    }
  }
}
