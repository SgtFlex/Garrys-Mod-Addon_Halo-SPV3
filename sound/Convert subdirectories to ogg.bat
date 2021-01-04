FOR /R %%A IN (*.wav) DO (
    IF NOT EXIST "%%~dA%%~pA%%~nA.ogg" C:\Users\sgtfl\Documents\ShareX\Tools\ffmpeg.exe -threads 8 -i "%%A" -vn -ac 2 -q:a 2 "%%~dA%%~pA%%~nA.ogg" && del "%%A"
)