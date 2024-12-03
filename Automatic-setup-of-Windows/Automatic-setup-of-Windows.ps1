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

# Функция для отображения прогресс-бара в терминале
function Show-ProgressBar {
    param (
        [int]$totalTime = 15,  # Время работы прогресс-бара по умолчанию
        [string]$message = "System preparation..."  # Сообщение для прогресс-бара
    )
    
    $startTime = Get-Date
    $endTime = $startTime.AddSeconds($totalTime)

    Write-Host "$message" -NoNewline  # Печатаем сообщение, не переходя на новую строку
    Write-Host ""  # Переходим на новую строку

    # Показать прогресс
    while ((Get-Date) -lt $endTime) {
        # Рассчитываем прогресс
        $progress = ((Get-Date) - $startTime).TotalSeconds / $totalTime * 100
        $barLength = 50  # Длина прогресс-бара (50 символов)
        $progressChars = [math]::Floor($progress / 2)  # Рассчитываем, сколько символов заполнено

        # Определяем цвет для символов # в зависимости от прогресса
        if ($progress -le 30) {
            $color = "Red"  # Если прогресс до 30%, цвет красный
        } elseif ($progress -le 60) {
            $color = "DarkYellow"  # Если прогресс от 30% до 60%, цвет оранжевый (используем DarkYellow)
        } else {
            $color = "Green"  # Если прогресс от 60% до 100%, цвет зеленый
        }

        # Создаём строку с прогрессом (заполнение баров идет слева направо)
        $progressBar = ("#" * $progressChars) + ("-" * ($barLength - $progressChars))

        # Печатаем прогресс с соответствующим цветом
        Write-Host -NoNewline "`r"
        Write-Host -ForegroundColor $color "$($progressBar) $([math]::Floor($progress))%" -NoNewline

        Start-Sleep -Seconds 1
    }

    Write-Host "`nCompleted!"  # Заключительное сообщение
}

# Функция для запроса у пользователя, хочет ли он продолжить настройку Windows
$setupWindows = Read-Host "Let's start setting up Windows? (y/n):"

# Проверка выбора пользователя
if ($setupWindows -eq "n") {
    Write-Host "Windows setup has been cancelled."
    Show-ProgressBar -totalTime 5 -message "Ending process..."  # Прогресс-бар при отмене
} else {
    Write-Host "Let's continue setting up Windows..."
    Show-ProgressBar -totalTime 10 -message "System preparation..."  # Прогресс-бар при продолжении настройки
}
