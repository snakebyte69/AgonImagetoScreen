   10 MODE 0
   20 X=0
   30 Y=1000
   40 L=1600
   50 infile=OPENIN "BIRD800X600.BIN"
   60 REM Colour Palette
   70 DIM REVLU%(64) : PROCloadLUT
   80 REM Plot Image to Screen Double Sized
   90 REPEAT
  100   byte=BGET#infile
  105   C%=REVLU%(byte AND &3F)
  110   GCOL 0,C%
  120   PLOT 69,X,Y
  130   PLOT 69,X+1,Y
  140   PLOT 69,X+1,Y-1
  150   X=X+2
  160   IF X=L THEN Y=Y-2 : X=0
  170 UNTIL EOF#infile
  180 CLOSE#0
  190 END
  200 REM Colour Palette Routine
  210 DEF PROCloadLUT
  220 REM Load the RGB Look up table
  230 REM REVLU%() is a reverse lookup table to get the colour
  240 LOCAL I%
  250 RESTORE 310
  260 FOR I%=0 TO 63
  270   READ REVLU%(I%)
  280 NEXT
  290 ENDPROC
  300 REM - RGB reverse map to colour
  310 DATA  0, 16,  4, 12, 17, 18, 19, 20,  2, 21,  6, 22, 10, 23, 24, 14
  320 DATA 25, 26, 27, 28, 29,  8, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39
  330 DATA  1, 40,  5, 41, 42, 43, 44, 45,  3, 46,  7, 47, 48, 49, 50, 51
  340 DATA  9, 52, 53, 13, 54, 55, 56, 57, 58, 59, 60, 61, 11, 62, 63, 15
