import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { AppComponent } from './app.component';
import { LoginComponent } from './auth/login.component';
import { AuthService } from './auth/auth.service';
import { AuthInterceptor } from './auth/auth.interceptor';
import { AuthGuard } from './auth/auth.guard';
import { HeaderComponent } from './layout/header.component';
import { SidebarComponent } from './layout/sidebar.component';
import { FooterComponent } from './layout/footer.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { BusesComponent } from './management/buses/buses.component';
import { RoutesComponent } from './management/routes/routes.component';
import { SchedulesComponent } from './management/schedules/schedules.component';
import { DriversComponent } from './management/drivers/drivers.component';
import { HostessesComponent } from './management/hostesses/hostesses.component';
import { BookingsComponent } from './booking/bookings.component';
import { ReportsComponent } from './reports/reports.component';
import { AdminComponent } from './admin/admin.component';
import { AppRoutingModule } from './app-routing.module';

@NgModule({
  declarations: [
    AppComponent, LoginComponent, HeaderComponent, SidebarComponent, FooterComponent, DashboardComponent,
    BusesComponent, RoutesComponent, SchedulesComponent, DriversComponent, HostessesComponent,
    BookingsComponent, ReportsComponent, AdminComponent
  ],
  imports: [BrowserModule, HttpClientModule, FormsModule, AppRoutingModule],
  providers: [AuthService, AuthGuard, { provide: HTTP_INTERCEPTORS, useClass: AuthInterceptor, multi: true }],
  bootstrap: [AppComponent]
})
export class AppModule { }
