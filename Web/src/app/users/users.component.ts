import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator, MatSort, MatTableDataSource, MatDialog } from '@angular/material';
import { UsersDataSource, UsersItem } from './users-datasource';
import { UserServiceService } from './user-service.service';
import { EditComponent } from './edit/edit.component';

@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.css'],
})
export class UsersComponent implements OnInit {
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;
  dataSource: MatTableDataSource<UsersItem>;

  /** Columns displayed in the table. Columns IDs can be added, removed, or reordered. */
  displayedColumns = ['id', 'name', 'username', 'email', 'actions'];

  constructor(private service: UserServiceService,public dialog: MatDialog){}

  ngOnInit() {
    this.getUsers();
    this.dataSource = new MatTableDataSource();
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }
  getUsers(){
    this.service.getUsers().subscribe((res: any)=>{
      this.dataSource.data = res;
    })
  }
  addUser(){
    const dialogRef = this.dialog.open(EditComponent, {
      width: '450px',
      data: null
    });

    dialogRef.afterClosed().subscribe(result => {
      if(result){
        this.service.addUser(result).subscribe((res: any)=>{
          console.log("Usuario agregado");
          this.getUsers();
        })
      }
    });
  }
  editUser(user: any){
    const dialogRef = this.dialog.open(EditComponent, {
      width: '450px',
      data: user
    });

    dialogRef.afterClosed().subscribe(result => {
      if(result){
        this.service.updateUser(result).subscribe((res: any)=>{
          console.log("Usuario agregado");
          this.getUsers();
        })
      }
    });
  }
  deleteUser(id: any){
    this.service.deleteUser(id).subscribe(res=>{
      console.log("Usuario eliminado");
      this.getUsers();
    })
  }
  
  applyFilter(filterValue: string) {
    this.dataSource.filter = filterValue.trim().toLowerCase();

    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }
}
