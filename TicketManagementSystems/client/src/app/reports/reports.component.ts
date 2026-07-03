import { Component, OnInit } from '@angular/core';
import { ReportService } from './report.service';

@Component({
  selector: 'app-reports',
  template: `
    <div class="content-wrapper">
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Reports</h1>
            </div>
          </div>
        </div>
      </section>

      <section class="content">
        <div class="row">
          <div class="col-md-6">
            <div class="card">
              <div class="card-header"><h3 class="card-title">Daily Bookings Report</h3></div>
              <div class="card-body">
                <div class="row mb-3">
                  <div class="col-md-5"><input type="date" [(ngModel)]="startDate" class="form-control"></div>
                  <div class="col-md-5"><input type="date" [(ngModel)]="endDate" class="form-control"></div>
                  <div class="col-md-2"><button (click)="loadDailyReport()" class="btn btn-primary btn-block">Load</button></div>
                </div>
                <div class="text-center">
                  <button (click)="exportDailyExcel()" class="btn btn-success btn-sm"><i class="fas fa-download"></i> Excel</button>
                  <button (click)="exportDailyPdf()" class="btn btn-danger btn-sm"><i class="fas fa-download"></i> PDF</button>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="card">
              <div class="card-header"><h3 class="card-title">Monthly Revenue Report</h3></div>
              <div class="card-body">
                <div class="row mb-3">
                  <div class="col-md-8"><input type="number" [(ngModel)]="year" placeholder="Year" class="form-control"></div>
                  <div class="col-md-4"><button (click)="loadMonthlyReport()" class="btn btn-primary btn-block">Load</button></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  `
})
export class ReportsComponent implements OnInit {
  startDate: string = '';
  endDate: string = '';
  year: number = new Date().getFullYear();

  constructor(private service: ReportService) { }

  ngOnInit() {
    const today = new Date();
    this.endDate = today.toISOString().split('T')[0];
    const start = new Date(today.setDate(today.getDate() - 30));
    this.startDate = start.toISOString().split('T')[0];
  }

  loadDailyReport() {
    this.service.getDailyReport(this.startDate, this.endDate).subscribe(
      (data: any) => console.log('Daily report:', data),
      (err: any) => alert('Error loading report')
    );
  }

  loadMonthlyReport() {
    this.service.getMonthlyReport(this.year).subscribe(
      (data: any) => console.log('Monthly report:', data),
      (err: any) => alert('Error loading report')
    );
  }

  exportDailyExcel() {
    this.service.exportDailyExcel(this.startDate, this.endDate).subscribe(
      (blob: Blob) => this.downloadFile(blob, 'daily_bookings.xlsx'),
      (err: any) => alert('Error exporting')
    );
  }

  exportDailyPdf() {
    this.service.exportDailyPdf(this.startDate, this.endDate).subscribe(
      (blob: Blob) => this.downloadFile(blob, 'daily_bookings.pdf'),
      (err: any) => alert('Error exporting')
    );
  }

  downloadFile(blob: Blob, filename: string) {
    const url = window.URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = filename;
    a.click();
    window.URL.revokeObjectURL(url);
  }
}
