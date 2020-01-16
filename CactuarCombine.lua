DIR = 'CactuarCombine'

minicact = Pattern(DIR .. '/MiniCact.png')
gigacact = Pattern(DIR .. '/GigaCact.png')
kingcact = Pattern(DIR .. '/KingCact.png')
fusebtn = Pattern(DIR .. '/FuseBtn.png')
emptybase = Pattern(DIR .. '/EmptyBase.png')
okbtn = Pattern(DIR .. '/OKBtn.png')
skipbtnen = Pattern(DIR .. '/SkipButtonEnabled.png')
skipbtndis = Pattern(DIR .. '/SkipButtonDisabled.png')
backbtn = Pattern(DIR .. '/BackBtn.png')
enhanceunits = Pattern(DIR .. '/EnhanceUnits.png')

screenheight = 1280
screenwidth = 720
middleLeft = Location(50, screenheight / 2)
middleRight = Location(screenwidth - 50, screenheight / 2)
bottomRegion = Region(0, 780, 720, 500)
bottomLeftRegion = Region(0, 780, 360, 500)
bottomMiddleRegion = Region(240, 780, 240, 500)
middleRegion = Region(0, 400, 720, 480)
topRegion = Region(0, 0, 720, 400)

cactuarRegion = Region(0, 350, 300, 250)

state = "selectbase"
cactuar = minicact

combining = true

while combining do
--    usePreviousSnap(false)
    if(state == "selectbase") then
        -- Initial step

        -- Check to see if more than 1 exist.  If not, abort process completely.
        cactpairs = regionFindAllNoFindException(cactuarRegion, minicact);
        cactuar = minicact
        if(#cactpairs < 2) then
            cactpairs = regionFindAllNoFindException(cactuarRegion, gigacact);
            cactuar = gigacact
        end
        if(#cactpairs < 2) then
            cactpairs = regionFindAllNoFindException(cactuarRegion, kingcact);
            cactuar = kingcact
        end

        if(#cactpairs < 2) then
            combining = false
            state = "end"
        else
            for i,m in ipairs(cactpairs) do
                click(m)
                wait(1)
                break;
            end

            state = "selectunitsscreen"
        end
    elseif (state == "selectunitsscreen") then
        waitClick(emptybase, 5)
        wait(1)

        state = "selectunit"
    elseif (state == "selectunit") then
        cactuarRegion:wait(cactuar, 5)
        click(cactuarRegion:getLastMatch())

        click(okbtn)
        wait(1)

        state = "unitselected"
    elseif (state == "unitselected") then
        waitClick(fusebtn, 5)
        wait(1)

        state = "fusing"
    elseif (state == "fusing") then
        wait(2)
        click(Location(screenwidth/2, screenheight/2))
        waitClick(skipbtnen, 20)
        wait(1)
        waitClick(skipbtndis, 10)
        wait(1)

        if(exists(enhanceunits, 10)) then
            click(backbtn)
        end
        wait(1)

        state = "selectbase"
    else
        break
    end


--    if exists(multisummon, 0) then
--        click(getLastMatch())
--    end
end