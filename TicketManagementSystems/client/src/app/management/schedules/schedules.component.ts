import { Component, OnInit } from '@angular/core';
import { ManagementService } from '../management.service';

@Component({
  selector: 'app-schedules',
  template: `
    <div class="content-wrapper">
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Schedules Management</h1>
            </div>
            <div class="col-sm-6 text-right">
              <button (click)="addSchedule()" class="btn btn-primary"><i class="fas fa-plus"></i> Add Schedule</button>
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
                  <th>Route</th>
                  <th>Bus</th>
                  <th>Departure</th>
                  <th>Arrival</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr *ngFor="let schedule of schedules">
                  <td>{{ schedule.routeName }}</td>
                  <td>{{ schedule.busNo }}</td>
                  <td>{{ schedule.departureTime | date:'short' }}</td>
                  <td>{{ schedule.arrivalTime | date:'short' }}</td>
                  <td><span class="badge badge-success">Active</span></td>
                  <td>
                    <button (click)="editSchedule(schedule)" class="btn btn-sm btn-info"><i class="fas fa-edit"></i></button>
                    <button (click)="deleteSchedule(schedule.scheduleId)" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
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
export class SchedulesComponent implements OnInit {
  schedules: any[] = [];

  constructor(private service: ManagementService) { }

  ngOnInit() {
    this.loadSchedules();
  }

  loadSchedules() {
    this.service.getSchedules().subscribe(
      (data: any) => this.schedules = data.data || [],
      (err: any) => console.error('Error loading schedules:', err)
    );
  }

  addSchedule() {
    alert('Add schedule form - TODO');
  }

  editSchedule(schedule: any) {
    alert('Edit schedule form - TODO');
  }

  deleteSchedule(scheduleId: number) {
    if (confirm('Delete this schedule?')) {
      this.service.deleteSchedule(scheduleId).subscribe(
        () => this.loadSchedules(),
        (err: any) => alert('Error deleting schedule')
      );
    }
  }
}
