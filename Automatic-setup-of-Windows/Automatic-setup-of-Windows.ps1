# Функция для создания радужного текста для каждой строки
function Write-RainbowTextLine {
    $text = $args[0]
    $colors = @('Red', 'Yellow', 'Green', 'Cyan', 'Blue', 'Magenta', 'White')
    $colorIndex = 0
    
    # Разделяем строку на отдельные символы и выводим с разными цветами
    foreach ($char in $text.ToCharArray()) {
        Write-Host -NoNewline $char -ForegroundColor $colors[$colorIndex]
        $colorIndex = ($colorIndex + 1) % $colors.Length
    }
    Write-Host
}

# Функция для печати каждой строки в отдельном цвете
function Write-ColorfulText {
    $text = $args[0]
    $colors = @('Red', 'Yellow', 'Green', 'Cyan', 'Blue', 'Magenta', 'White')
    $lines = $text -split "`n"  # Разделяем текст на строки
    
    $colorIndex = 0
    foreach ($line in $lines) {
        Write-Host $line -ForegroundColor $colors[$colorIndex]
        $colorIndex = ($colorIndex + 1) % $colors.Length
    }
}

# ASCII арт текста для "LuiTech"
$asciiArt1 = @"
 ____       _   _   _                           
/ ___|  ___| |_| |_(_)_ __   __ _   _   _ _ __  
\___ \ / _ \ __| __| | '_ \ / _` | | | | | '_ \ 
 ___) |  __/ |_| |_| | | | | (_| | | |_| | |_) |
|____/ \___|\__|\__|_|_|_|_|\__, |  \__,_| .__/ 
\ \      / (_)_ __   __| | _|___/     ___|_|    
 \ \ /\ / /| | '_ \ / _` |/ _ \ \ /\ / / __|    
  \ V  V / | | | | | (_| | (_) \ V  V /\__ \    
   \_/\_/  |_|_| |_|\__,_|\___/ \_/\_/ |___/      
"@

# ASCII арт второго лого (Windows)
$asciiArt2 = @"
         .-+***+=-                                      
        #%%%%%%@@@%-                                                                    
       +%%%%%%%%%%# +**=---=+##=                  
      .%%%%%%%%%%#-=@@@@@@@@@@#                   
      *%%%%%%%%%%* @@@@@@@@@@%=                   
      #+=-:::-=*#.=@@@@@@@@@@%*=+:                
     =*####**+-.. -#@@@@@@@@@@@#@@:   :-:         
    +@@@@@###### ...-=+++++@@@:=@@@#+*@@@=.:      
   .@@@@@@%###*=.:::::-+#%%#@@@@%@@@@@@@@@@@%     
   *@@@@@@@@%## ::---+#%%@@@#@%@%@@@=.  #@@@:     
  .@@@@@@@@@@%--***#%%%%@@@#%@@=@@@+    +@@@+     
  :=-..   .:+*.%%%%%%%%@@@= =@@@@@@#   =@@@@@=    
               =#%%%%%%%@@#+@@@*@@@@@%@@@@#.      
                  .::.. *#@@%=-   #@@%#%@@-       
                           .      .:=   .         
"@

# Печать первого логотипа (LuiTech) с цветными строками
Write-ColorfulText $asciiArt1

# Печать второго логотипа (Windows) с радужным цветом для каждой строки
Write-ColorfulText $asciiArt2

# Функция для запроса у пользователя, хочет ли он продолжить настройку Windows
$setupWindows = Read-Host "Let's start setting up Windows? (y/n):"

# Проверка выбора пользователя
if ($setupWindows -eq "n") {
    Write-Host "Windows setup has been cancelled."
    return
} else {
    Write-Host "Let's continue setting up Windows..."
}

