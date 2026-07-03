import { Component, OnInit } from '@angular/core';
import { BookingService, Booking } from '../../services/booking.service';
import { NotificationService } from '../../services/notification.service';

@Component({
  selector: 'app-bookings',
  templateUrl: './bookings.component.html',
  styleUrls: ['./bookings.component.scss']
})
export class BookingsComponent implements OnInit {
  bookings: Booking[] = [];
  selectedBooking: Booking | null = null;
  loading = false;

  constructor(
    private bookingService: BookingService,
    private notificationService: NotificationService
  ) { }

  ngOnInit(): void {
    this.loadBookings();
  }

  loadBookings(): void {
    this.loading = true;
    this.bookingService.getBookings().subscribe({
      next: (data) => {
        this.bookings = data;
        this.loading = false;
      },
      error: (error) => {
        this.notificationService.error('Failed to load bookings.');
        this.loading = false;
      }
    });
  }

  openSearchModal(): void {
    this.notificationService.info('Search schedules modal will open here.');
  }

  viewBooking(booking: Booking): void {
    this.selectedBooking = booking;
    const modal = document.getElementById('bookingDetailsModal') as any;
    if (modal) {
      modal.style.display = 'block';
    }
  }

  closeModal(): void {
    this.selectedBooking = null;
    const modal = document.getElementById('bookingDetailsModal') as any;
    if (modal) {
      modal.style.display = 'none';
    }
  }

  cancelBookingConfirm(bookingId: number): void {
    if (confirm('Are you sure you want to cancel this booking?')) {
      this.bookingService.cancelBooking(bookingId).subscribe({
        next: () => {
          this.notificationService.success('Booking cancelled successfully!');
          this.loadBookings();
        },
        error: () => {
          this.notificationService.error('Failed to cancel booking.');
        }
      });
    }
  }

  getBadgeClass(status: string): string {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return 'badge-success';
      case 'pending':
        return 'badge-warning';
      case 'cancelled':
        return 'badge-danger';
      default:
        return 'badge-secondary';
    }
  }
}
