import { Component, OnInit } from '@angular/core';
import { ManagementService } from '../management.service';

@Component({
  selector: 'app-drivers',
  template: `
    <div class="content-wrapper">
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Drivers Management</h1>
            </div>
            <div class="col-sm-6 text-right">
              <button (click)="addDriver()" class="btn btn-primary"><i class="fas fa-plus"></i> Add Driver</button>
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
                  <th>Name</th>
                  <th>License No</th>
                  <th>Phone</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr *ngFor="let driver of drivers">
                  <td>{{ driver.fullName }}</td>
                  <td>{{ driver.licenseNumber }}</td>
                  <td>{{ driver.phone }}</td>
                  <td><span class="badge badge-success" *ngIf="driver.isActive">Active</span></td>
                  <td>
                    <button (click)="editDriver(driver)" class="btn btn-sm btn-info"><i class="fas fa-edit"></i></button>
                    <button (click)="deleteDriver(driver.driverId)" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
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
export class DriversComponent implements OnInit {
  drivers: any[] = [];

  constructor(private service: ManagementService) { }

  ngOnInit() {
    this.loadDrivers();
  }

  loadDrivers() {
    this.service.getDrivers().subscribe(
      (data: any) => this.drivers = data.data || [],
      (err: any) => console.error('Error loading drivers:', err)
    );
  }

  addDriver() {
    alert('Add driver form - TODO');
  }

  editDriver(driver: any) {
    alert('Edit driver form - TODO');
  }

  deleteDriver(driverId: number) {
    if (confirm('Delete this driver?')) {
      this.service.deleteDriver(driverId).subscribe(
        () => this.loadDrivers(),
        (err: any) => alert('Error deleting driver')
      );
    }
  }
}
