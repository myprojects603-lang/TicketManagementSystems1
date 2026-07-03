import { Component, OnInit } from '@angular/core';
import { ReportService, ReportData } from '../../services/report.service';
import { BookingService, Booking } from '../../services/booking.service';
import { NotificationService } from '../../services/notification.service';
import { ChartConfiguration } from 'chart.js';

@Component({
  selector: 'app-reports',
  templateUrl: './reports.component.html',
  styleUrls: ['./reports.component.scss']
})
export class ReportsComponent implements OnInit {
  totalBookings = 0;
  confirmedBookings = 0;
  pendingBookings = 0;
  totalRevenue = 0;
  recentBookings: Booking[] = [];

  chartData: ChartConfiguration<'pie'>['data'] = {
    labels: ['Confirmed', 'Pending', 'Cancelled'],
    datasets: [{
      data: [0, 0, 0],
      backgroundColor: ['#28a745', '#ffc107', '#dc3545']
    }]
  };

  chartOptions: ChartConfiguration<'pie'>['options'] = {
    responsive: true,
    maintainAspectRatio: true
  };

  revenueChartData: ChartConfiguration<'line'>['data'] = {
    labels: [],
    datasets: [{
      label: 'Daily Revenue',
      data: [],
      borderColor: '#007bff',
      backgroundColor: 'rgba(0, 123, 255, 0.1)'
    }]
  };

  revenueChartOptions: ChartConfiguration<'line'>['options'] = {
    responsive: true,
    maintainAspectRatio: true
  };

  constructor(
    private reportService: ReportService,
    private bookingService: BookingService,
    private notificationService: NotificationService
  ) { }

  ngOnInit(): void {
    this.loadReports();
  }

  loadReports(): void {
    this.reportService.getDailyReports().subscribe({
      next: (data) => {
        this.processReportData(data);
      },
      error: (error) => {
        this.notificationService.error('Failed to load reports.');
      }
    });

    this.bookingService.getBookings().subscribe({
      next: (data) => {
        this.recentBookings = data.slice(0, 10);
        this.calculateStatistics(data);
      },
      error: (error) => {
        this.notificationService.error('Failed to load bookings.');
      }
    });
  }

  processReportData(data: ReportData[]): void {
    if (data.length > 0) {
      const labels = data.map(r => r.date);
      const revenues = data.map(r => r.totalRevenue);

      this.revenueChartData.labels = labels;
      this.revenueChartData.datasets[0].data = revenues;
    }
  }

  calculateStatistics(bookings: Booking[]): void {
    this.totalBookings = bookings.length;
    this.confirmedBookings = bookings.filter(b => b.status === 'Confirmed').length;
    this.pendingBookings = bookings.filter(b => b.status === 'Pending').length;
    const cancelledBookings = bookings.filter(b => b.status === 'Cancelled').length;
    this.totalRevenue = bookings.reduce((sum, b) => sum + b.totalAmount, 0);

    this.chartData.datasets[0].data = [this.confirmedBookings, this.pendingBookings, cancelledBookings];
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
