import { Component, OnInit, Inject } from '@angular/core';
import { FormGroup, FormControl, Validators, ValidatorFn, AbstractControl } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';

export const emailValidator: ValidatorFn = (control: AbstractControl): { [key: string]: any } | null => {
  let EMAIL_REGEXP = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/i;
  return EMAIL_REGEXP.test(control.value) ? null : { email: 'El formato de correo electrónico ingresado no es válido' };
};

@Component({
  selector: 'app-edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.css']
})
export class EditComponent implements OnInit {

  public title = 'Agregar contacto';
  public form = new FormGroup({
    id: new FormControl(0),
    name: new FormControl('', [Validators.required]),
    username: new FormControl(''),
    email: new FormControl('', [Validators.required, emailValidator]),
    enabled: new FormControl(1),
    createdAt: new FormControl(new Date())
  });

  constructor(
    public dialogRef: MatDialogRef<EditComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any
    ) {
      if(data) {
        this.form.setValue(data);
        this.title = 'Editar usuario';
      }
    }

  ngOnInit() {
  }
  onNoClick(): void {
    this.dialogRef.close();
  }
  saveUser(){
    this.dialogRef.close(this.form.value);
  }
}
