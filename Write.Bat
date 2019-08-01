echo off
echo Erace Start!
atprogram -t avrdragon  -i HVPP -d ATmega328P -l log.txt  chiperase
if  errorlevel 1 goto :err
echo Proram eeprom  Start!
atprogram -t avrdragon  -i HVPP -d ATmega328P -l logeeprom.txt  program -ee -f EEpromIntelHex.hex  --verify
if  errorlevel 1 goto :err
echo Program Start!
atprogram -t avrdragon  -i HVPP -d ATmega328P -l logrom.txt  program -f ProgramFlash.hex  --verify
if  errorlevel 1 goto :err
echo FUSE START!
atprogram -t avrdragon  -i HVPP -d ATmega328P -l logfuse.txt  write  -fs --values FFD1FF  --verify
if  errorlevel 1 goto :err
echo LOCK Start!
atprogram -t avrdragon  -i HVPP -d ATmega328P -l logfuse.txt  write  -lb --values c0 --verify
echo ALL PROECESS completed successfully..

goto :eof


:err
echo Error!!!!
echo Error!!!!
echo Error!!!!

:eof
echo on
pause

