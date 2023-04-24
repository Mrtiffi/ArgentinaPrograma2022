import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SeparacionSeccionComponent } from './separacion-seccion.component';

describe('SeparacionSeccionComponent', () => {
  let component: SeparacionSeccionComponent;
  let fixture: ComponentFixture<SeparacionSeccionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SeparacionSeccionComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SeparacionSeccionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
