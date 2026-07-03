import { Component, OnInit } from '@angular/core';
import { ManagementService } from '../management.service';

@Component({
  selector: 'app-hostesses',
  template: `
    <div class="content-wrapper">
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Hostesses Management</h1>
            </div>
            <div class="col-sm-6 text-right">
              <button (click)="addHostess()" class="btn btn-primary"><i class="fas fa-plus"></i> Add Hostess</button>
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
                  <th>Phone</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr *ngFor="let hostess of hostesses">
                  <td>{{ hostess.fullName }}</td>
                  <td>{{ hostess.phone }}</td>
                  <td><span class="badge badge-success" *ngIf="hostess.isActive">Active</span></td>
                  <td>
                    <button (click)="editHostess(hostess)" class="btn btn-sm btn-info"><i class="fas fa-edit"></i></button>
                    <button (click)="deleteHostess(hostess.hostessId)" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
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
export class HostessesComponent implements OnInit {
  hostesses: any[] = [];

  constructor(private service: ManagementService) { }

  ngOnInit() {
    this.loadHostesses();
  }

  loadHostesses() {
    this.service.getHostesses().subscribe(
      (data: any) => this.hostesses = data.data || [],
      (err: any) => console.error('Error loading hostesses:', err)
    );
  }

  addHostess() {
    alert('Add hostess form - TODO');
  }

  editHostess(hostess: any) {
    alert('Edit hostess form - TODO');
  }

  deleteHostess(hostessId: number) {
    if (confirm('Delete this hostess?')) {
      this.service.deleteHostess(hostessId).subscribe(
        () => this.loadHostesses(),
        (err: any) => alert('Error deleting hostess')
      );
    }
  }
}
