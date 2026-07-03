import { Component, OnInit } from '@angular/core';
import { DashboardService } from './dashboard.service';

@Component({
  selector: 'app-dashboard',
  template: `
    <div class="content-wrapper">
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Dashboard</h1>
            </div>
          </div>
        </div>
      </section>

      <section class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-lg-3 col-6">
              <div class="small-box bg-info">
                <div class="inner">
                  <h3>{{ totalBuses }}</h3>
                  <p>Total Buses</p>
                </div>
                <div class="icon"><i class="ion ion-bag"></i></div>
              </div>
            </div>
            <div class="col-lg-3 col-6">
              <div class="small-box bg-success">
                <div class="inner">
                  <h3>{{ totalRoutes }}</h3>
                  <p>Total Routes</p>
                </div>
                <div class="icon"><i class="ion ion-stats-bars"></i></div>
              </div>
            </div>
            <div class="col-lg-3 col-6">
              <div class="small-box bg-warning">
                <div class="inner">
                  <h3>{{ totalBookings }}</h3>
                  <p>Total Bookings</p>
                </div>
                <div class="icon"><i class="ion ion-person-add"></i></div>
              </div>
            </div>
            <div class="col-lg-3 col-6">
              <div class="small-box bg-danger">
                <div class="inner">
                  <h3>${{ totalRevenue | number: '1.2-2' }}</h3>
                  <p>Total Revenue</p>
                </div>
                <div class="icon"><i class="ion ion-pie-graph"></i></div>
              </div>
            </div>
          </div>

          <div class="row mt-4">
            <div class="col-md-8">
              <div class="card">
                <div class="card-header with-border">
                  <h3 class="card-title">Recent Bookings</h3>
                </div>
                <div class="card-body">
                  <table class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <th>Booking ID</th>
                        <th>User</th>
                        <th>Amount</th>
                        <th>Status</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr *ngFor="let booking of recentBookings">
                        <td>{{ booking.bookingId }}</td>
                        <td>{{ booking.userName }}</td>
                        <td>${{ booking.totalAmount | number: '1.2-2' }}</td>
                        <td><span class="badge" [ngClass]="{'badge-success': booking.status === 'Confirmed', 'badge-warning': booking.status === 'Pending', 'badge-danger': booking.status === 'Cancelled'}">{{ booking.status }}</span></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card">
                <div class="card-header with-border">
                  <h3 class="card-title">Occupancy Statistics</h3>
                </div>
                <div class="card-body">
                  <div class="mb-3">
                    <strong>Average Occupancy Rate</strong>
                    <div class="progress">
                      <div class="progress-bar bg-success" role="progressbar" [style.width.%]="avgOccupancy"></div>
                    </div>
                    <small>{{ avgOccupancy }}%</small>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  `
})
export class DashboardComponent implements OnInit {
  totalBuses: number = 0;
  totalRoutes: number = 0;
  totalBookings: number = 0;
  totalRevenue: number = 0;
  avgOccupancy: number = 0;
  recentBookings: any[] = [];

  constructor(private dashboardService: DashboardService) { }

  ngOnInit() {
    this.loadSummary();
    this.loadRecentBookings();
  }

  loadSummary() {
    this.dashboardService.getSummary().subscribe(
      (data: any) => {
        if (data && data.data) {
          this.totalBuses = data.data.totalBuses || 0;
          this.totalRoutes = data.data.totalRoutes || 0;
          this.totalBookings = data.data.totalBookings || 0;
          this.totalRevenue = data.data.totalRevenue || 0;
          this.avgOccupancy = data.data.avgOccupancy || 0;
        }
      },
      (error: any) => console.error('Error loading summary:', error)
    );
  }

  loadRecentBookings() {
    this.dashboardService.getRecentBookings().subscribe(
      (data: any) => {
        if (data && data.data) {
          this.recentBookings = data.data;
        }
      },
      (error: any) => console.error('Error loading bookings:', error)
    );
  }
}
