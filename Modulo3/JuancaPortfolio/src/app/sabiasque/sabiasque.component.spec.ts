import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SabiasqueComponent } from './sabiasque.component';

describe('SabiasqueComponent', () => {
  let component: SabiasqueComponent;
  let fixture: ComponentFixture<SabiasqueComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SabiasqueComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SabiasqueComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
