import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './components/login/login.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { BusesComponent } from './components/buses/buses.component';
import { RoutesComponent } from './components/routes/routes.component';
import { SchedulesComponent } from './components/schedules/schedules.component';
import { BookingsComponent } from './components/bookings/bookings.component';
import { ReportsComponent } from './components/reports/reports.component';
import { AuthGuard } from './guards/auth.guard';

const routes: Routes = [
  { path: '', redirectTo: '/dashboard', pathMatch: 'full' },
  { path: 'login', component: LoginComponent },
  { path: 'dashboard', component: DashboardComponent, canActivate: [AuthGuard] },
  { path: 'buses', component: BusesComponent, canActivate: [AuthGuard] },
  { path: 'routes', component: RoutesComponent, canActivate: [AuthGuard] },
  { path: 'schedules', component: SchedulesComponent, canActivate: [AuthGuard] },
  { path: 'bookings', component: BookingsComponent, canActivate: [AuthGuard] },
  { path: 'reports', component: ReportsComponent, canActivate: [AuthGuard] }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
