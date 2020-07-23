; BOSSdelta 0510 machine configuration file by SeeMeCNC
M550 PBOSS                                 ; Printer name
M555 P2                                    ; Gcode Output Type
M552 S1                                    ; Enable Wifi
M575 P1 B57600 S1                          ; PanelDue Comm Setup
G21                                        ; Work in millimeters
G90                                        ; Send absolute coordinates

M569 P0 S1                                 ; Drive 0 goes forwards (X)
M569 P1 S1                                 ; Drive 1 goes forwards (Y)
M569 P2 S1                                 ; Drive 2 goes forwards (Z)
M569 P3 S1                                 ; Drive 3 goes forwards (E0)
M569 P4 S1                                 ; Drive 4 goes forwards (E1)

M574 X2 Y2 Z2 S1                           ; set end stop configuration (all end stops at high end, active high)

M665 R260 L572.95 B252 H1200 X0 Y0 Z0      ; delta radius, diagonal rod length, printable radius and homed height
                                           ; Y X Z are tower angle offsets
M666 X0 Y0 Z0                              ; end stop offsets in mm

M350 X16 Y16 Z16 E16:16 I1                 ; Set 16x micro-stepping w/ Interpolation
M92 X200 Y200 Z200                         ; Set axis steps/mm
M92 E182.0:182.0                           ; Set extruder steps/mm

M906 X1700 Y1700 Z1700 E1300:1300 I50   ; Set motor currents (mA) and idle current %
M201 X500 Y500 Z2000 E5000              ; Accelerations (mm/s^2)
M203 X10000 Y10000 Z10000 E14000        ; Maximum speeds (mm/min)
M566 X200 Y200 Z300 E2000               ; Maximum instant speed changes mm/minute

M106 P0 H-1                                ; Part Cooling Fan
M106 P2 T50 S0.7 H1                        ; Heat sink fan

M307 H0 B0                                 ; Heated Bed (H2)
M305 P0 T100000 B4388 R4700 H30 L0         ; Bed thermistor

M305 P1 T100000 B4388 R4700 C7.06e-8 H30 L0         ; Hot end Thermistor
M563 P0 D0 H1                              ; Hot end (T0), drive (E0), heater (H1)
G10 P0 S0 R0                               ; Hot end operating and standby temperatures

;Dual Extrusion Code
M563 P1 D1 H1                              ; Hot end (T1), drive (E1), heater (H1)
G10 P1 S0 R0                               ; Hot end (1) operating and standby temperatures

;STRAIN GAGE PROBE
M558 P5 I0 A2 S0.05 R0.4 H20 F2500         ; Strain gauge probe settings
G31 P100 X0 Y0 Z-0.25                      ; Probe trigger and offset values
M557 R245 S30                              ; default bed mapping
M501                                       ; Load saved config values
T0                                         ; Select Tool 0

M500					   				   ; Save settings
M375					   		   	       ; Load height map




