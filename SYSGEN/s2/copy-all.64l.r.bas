10 PRINT "{clear}disk copy-all  jim butterfield" 
20 PRINT :PRINT "thanks to mr. butterfield for his giving" 
30 PRINT "{up}us permission to use this program.":PRINT  
40 PRINT "capability to copy to/from drives 2-10" 
45 PRINT "and pause-on-file-exists feature" 
50 PRINT "added by fiscal information, inc.":PRINT  
60 PRINT "(copies 232 files, maximum.)":PRINT :PRINT  
70 A$="!jim butterfield!":A$=A$+A$+A$:A$=A$+A$+A$+A$+A$ 
80 P$="" 
90 DIM L2(600),L1%(600),N$(600),T%(600),T$(4) 
100 DATA XXX,SEQ,PRG,USR,REL 
110 FOR J=0 TO 4:READ T$(J):NEXT J 
120 INPUT "from unit  8{left}{left}{left}";F 
130 GOSUB 860 
140 F$=D$ 
150 F1=9:IF F=9 THEN F1=8 
160 TU$="to unit   "+RIGHT$(STR$(F1),1)+"{left}{left}{left}":PRINT TU$; 
170 INPUT T 
180 GOSUB 860:T$=D$:IF T=F AND F$=T$ THEN RUN  
190 RP$="":N=0:CLOSE 1:CLOSE 15:OPEN 15,F,15:PRINT#15,"i"+F$ 
200 GOSUB 900:IF E THEN STOP: GOTO 190 
210 PRINT "skip (s) or pause (p) " 
220 INPUT " on pre-existing files   p{left}{left}{left}";E3$ 
230 E3=(E3$="s"):PRINT  
240 Z=90:INPUT "pattern  *{left}{left}{left}";P$ 
250 P$="xxx"+LEFT$(P$+"{$a0}{$a0}{$a0}{$a0}{$a0}{$a0}{$a0}{$a0}{$a0}{$a0}{$a0}{$a0}{$a0}{$a0}{$a0}",16) 
260 PRINT "hold down 'y' or 'n' key to select" 
270 PRINT "programs to be copied..." 
280 OPEN 1,F,3,"$"+F$ 
290 GOSUB 900:IF E THEN STOP: GOTO 190 
300 SYS 4864 
310 R=255: GOTO 330 
320 SYS 4953 
330 FOR J=16 TO 2 STEP -1:IF ASC(MID$(A$,J+3))=160 THEN NEXT J 
340 N$=MID$(A$,4,J) 
350 T9=ASC(A$)-128:IF T9<1 OR T9>4 GOTO 460 
360 L1%=ASC(MID$(A$,22)) 
370 L2=ASC(MID$(A$,29))+ASC(MID$(A$,30))*256 
380 PRINT MID$(A$,4,16);" ";T$(T9) 
390 P=PEEK(203) AND R 
400 GET Z$:IF Z$="" AND P<064 GOTO 440 
410 IF Z$="y" OR Z$="n" THEN Z=ASC(Z$):R=255: GOTO 440 
420 IF Z$=CHR$(13) THEN R=0: GOTO 440 
430 GOTO 400 
440 IF Z<80 THEN PRINT "{up}                     {up}": GOTO 460 
450 N=N+1:L2(N)=L2:N$(N)=N$:T%(N)=T9:L1%(N)=L1% 
460 IF ST=0 AND N<232 GOTO 320 
470 CLOSE 1:CLOSE 15:PRINT " * * * * *" 
480 IF N=0 THEN PRINT "* no programs *": GOTO 830 
490 FOR J=1 TO N 
500 L2=L2(J):T%=T%(J):IF L>L2 GOTO 670 
510 IF Q=0 GOTO 550 
520 PRINT "*** output disk full" 
530 INPUT "do you have a new one";Z$ 
540 IF ASC(Z$)<>89 THEN END  
550 CLOSE 15:OPEN 15,T,15:INPUT "want to new the output disk  n{left}{left}{left}";Z$ 
560 IF ASC(Z$)<>89 GOTO 600 
570 INPUT "disk name,id";X$,Y$ 
580 PRINT#15,"n"+T$+":"+X$+","+Y$ 
590 GOSUB 900:IF E THEN STOP: GOTO 550 
600 PRINT#15,"i"+T$:OPEN 1,T,0,"$"+T$+":!#$%&" 
610 GOSUB 900:IF E THEN STOP: GOTO 550 
620 GOSUB 930:GOSUB 930:Q=Q+1 
630 GET #1,X$:IF X$<>"" GOTO 630 
640 GOSUB 930 
650 L=X+Y*256:PRINT "(";L;"blocks free )" 
660 CLOSE 1:CLOSE 15: GOTO 500 
670 OPEN 14,F,15:OPEN 15,T,15 
680 PRINT LEFT$(N$(J)+"                    ",21); 
690 OPEN 3,F,3,F$+":"+N$(J)+","+T$(T%) 
700 GOSUB 890:IF E THEN PRINT "** ";E$;E: GOTO 810 
710 IF T%=4 THEN OPEN 4,T,4,T$+":"+N$(J)+",l,"+CHR$(L1%(J)): GOTO 730 
720 OPEN 4,T,4,RP$+T$+":"+N$(J)+","+T$(T%)+",w":RP=(RP$="@"):RP$="" 
730 L=L-L2:GOSUB 900:IF E=0 OR RP THEN E=0:RP=0: GOTO 770 
732 IF E THEN PRINT "*** ";E$;E:IF E<>63 OR E3 THEN GOTO 810 
740 IF E=63 THEN INPUT "replace it (y/n)  n{left}{left}{left}";RP$ 
750 IF RP$="y" THEN RP$="@":CLOSE 4:L=L+L2: GOTO 720 
760 RP$="": GOTO 810 
770 IF T%=4 THEN SYS 5170:GOSUB 890: GOTO 790 
780 SYS 5151 
790 N$(J)="":GOSUB 900:IF E THEN PRINT "**** ";E$;E: GOTO 810 
800 PRINT "{up}" 
810 CLOSE 4:CLOSE 3:CLOSE 15:CLOSE 14 
820 NEXT J 
830 X=FRE(0):INPUT "another input disk ready";Z$ 
840 IF ASC(Z$)=89 GOTO 190 
850 END  
860 INPUT "drive  0{left}{left}{left}";D 
870 IF D*D>100 GOTO 860 
880 D$=STR$(D):RETURN 
890 INPUT#14,E,E$,E1,E2: GOTO 910 
900 INPUT#15,E,E$,E1,E2 
910 IF E=0 THEN E=(ST AND 191):E$="*st*" 
920 RETURN 
930 GET #1,X$ 
940 GET #1,X$ 
950 GET #1,X$ 
960 X=ASC(X$+CHR$(0)) 
970 GET #1,X$:Y=ASC(X$+CHR$(0)) 
980 RETURN 
