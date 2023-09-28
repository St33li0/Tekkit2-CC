term.clear()

programs = {
    GeneratorControl

}

function install(all)
    header()
    if all == true then
        -- Run Install All to JTEK/
    elseif all == false then
        -- Run Menu for Install Choice
        menu(2)
    else
        --Run Error Script
        error("unknown")
    end
end

function menu(menu)
    -- Menu for choosing what to install
    if menu == 1 then
        header()
        while choice ~= "Y" and choice ~= "N" do
            clear(false,3)
            clear(false,4)
            writeScreen(1,3,"Would you like to install all programs? (Y/N)")
            term.setCursorPos(1,4)
            choice = read()
        end
        if choice == "Y" then
            install(true)
        else
            install (false)
        end
    elseif menu == 2 then
        header()
        print("Please choose the programs you would like to install")
        print("Enter the numbers for all programs you wish to add to the install")
        print("Format: 1,2,3,4")
        print()
        for i=1, #programs do
            write(i,". ",programs[i])
            term.setCursorPos(1,i+8)
        end
        choice = read()
        for number in string.gmatch(choice, '([^,]+)') do
            print(number)
        end
    end

end

function error(type)
    -- Run an error and restart the script
    header()
    if type == OutOfRange then
        print("Argument Out Of Range")
    elseif type == FileNotFound then
        print("File Not Found")
    elseif type == Format then
        print("Format Incorrect")
    elseif type == Timeout then
        print("Timed Out")
    else
        print("Encountered Unexpected Error")
    end
    print("Program will restart")
    os.sleep(4)
    runtime()
end

function header()
    -- JTEK Industries Header
    clear(true,1,1)
    print("JTEK Industries 2023")
    print()
end

function runtime()
    -- Runtime environment
    os.sleep(1)
    menu(1)
end

function writeDisplay(posX,posY,text)
    for i=1, #allDisplays do
        allDisplays[i].setCursorPos(posX,posY)
        allDisplays[i].write(text)
    end
end

function writeScreen(posX,posY,text)
    term.setCursorPos(posX,posY)
    write(text)
end

function clear(all,posY)
    if all == true then
        term.clear()
        term.setCursorPos(posX,posY)
    elseif all == false then
        term.setCursorPos(1,posY)
        term.clearLine()
    end
end

runtime()