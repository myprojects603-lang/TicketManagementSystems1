import { Component } from '@angular/core';

@Component({
  selector: 'app-sidebar',
  template: `
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
      <a href="#" class="brand-link">
        <span class="brand-text font-weight-light">TicketAdmin</span>
      </a>
      <div class="sidebar">
        <nav class="mt-2">
          <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            <li class="nav-item">
              <a routerLink="/dashboard" routerLinkActive="active" class="nav-link"><i class="nav-icon fas fa-tachometer-alt"></i><p>Dashboard</p></a>
            </li>
            <li class="nav-item has-treeview">
              <a href="#" class="nav-link"><i class="nav-icon fas fa-list"></i><p>Management<i class="right fas fa-angle-left"></i></p></a>
              <ul class="nav nav-treeview" style="display: none;">
                <li class="nav-item"><a routerLink="/buses" routerLinkActive="active" class="nav-link"><i class="far fa-circle nav-icon"></i><p>Buses</p></a></li>
                <li class="nav-item"><a routerLink="/routes" routerLinkActive="active" class="nav-link"><i class="far fa-circle nav-icon"></i><p>Routes</p></a></li>
                <li class="nav-item"><a routerLink="/schedules" routerLinkActive="active" class="nav-link"><i class="far fa-circle nav-icon"></i><p>Schedules</p></a></li>
                <li class="nav-item"><a routerLink="/drivers" routerLinkActive="active" class="nav-link"><i class="far fa-circle nav-icon"></i><p>Drivers</p></a></li>
                <li class="nav-item"><a routerLink="/hostesses" routerLinkActive="active" class="nav-link"><i class="far fa-circle nav-icon"></i><p>Hostesses</p></a></li>
              </ul>
            </li>
            <li class="nav-item">
              <a routerLink="/bookings" routerLinkActive="active" class="nav-link"><i class="nav-icon fas fa-shopping-cart"></i><p>Bookings</p></a>
            </li>
            <li class="nav-item">
              <a routerLink="/reports" routerLinkActive="active" class="nav-link"><i class="nav-icon fas fa-chart-bar"></i><p>Reports</p></a>
            </li>
            <li class="nav-item">
              <a routerLink="/admin" routerLinkActive="active" class="nav-link"><i class="nav-icon fas fa-cog"></i><p>Administration</p></a>
            </li>
          </ul>
        </nav>
      </div>
    </aside>
  `
})
export class SidebarComponent { }
