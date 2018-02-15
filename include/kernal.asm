
	CINT   =$FF81 ;(65371, $FF5B) initialize screen editor and video chip
	IOINIT =$FF84 ;(64931, $FDA3) initialize I/O devices
	RAMTAS =$FF87 ;(64848, $FD50) initialize RAM, tape buffer, screen
	RESTOR =$FF8A ;(64789, $FD15) restore default I/O vectors
	VECTOR =$FF8D ;(64794, $FD1A) read/set I/O vector table
	SETMSG =$FF90 ;(65048, $FE18) set Kernal message control flag
	SECOND =$FF93 ;(60857, $EDB9) send secondary address after LISTEN
	TKSA   =$FF96 ;(60871, $EDC7) send secondary address after TALK
	MEMTOP =$FF99 ;(65061, $FE25) read/set top of memory pointer
	MEMBOT =$FF9C ;(65076, $FE34) read/set bottom of memory pointer
	SCNKEY =$FF9F ;(60039, $EA87) scan the keyboard
	SETTMO =$FFA2 ;(65057, $FE21) set time-out flag for IEEE bus
	IECIN  =$FFA5 ;(60947, $FE13) input byte from serial bus
	CIOUT  =$FFA8 ;(60893, $EDDD) output byte to serial bus
	UNTLK  =$FFAB ;(60911, $EDEF) command serial bus device to UNTALK
	UNLSN  =$FFAE ;(60926, $EDFE) command serial bus device to UNLISTEN
	LISTEN =$FFB1 ;(60684, $ED0C) command serial bus device to LISTEN
	TALK   =$FFB4 ;(60681, $ED09) command serial bus device to TALK
	READST =$FFB7 ;(65031, $FE07) read I/O status word
	SETLFS =$FFBA ;(65024, $FE00) set logical file parameters
	SETNAM =$FFBD ;(65017, $FDF9) set filename parameters
	OPEN   =$FFC0 ;(via 794 ($31A) to 62282, $F34A) open a logical file
	CLOSE  =$FFC3 ;(via 796 ($31C) to 62097, $F291) close a logical file
	CHKIN  =$FFC6 ;(via 798 ($31E) to 61966, $F20E) define an input channel
	CHKOUT =$FFC9 ;(via 800 ($320) to 62032, $F250) define an output channel
	CLRCHN =$FFCC ;(via 802 ($322) to 62259, $F333) restore default devices
	CHRIN  =$FFCF ;(via 804 ($324) to 61783, $F157) input a character
	CHROUT =$FFD2 ;(via 806 ($326) to 61898, $F1CA) output a character
	LOAD   =$FFD5 ;(via 816 ($330) to 62622, $F49E) load from device
	SAVE   =$FFD8 ;(via 818 ($332) to 62941, $F5DD) save to a device
	SETTIM =$FFDB ;(63204, $F6E4) set the software clock
	RDTIM  =$FFDE ;(63197, $F6DD) read the software clock
	STOP   =$FFE1 ;(via 808 ($328) to 63213, $F6ED) check the STOP key
	GETIN  =$FFE4 ;(via 810 ($32A) to 61758, $F13E) get a character
	CLALL  =$FFE7 ;(via 812 ($32C) to 62255, $F32F) close all files
	UDTIM  =$FFEA ;(63131, $F69B) update the software clock
	SCREEN =$FFED ;(58629, $E505) read number of screen rows and columns
	PLOT   =$FFF0 ;(58634, $E50A) read/set position of cursor on screen
	IOBASE =$FFF3 ;(58624, $E500) read base address of I/O devices
	
	NMI_LO		=	$FFFA
	NMI_HI		=	$FFFB
	COLDSTART_LO	= 	$FFFC
	COLDSTART_HI	= 	$FFFD
	IRQ_LO		=	$FFFE
	IRQ_HI		=	$FFFF