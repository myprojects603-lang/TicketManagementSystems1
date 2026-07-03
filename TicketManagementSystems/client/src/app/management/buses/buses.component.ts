import { Component, OnInit } from '@angular/core';
import { ManagementService } from '../management.service';

@Component({
  selector: 'app-buses',
  template: `
    <div class="content-wrapper">
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Buses Management</h1>
            </div>
            <div class="col-sm-6 text-right">
              <button (click)="addBus()" class="btn btn-primary"><i class="fas fa-plus"></i> Add Bus</button>
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
                  <th>Bus No</th>
                  <th>Model</th>
                  <th>Capacity</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr *ngFor="let bus of buses">
                  <td>{{ bus.busNo }}</td>
                  <td>{{ bus.model }}</td>
                  <td>{{ bus.capacity }}</td>
                  <td><span class="badge badge-success" *ngIf="bus.isActive">Active</span><span class="badge badge-danger" *ngIf="!bus.isActive">Inactive</span></td>
                  <td>
                    <button (click)="editBus(bus)" class="btn btn-sm btn-info"><i class="fas fa-edit"></i></button>
                    <button (click)="deleteBus(bus.busId)" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
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
export class BusesComponent implements OnInit {
  buses: any[] = [];

  constructor(private service: ManagementService) { }

  ngOnInit() {
    this.loadBuses();
  }

  loadBuses() {
    this.service.getBuses().subscribe(
      (data: any) => this.buses = data.data || [],
      (err: any) => console.error('Error loading buses:', err)
    );
  }

  addBus() {
    alert('Add bus form - TODO');
  }

  editBus(bus: any) {
    alert('Edit bus form - TODO for: ' + bus.busNo);
  }

  deleteBus(busId: number) {
    if (confirm('Delete this bus?')) {
      this.service.deleteBus(busId).subscribe(
        () => this.loadBuses(),
        (err: any) => alert('Error deleting bus')
      );
    }
  }
}
