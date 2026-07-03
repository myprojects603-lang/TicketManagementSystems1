import { Component, OnInit } from '@angular/core';
import { AdminService } from './admin.service';

@Component({
  selector: 'app-admin',
  template: `
    <div class="content-wrapper">
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Administration</h1>
            </div>
          </div>
        </div>
      </section>

      <section class="content">
        <div class="row">
          <div class="col-md-4">
            <div class="card">
              <div class="card-header"><h3 class="card-title">User Management</h3></div>
              <div class="card-body">
                <p>Users: {{ userCount }}</p>
                <button (click)="manageUsers()" class="btn btn-primary btn-block"><i class="fas fa-users"></i> Manage Users</button>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card">
              <div class="card-header"><h3 class="card-title">Role Management</h3></div>
              <div class="card-body">
                <p>Roles: {{ roleCount }}</p>
                <button (click)="manageRoles()" class="btn btn-primary btn-block"><i class="fas fa-key"></i> Manage Roles</button>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card">
              <div class="card-header"><h3 class="card-title">Permission Management</h3></div>
              <div class="card-body">
                <p>Permissions: {{ permissionCount }}</p>
                <button (click)="managePermissions()" class="btn btn-primary btn-block"><i class="fas fa-lock"></i> Manage Permissions</button>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  `
})
export class AdminComponent implements OnInit {
  userCount: number = 0;
  roleCount: number = 0;
  permissionCount: number = 0;

  constructor(private service: AdminService) { }

  ngOnInit() {
    this.loadStats();
  }

  loadStats() {
    this.service.getStats().subscribe(
      (data: any) => {
        this.userCount = data.data?.userCount || 0;
        this.roleCount = data.data?.roleCount || 0;
        this.permissionCount = data.data?.permissionCount || 0;
      }
    );
  }

  manageUsers() {
    alert('User management form - TODO');
  }

  manageRoles() {
    alert('Role management form - TODO');
  }

  managePermissions() {
    alert('Permission management form - TODO');
  }
}
