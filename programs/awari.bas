1 REM *** AWARI GAME BY GEOFF WYVILL, UNIV OF BRADFORD, ENGLAND
2 REM *** MODIFIED FOR BASIC-PLUS BY DAVE AHL, DIGITAL PDP-11/45 GROUP
5 DATA 0
6 GO TO 905 
10 DIM B(13),G(13),F(50)\READ N
15 FOR I=0 TO N-1\READ F(I)\NEXT I
20 PRINT \PRINT "GAME OF *** AWARI ***"
25 FOR I=0 TO 12\B(I)=3\NEXT I
30 C=0\F(N)=0\B(13)=0\B(6)=0
35 GOSUB 500 
40 PRINT "YOUR MOVE";\GOSUB 110 
45 IF E=0GO TO 80 
50 IF M<>H THEN 55 \GOSUB 100 
55 IF E=0GO TO 80 
60 PRINT "MY MOVE IS ";\GOSUB 800 
65 IF E=0GO TO 80 
70 IF M<>H THEN 75 \PRINT ",";\GOSUB 800 
75 IF E>0GO TO 35 
80 PRINT \PRINT "GAME OVER"
85 D=B(6)-B(13)\IF D>=0 THEN 90 \PRINT "I WIN BY";-D"POINTS"\GO TO 20 
90 N=N+1\IF D<>0 THEN 95 \PRINT "DRAWN GAME"\GO TO 20 
95 PRINT "YOU WIN BY"D"POINTS"\GO TO 20 
100 PRINT "AGAIN";
110 INPUT M\IF M>=7 THEN 120 \IF M<=0 THEN 120 \M=M-1\GO TO 130 
120 PRINT "ILLEGAL MOVE"\GO TO 100 
130 IF B(M)=0GO TO 120 
140 H=6\GOSUB 200 
150 GO TO 500 
200 K=M\GOSUB 600 
205 E=0\IF K>=6 THEN 210 \K=K-7
210 C=C+1\IF C>=9 THEN 215 \F(N)=F(N)*6+K
215 FOR I=0 TO 5\IF B(I)<>0 THEN 230 
220 NEXT I
225 RETURN
230 FOR I=7 TO 12\IF B(I)=0 THEN 235 \E=1\RETURN
235 NEXT I\RETURN
500 PRINT \PRINT "   ";
505 FOR I=12 TO 7 STEP -1\GOSUB 580 
510 NEXT I
515 PRINT \I=13\GOSUB 580 
520 PRINT ,"             ";\PRINT B(6)\PRINT "   ";
525 FOR I=0 TO 5\GOSUB 580 
530 NEXT I
535 PRINT \PRINT \RETURN
580 IF B(I)>=10 THEN 585 \PRINT " ";
585 PRINT B(I);\RETURN
600 P=B(M)\B(M)=0
605 FOR P=P TO 1 STEP -1\M=M+1\IF M<14 THEN 610 \M=M-14
610 B(M)=B(M)+1\NEXT P
615 IF B(M)<>1 THEN 620 \IF M=6 THEN 620 \IF M=13 THEN 620 
616 IF B(12-M)=0 THEN 620 \GO TO 625 
620 RETURN
625 B(H)=B(H)+B(12-M)+1\B(M)=0\B(12-M)=0\RETURN
800 D=-99\H=13
805 FOR I=0 TO 13\G(I)=B(I)\NEXT I
810 FOR J=7 TO 12\IF B(J)=0 THEN 885 
815 Q=0\M=J\GOSUB 600 
820 FOR I=0 TO 5\IF B(I)=0GO TO 845 
825 L=B(I)+I\R=0
830 IF L<=13 THEN 835 \L=L-14\R=1\GO TO 830 
835 IF B(L)<>0 THEN 840 \IF L=6 THEN 840 \IF L=13 THEN 840 \R=B(12-L)+R
840 IF R<=Q THEN 845 \Q=R
845 NEXT I
850 Q=B(13)-B(6)-Q\IF C>8GO TO 875 
855 K=J\IF K<=6 THEN 860 \K=K-7
860 FOR I=0 TO N-1\IF F(N)*6+K<>INT(F(I)/6^(7-C)+.1) THEN 870 \Q=Q-2
870 NEXT I
875 FOR I=0 TO 13\B(I)=G(I)\NEXT I
880 IF Q<D THEN 885 \A=J\D=Q
885 NEXT J
890 M=A\PRINT CHR$(42+M);\GO TO 200 
900 FOR I=0 TO N-1\PRINT F(I)\NEXT I
905 PRINT \PRINT "GAME OF AWARI (KALAH, BEANS)"\PRINT 
910 PRINT "WANT INSTRUCTIONS -- THEY'RE LONG (Y OR N)";\INPUT A$
911 IF A$="N" THEN 10 
915 PRINT "THE AWARI BOARD IS DIVIDED INTO 6 PITS ON MY SIDE ";
916 PRINT "AND 6 PITS ON"
920 PRINT "YOUR SIDE.  IN ADDITION, THERE ARE TWO SPECIAL PITS";
921 PRINT " AT EACH END: "
925 PRINT "MY HOME AND YOUR HOME."\PRINT 
930 PRINT "A MOVE IS MADE BY TAKING ALL OF THE BEANS FROM ANY";
931 PRINT " NON-EMPTY PIT"
935 PRINT "ON YOUR SIDE.  STARTING FROM THE PIT TO THE RIGHT OF THIS ONE,"
940 PRINT "THESE BEANS ARE 'SOWN' ONE IN EACH PIT WORKING AROUND";
941 PRINT " THE BOARD"
945 PRINT "COUNTER-CLOCKWISE."\PRINT 
950 GO TO 10 
999 END
