import { Component, OnInit } from '@angular/core';
import { ManagementService } from '../management.service';

@Component({
  selector: 'app-routes',
  template: `
    <div class="content-wrapper">
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Routes Management</h1>
            </div>
            <div class="col-sm-6 text-right">
              <button (click)="addRoute()" class="btn btn-primary"><i class="fas fa-plus"></i> Add Route</button>
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
                  <th>Route Name</th>
                  <th>Start</th>
                  <th>End</th>
                  <th>Distance</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr *ngFor="let route of routes">
                  <td>{{ route.name }}</td>
                  <td>{{ route.startLocation }}</td>
                  <td>{{ route.endLocation }}</td>
                  <td>{{ route.distance }} km</td>
                  <td>
                    <button (click)="editRoute(route)" class="btn btn-sm btn-info"><i class="fas fa-edit"></i></button>
                    <button (click)="deleteRoute(route.routeId)" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
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
export class RoutesComponent implements OnInit {
  routes: any[] = [];

  constructor(private service: ManagementService) { }

  ngOnInit() {
    this.loadRoutes();
  }

  loadRoutes() {
    this.service.getRoutes().subscribe(
      (data: any) => this.routes = data.data || [],
      (err: any) => console.error('Error loading routes:', err)
    );
  }

  addRoute() {
    alert('Add route form - TODO');
  }

  editRoute(route: any) {
    alert('Edit route form - TODO for: ' + route.name);
  }

  deleteRoute(routeId: number) {
    if (confirm('Delete this route?')) {
      this.service.deleteRoute(routeId).subscribe(
        () => this.loadRoutes(),
        (err: any) => alert('Error deleting route')
      );
    }
  }
}
